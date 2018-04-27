#tag Class
Protected Class ConfigurationFactory
	#tag Method, Flags = &h0
		Sub AddFile(file As FolderItem)
		  
		  Me.files.Append(file)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(path As String)
		  
		  Me.AddFile(GetFolderItem(path))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function bnrbotVersion() As String
		  
		  Dim platformName As String = App.PlatformName()
		  Dim platformVersion As String = App.PlatformVersion()
		  
		  Dim mb As New MemoryBlock( &H26 + LenB( platformName + platformVersion ) )
		  
		  mb.LittleEndian = True
		  
		  mb.Int32Value( &H00 ) = App.MajorVersion
		  mb.Int32Value( &H04 ) = App.MinorVersion
		  mb.Int32Value( &H08 ) = App.BugVersion
		  mb.Int32Value( &H0C ) = App.NonReleaseVersion
		  mb.Int32Value( &H10 ) = App.StageCode
		  mb.DoubleValue( &H14 ) = App.BuildDate.TotalSeconds
		  mb.DoubleValue( &H1C ) = App.BuildDate.GMTOffset
		  mb.CString( &H24 ) = App.PlatformName()
		  mb.CString( &H25 + LenB( platformName ) ) = platformVersion
		  
		  Return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStream(stream As BinaryStream)
		  
		  stream.LittleEndian = True
		  
		  Dim formatWarning As String = stream.ReadCString()
		  Dim formatVersion As UInt8 = stream.ReadUInt8()
		  
		  If StrComp(formatWarning, Me.WarningConst, 0) <> 0 Then
		    Logger.WriteLine(True, "Format warning string has been modified !!")
		  End If
		  
		  Logger.WriteLine(True, "Format version is [" + Format(formatVersion, "-#") + "]")
		  
		  Select Case formatVersion
		  Case 0
		    Me.DigestStreamV0(stream)
		    
		  Case 1
		    Me.DigestStreamV1(stream)
		    
		  Case 2
		    Me.DigestStreamV2(stream)
		    
		  Case Else
		    Logger.WriteLine(True, "Unrecognized format version")
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStream(stream As TextInputStream, fileName As String)
		  
		  Dim fileNameType As String = NthField( fileName, ".", CountFields( fileName, "." ))
		  Dim fileNameSection As String = Left( fileName, Len( fileName ) - Len( fileNameType ) - 1 )
		  
		  Logger.WriteLine( True, "Format section is [" + fileNameSection + "] of type [" + fileNameType + "]" )
		  
		  Select Case fileNameSection
		  Case "Keys"
		    Me.DigestStreamKeys( stream, fileNameType )
		    
		  Case Else
		    Logger.WriteLine( True, "Unrecognized format section [" + fileNameSection + "]" )
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStreamKeys(stream As TextInputStream, fileType As String)
		  
		  If fileType <> "txt" Then
		    Logger.WriteLine( True, "Unrecognized keys format type [" + fileType + "]" )
		    Return
		  End If
		  
		  ReDim Me.gameKeys( -1 )
		  
		  While Not stream.EOF()
		    Me.gameKeys.Append( New GameKey( stream.ReadLine() ))
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStreamV0(stream As BinaryStream)
		  
		  Do Until stream.EOF()
		    
		    Dim section As UInt32 = stream.ReadUInt32()
		    
		    Select Case section
		    Case Me.V2SectionGlobal
		      
		      Dim options As UInt8 = stream.ReadUInt8()
		      
		      Me.globalConfig.CheckForUpdates      = ( BitAnd(options, &H01) > 0 )
		      Me.globalConfig.MinimizeToTray       = ( BitAnd(options, &H02) > 0 )
		      Me.globalConfig.PingRangesFlushRight = ( BitAnd(options, &H04) > 0 )
		      
		      Dim pingRangeCount As UInt16 = stream.ReadUInt16()
		      Dim prBarCount, prBarColorId, prLowVal, prHighVal As UInt32
		      Dim pr As PingRange
		      
		      While pingRangeCount > 0 And Not stream.EOF()
		        pingRangeCount = pingRangeCount - 1
		        
		        prBarCount   = stream.ReadUInt32()
		        prBarColorId = stream.ReadUInt32()
		        prLowVal     = stream.ReadUInt32()
		        prHighVal    = stream.ReadUInt32()
		        
		        pr = New PingRange(prLowVal, prHighVal, prBarCount, prBarColorId)
		        
		        Me.pingRanges.Append(pr)
		      Wend
		      
		    Case Me.V2SectionConfiguration
		      
		      Dim config As New Configuration()
		      
		      config.alias              = stream.ReadCString()
		      config.username           = stream.ReadCString()
		      config.password           = stream.ReadCString()
		      config.bnetHost           = stream.ReadCString()
		      config.bnlsHost           = stream.ReadCString()
		      config.product            = stream.ReadUInt32()
		      config.productVersionCode = stream.ReadUInt32()
		      config.gameKey1           = stream.ReadCString()
		      config.gameKey2           = stream.ReadCString()
		      config.gameKeyOwner       = stream.ReadCString()
		      config.email              = stream.ReadCString()
		      config.homeChannel        = stream.ReadCString()
		      config.timestampMode      = stream.ReadUInt8()
		      config.pingSpoof          = stream.ReadUInt32()
		      
		      Dim options As UInt32 = stream.ReadUInt32()
		      
		      config.bnlsEnabled              = ( BitAnd(options, &H0001) > 0 )
		      config.gameKeySpawn             = ( BitAnd(options, &H0002) > 0 )
		      config.autoRejoinOnKick         = ( BitAnd(options, &H0004) > 0 )
		      config.logNetwork               = ( BitAnd(options, &H0008) > 0 )
		      config.udpEnabled               = ( BitAnd(options, &H0010) > 0 )
		      // &H0020 = Use BNLS for version check; we use the bnlsEnabled setting so we ignore this bit
		      // &H0040 = Enable CBNET; this protocol is not used by any BNRBot version so we ignore this bit
		      config.logJoinLeave             = ( BitAnd(options, &H0080) > 0 )
		      config.utf8Messages             = ( BitAnd(options, &H0100) > 0 )
		      config.preventDuplicateMessages = ( BitAnd(options, &H0200) > 0 )
		      config.muteBanKickUnban         = ( BitAnd(options, &H0400) > 0 )
		      config.confirmClanMemberRemoval = ( BitAnd(options, &H0800) > 0 )
		      config.createAccountBeforeLogon = ( BitAnd(options, &H1000) > 0 )
		      config.muteUserInChannelUpdates = Not ( BitAnd(options, &H2000) > 0 )
		      config.init6Protocol            = False
		      
		      Call stream.ReadCString() // CBNET host; this protocol is not used so we ignore this
		      
		      config.proxyMode = stream.ReadUInt8()
		      config.proxyHost = stream.ReadCString()
		      
		      Me.profiles.Append(config)
		      
		    Case Else
		      Logger.WriteLine(True, "Failed to parse stream due to unrecognized section id [0x" + App.HexPad(section) + "]")
		      Return
		      
		    End Select
		    
		  Loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStreamV1(stream As BinaryStream)
		  
		  Do Until stream.EOF()
		    
		    Dim section As UInt32 = stream.ReadUInt32()
		    
		    Select Case section
		    Case Me.V2SectionGlobal
		      
		      Dim options As UInt8 = stream.ReadUInt8()
		      
		      Me.globalConfig.CheckForUpdates      = ( BitAnd(options, &H01) > 0 )
		      Me.globalConfig.MinimizeToTray       = ( BitAnd(options, &H02) > 0 )
		      Me.globalConfig.PingRangesFlushRight = ( BitAnd(options, &H04) > 0 )
		      
		      Dim pingRangeCount As UInt16 = stream.ReadUInt16()
		      Dim prBarCount, prBarColorId, prLowVal, prHighVal As UInt32
		      Dim pr As PingRange
		      
		      While pingRangeCount > 0 And Not stream.EOF()
		        pingRangeCount = pingRangeCount - 1
		        
		        prBarCount   = stream.ReadUInt32()
		        prBarColorId = stream.ReadUInt32()
		        prLowVal     = stream.ReadUInt32()
		        prHighVal    = stream.ReadUInt32()
		        
		        pr = New PingRange(prLowVal, prHighVal, prBarCount, prBarColorId)
		        
		        Me.pingRanges.Append(pr)
		      Wend
		      
		      Dim messageBlacklistCount As UInt16 = stream.ReadUInt16()
		      Dim blmsgMode As UInt8, blmsgPattern As String
		      Dim blmsg As StringSearch
		      
		      While messageBlacklistCount > 0 And Not stream.EOF()
		        messageBlacklistCount = messageBlacklistCount - 1
		        
		        blmsgMode    = stream.ReadUInt8()
		        blmsgPattern = stream.ReadCString()
		        
		        blmsg = New StringSearch(blmsgMode, blmsgPattern)
		        
		        Me.messageBlacklist.Append(blmsg)
		      Wend
		      
		    Case Me.V2SectionConfiguration
		      
		      Dim config As New Configuration()
		      
		      config.alias              = stream.ReadCString()
		      config.username           = stream.ReadCString()
		      config.password           = stream.ReadCString()
		      config.bnetHost           = stream.ReadCString()
		      config.bnlsHost           = stream.ReadCString()
		      config.product            = stream.ReadUInt32()
		      config.productVersionCode = stream.ReadUInt32()
		      config.gameKey1           = stream.ReadCString()
		      config.gameKey2           = stream.ReadCString()
		      config.gameKeyOwner       = stream.ReadCString()
		      config.email              = stream.ReadCString()
		      config.homeChannel        = stream.ReadCString()
		      config.timestampMode      = stream.ReadUInt8()
		      config.pingSpoof          = stream.ReadUInt32()
		      
		      Dim options As UInt32 = stream.ReadUInt32()
		      
		      config.bnlsEnabled              = ( BitAnd(options, &H0001) > 0 )
		      config.gameKeySpawn             = ( BitAnd(options, &H0002) > 0 )
		      config.autoRejoinOnKick         = ( BitAnd(options, &H0004) > 0 )
		      config.logNetwork               = ( BitAnd(options, &H0008) > 0 )
		      config.udpEnabled               = ( BitAnd(options, &H0010) > 0 )
		      // &H0020 = Use BNLS for version check; we use the bnlsEnabled setting so we ignore this bit
		      config.logJoinLeave             = ( BitAnd(options, &H0040) > 0 )
		      config.utf8Messages             = ( BitAnd(options, &H0080) > 0 )
		      config.preventDuplicateMessages = ( BitAnd(options, &H0100) > 0 )
		      config.muteBanKickUnban         = ( BitAnd(options, &H0200) > 0 )
		      config.confirmClanMemberRemoval = ( BitAnd(options, &H0400) > 0 )
		      config.createAccountBeforeLogon = ( BitAnd(options, &H0800) > 0 )
		      config.muteUserInChannelUpdates = Not ( BitAnd(options, &H1000) > 0 )
		      config.init6Protocol            = False
		      
		      config.proxyMode = stream.ReadUInt8()
		      config.proxyHost = stream.ReadCString()
		      
		      Me.profiles.Append(config)
		      
		    Case Else
		      Logger.WriteLine(True, "Failed to parse stream due to unrecognized section id [0x" + App.HexPad(section) + "]")
		      Return
		      
		    End Select
		    
		  Loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DigestStreamV2(stream As BinaryStream)
		  
		  Do Until stream.EOF()
		    
		    Dim section As UInt32 = stream.ReadUInt32()
		    
		    Select Case section
		    Case Me.V2SectionGlobal
		      
		      Dim options As UInt8 = stream.ReadUInt8()
		      
		      Me.globalConfig.CheckForUpdates      = ( BitAnd(options, &H01) > 0 )
		      Me.globalConfig.MinimizeToTray       = ( BitAnd(options, &H02) > 0 )
		      Me.globalConfig.PingRangesFlushRight = ( BitAnd(options, &H04) > 0 )
		      
		      Dim pingRangeCount As UInt16 = stream.ReadUInt16()
		      Dim prBarCount, prBarColorId, prLowVal, prHighVal As UInt32
		      Dim pr As PingRange
		      
		      While pingRangeCount > 0 And Not stream.EOF()
		        pingRangeCount = pingRangeCount - 1
		        
		        prBarCount   = stream.ReadUInt32()
		        prBarColorId = stream.ReadUInt32()
		        prLowVal     = stream.ReadUInt32()
		        prHighVal    = stream.ReadUInt32()
		        
		        pr = New PingRange(prLowVal, prHighVal, prBarCount, prBarColorId)
		        
		        Me.pingRanges.Append(pr)
		      Wend
		      
		      Dim messageBlacklistCount As UInt16 = stream.ReadUInt16()
		      Dim blmsgMode As UInt8, blmsgPattern As String
		      Dim blmsg As StringSearch
		      
		      While messageBlacklistCount > 0 And Not stream.EOF()
		        messageBlacklistCount = messageBlacklistCount - 1
		        
		        blmsgMode    = stream.ReadUInt8()
		        blmsgPattern = stream.ReadCString()
		        
		        blmsg = New StringSearch(blmsgMode, blmsgPattern)
		        
		        Me.messageBlacklist.Append(blmsg)
		      Wend
		      
		    Case Me.V2SectionConfiguration
		      
		      Dim config As New Configuration()
		      
		      config.alias              = stream.ReadCString()
		      config.username           = stream.ReadCString()
		      config.password           = stream.ReadCString()
		      config.bnetHost           = stream.ReadCString()
		      config.reconnectInterval  = stream.ReadUInt32()
		      config.bnlsHost           = stream.ReadCString()
		      config.product            = stream.ReadUInt32()
		      config.productVersionCode = stream.ReadUInt32()
		      config.gameKey1           = stream.ReadCString()
		      config.gameKey2           = stream.ReadCString()
		      config.gameKeyOwner       = stream.ReadCString()
		      config.email              = stream.ReadCString()
		      config.homeChannel        = stream.ReadCString()
		      config.timestampMode      = stream.ReadUInt8()
		      config.pingSpoof          = stream.ReadUInt32()
		      
		      Dim options As UInt32 = stream.ReadUInt32()
		      
		      config.bnlsEnabled              = ( BitAnd(options, &H0001) > 0 )
		      config.gameKeySpawn             = ( BitAnd(options, &H0002) > 0 )
		      config.autoRejoinOnKick         = ( BitAnd(options, &H0004) > 0 )
		      config.logNetwork               = ( BitAnd(options, &H0008) > 0 )
		      config.udpEnabled               = ( BitAnd(options, &H0010) > 0 )
		      // &H0020 = Use BNLS for version check; we use the bnlsEnabled setting so we ignore this bit
		      config.logJoinLeave             = ( BitAnd(options, &H0040) > 0 )
		      config.utf8Messages             = ( BitAnd(options, &H0080) > 0 )
		      config.preventDuplicateMessages = ( BitAnd(options, &H0100) > 0 )
		      config.muteBanKickUnban         = ( BitAnd(options, &H0200) > 0 )
		      config.confirmClanMemberRemoval = ( BitAnd(options, &H0400) > 0 )
		      config.createAccountBeforeLogon = ( BitAnd(options, &H0800) > 0 )
		      config.muteUserInChannelUpdates = Not ( BitAnd(options, &H1000) > 0 )
		      config.init6Protocol            = ( BitAnd(options, &H2000) > 0 )
		      
		      config.proxyMode = stream.ReadUInt8()
		      config.proxyHost = stream.ReadCString()
		      
		      Me.profiles.Append(config)
		      
		    Case Else
		      Logger.WriteLine(True, "Failed to parse stream due to unrecognized section id [0x" + App.HexPad(section) + "]")
		      Return
		      
		    End Select
		    
		  Loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAllConfigs()
		  
		  Logger.WriteLine(True, "Reading user configuration...")
		  
		  Me.ResetDefaults()
		  
		  For Each file As FolderItem In Me.files
		    Me.ProcessConfigFile(file)
		  Next
		  
		  Logger.WriteLine(True, "User configuration has been read")
		  
		  Logger.Write(True, "Configurations=" + Format(UBound(Me.profiles) + 1, "-#") + " ")
		  If Me.globalConfig = Nil Then Logger.Write(False, "GlobalConfig=0 ") Else Logger.Write(False, "GlobalConfig=1 ")
		  Logger.Write(False, "Keys=" + Format(UBound(Me.gameKeys) + 1, "-#") + " ")
		  Logger.Write(False, "MessageBlacklist=" + Format(UBound(Me.messageBlacklist) + 1, "-#") + " ")
		  Logger.Write(False, "PingRanges=" + Format(UBound(Me.pingRanges) + 1, "-#"))
		  Logger.WriteLine(False, "")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessConfigFile(file As FolderItem)
		  
		  If file = Nil Then Return
		  
		  If file.Exists = False Then
		    Logger.WriteLine(True, "File does not exist [" + file.AbsolutePath + "]")
		    Return
		  End If
		  
		  If file.IsReadable = False Then
		    Logger.WriteLine(True, "File not readable [" + file.AbsolutePath + "]")
		    Return
		  End If
		  
		  Logger.WriteLine(True, "Opening file [" + file.AbsolutePath + "]...")
		  
		  If NthField( file.AbsolutePath, ".", CountFields( file.AbsolutePath, "." )) = "txt" Then
		    
		    Dim stream As TextInputStream = TextInputStream.Open( file )
		    
		    If stream = Nil Or stream.LastErrorCode <> 0 Then
		      Logger.WriteLine(True, "Failed to open [" + file.AbsolutePath + "] due to stream error " + Format( stream.LastErrorCode, "-#" ))
		      Return
		    End If
		    
		    Me.DigestStream( stream, file.Name )
		    
		    stream.Close()
		    
		  Else
		    
		    Dim stream As BinaryStream = BinaryStream.Open( file, False )
		    
		    If stream = Nil Or stream.LastErrorCode <> 0 Then
		      Logger.WriteLine(True, "Failed to open [" + file.AbsolutePath + "] due to stream error " + Format( stream.LastErrorCode, "-#" ))
		      Return
		    End If
		    
		    Me.DigestStream( stream )
		    
		    stream.Close()
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFile(file As FolderItem)
		  
		  Dim i As Integer = UBound(Me.files)
		  While i >= 0
		    If Me.files(i) = file Then
		      Me.files.Remove(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFile(path As String)
		  
		  Me.RemoveFile(GetFolderItem(path))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDefaults()
		  
		  ReDim Me.profiles(-1)
		  
		  ReDim Me.files(-1)
		  
		  Try
		    
		    Me.AddFile(SpecialFolder.ApplicationData.Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.ApplicationData.Child(App.ProjectName()).Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.SharedApplicationData.Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.SharedApplicationData.Child(App.ProjectName()).Child(App.ProjectName() + ".dat"))
		    
		    #If Not TargetWin32 Then
		      Me.AddFile("/etc/" + App.ProjectName() + ".dat")
		      Me.AddFile("/etc/" + Lowercase( App.ProjectName() ) + ".dat")
		      Me.AddFile("/etc/" + App.ProjectName() + "/" + App.ProjectName() + ".dat")
		      Me.AddFile("/etc/" + App.ProjectName() + "/" + Lowercase( App.ProjectName() ) + ".dat")
		      Me.AddFile("/etc/" + Lowercase( App.ProjectName() ) + "/" + App.ProjectName() + ".dat")
		      Me.AddFile("/etc/" + Lowercase( App.ProjectName() ) + "/" + Lowercase( App.ProjectName() ) + ".dat")
		    #EndIf
		    
		    Me.AddFile(App.ExecutableFile.Parent.Child(App.ProjectName() + ".dat"))
		    
		    #If DebugBuild Then
		      Me.AddFile(App.ExecutableFile.Parent.Parent.Child(App.ProjectName() + ".dat"))
		      Me.AddFile(App.ExecutableFile.Parent.Parent.Parent.Child(App.ProjectName() + ".dat"))
		      Me.AddFile(App.ExecutableFile.Parent.Parent.Parent.Child("etc").Child("Keys.txt"))
		    #EndIf
		    
		  Catch error As NilObjectException
		  Catch error As IOException
		  End Try
		  
		  Me.globalConfig = New GlobalConfiguration()
		  
		  ReDim Me.messageBlacklist(-1)
		  
		  ReDim Me.pingRanges(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  
		  Dim fileIterator As FolderItem
		  fileIterator = SpecialFolder.ApplicationData.Child( App.ProjectName() )
		  
		  If fileIterator <> Nil Then
		    If Not fileIterator.Exists Then fileIterator.CreateAsFolder()
		    
		    fileIterator = fileIterator.Child( App.ProjectName() + ".dat" )
		    
		    If fileIterator <> Nil And fileIterator.Exists Then
		      Dim timestamp As New Date()
		      fileIterator.MoveFileTo( fileIterator.Parent.Child( App.ProjectName() + "-" _
		      + Format( timestamp.Year, "000#" ) _
		      + Format( timestamp.Month, "0#" ) _
		      + Format( timestamp.Day, "0#" ) + "-" _
		      + Format( timestamp.Hour, "0#" ) _
		      + Format( timestamp.Minute, "0#" ) + ".dat" ))
		      fileIterator = fileIterator.Parent.Child( App.ProjectName() + ".dat" )
		    End If
		    
		  End If
		  
		  If fileIterator = Nil Then
		    Logger.WriteLine( True, "File object is null when trying to save profiles" )
		    Raise New BotException("File object is null")
		  End If
		  
		  Dim stream As BinaryStream = BinaryStream.Create( fileIterator, True )
		  
		  If stream = Nil Then
		    Logger.WriteLine( True, "Stream object is null for [" + fileIterator.AbsolutePath + "]" )
		    Raise New BotException( "Stream object is null", stream.LastErrorCode )
		  End If
		  
		  stream.LittleEndian = True
		  
		  stream.WriteCString( "DO NOT EDIT OR SAVE THIS FILE MANUALLY" + EndOfLine.Windows )
		  stream.WriteUInt8( 3 ) // Format version
		  
		  Dim buffer As String
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.bnrbotVersion ))
		  buffer = Me.bnrbotVersion()
		  stream.WriteUInt32( LenB( buffer ))
		  stream.Write( buffer )
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.colors ))
		  buffer = Me.globalConfig.Colors.Serialize()
		  stream.WriteUInt32( LenB( buffer ))
		  stream.Write( buffer )
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.gameKeys ))
		  stream.WriteUInt32( UBound( Me.gameKeys ) + 1 )
		  For Each key As GameKey In Me.gameKeys
		    buffer = key.Serialize()
		    stream.WriteUInt8( LenB( buffer ))
		    stream.Write( buffer )
		  Next
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.globalConfig ))
		  stream.WriteBoolean( Me.globalConfig.CheckForUpdates )
		  stream.WriteBoolean( Me.globalConfig.MinimizeToTray )
		  stream.WriteBoolean( Me.globalConfig.PingRangesFlushRight )
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.messageBlacklist ))
		  stream.WriteUInt32( UBound( Me.messageBlacklist ) + 1 )
		  For Each blackMessage As StringSearch In Me.messageBlacklist
		    stream.WriteUInt8( blackMessage.Mode )
		    stream.WriteCString( blackMessage.Pattern )
		  Next
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.pingRanges ))
		  stream.WriteUInt32( UBound( Me.pingRanges ) + 1 )
		  For Each pr As PingRange In Me.pingRanges
		    stream.WriteUInt32( pr.BarColorId )
		    stream.WriteUInt32( pr.BarCount )
		    stream.WriteUInt32( pr.LowestPing )
		    stream.WriteUInt32( pr.HighestPing )
		  Next
		  
		  stream.WriteUInt8( UInt8( ConfigurationFactory.V3Sections.profiles ))
		  stream.WriteUInt32( UBound( Me.profiles ) + 1 )
		  For Each profile As Configuration In Me.profiles
		    buffer = profile.Serialize()
		    stream.WriteUInt32( LenB( buffer ))
		    stream.Write( buffer )
		  Next
		  
		  stream.Close()
		  
		  Logger.WriteLine( True, "Saved [" + Format( UBound( Me.profiles ) + 1, "-#" ) + "] profiles to [" + fileIterator.AbsolutePath + "]" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveKeys()
		  
		  Dim fileIterator As FolderItem
		  
		  For Each fileIterator In Me.files
		    If fileIterator <> Nil And fileIterator.Name = "Keys.txt" Then Exit For
		  Next
		  
		  If fileIterator = Nil Then
		    Logger.WriteLine( True, "File object is null when trying to save keys" )
		    Raise New BotException("File object is null")
		  End If
		  
		  Dim stream As TextOutputStream = TextOutputStream.Create( fileIterator )
		  
		  If stream = Nil Then
		    Logger.WriteLine( True, "Stream object is null for [" + fileIterator.AbsolutePath + "]" )
		    Raise New BotException( "Stream object is null", stream.LastErrorCode )
		  End If
		  
		  For Each key As GameKey In Me.gameKeys
		    stream.WriteLine( key.KeyString() )
		  Next
		  
		  stream.Close()
		  
		  Logger.WriteLine( True, "Saved [" + Format( UBound( Me.gameKeys ) + 1, "-#" ) + "] keys to [" + fileIterator.AbsolutePath + "]" )
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.globalConfig.Colors
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.globalConfig.Colors = value
			  
			End Set
		#tag EndSetter
		colors As ColorSwatch
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		files() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		gameKeys() As GameKey
	#tag EndProperty

	#tag Property, Flags = &h0
		globalConfig As GlobalConfiguration
	#tag EndProperty

	#tag Property, Flags = &h0
		messageBlacklist() As StringSearch
	#tag EndProperty

	#tag Property, Flags = &h0
		pingRanges() As PingRange
	#tag EndProperty

	#tag Property, Flags = &h0
		profiles() As Configuration
	#tag EndProperty


	#tag Constant, Name = V2SectionConfiguration, Type = Double, Dynamic = False, Default = \"&H50524F46", Scope = Private
	#tag EndConstant

	#tag Constant, Name = V2SectionGlobal, Type = Double, Dynamic = False, Default = \"&H434F4E46", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WarningConst, Type = String, Dynamic = False, Default = \"EDIT THIS FILE WITH BNRBOT\x2C DO NOT MODIFY THIS FILE YOURSELF.", Scope = Private
	#tag EndConstant


	#tag Enum, Name = V3Sections, Type = UInt8, Flags = &h0
		bnrbotVersion
		  colors
		  gameKeys
		  globalConfig
		  messageBlacklist
		  pingRanges
		profiles
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
