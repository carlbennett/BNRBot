#tag Module
Protected Module Settings
	#tag Method, Flags = &h21
		Private Sub AppendLoadError(Line As String)
		  
		  Settings.LoadErrors = Settings.LoadErrors + Line + EndOfLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendSaveError(Line As String)
		  
		  Settings.LoadErrors = Settings.LoadErrors + Line + EndOfLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateFile(File As FolderItem, DefaultData As String) As Boolean
		  
		  If File = Nil Then Return False
		  If File.IsWriteable = False Then Return False
		  If File.Directory = True Then Return False
		  Dim IO As TextOutputStream = TextOutputStream.Create(File)
		  If IO = Nil Then Return False
		  IO.Write(DefaultData)
		  IO.Close()
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetProductFiles(Product As UInt32, DLLName As String, ByRef sPathToDLL As String) As String()
		  
		  Dim Results() As String
		  Dim iProduct As UInt32 = Product
		  
		  If Settings.ProductFiles = Nil Then Settings.InitCoreFiles()
		  If Settings.ProductFiles = Nil Then Return Results
		  
		  If LenB(DLLName) > 0 Then
		    Dim Extension As String = NthField(DLLName, ".", CountFields(DLLName, "."))
		    sPathToDLL = Settings.ProductFiles.Child(Left(DLLName, Len(DLLName) - Len(Extension)) + "dll").AbsolutePath
		  End If
		  
		  If iProduct = Packets.BNETProduct_SEXP Then iProduct = Packets.BNETProduct_STAR
		  If iProduct = Packets.BNETProduct_D2XP Then iProduct = Packets.BNETProduct_D2DV
		  If iProduct = Packets.BNETProduct_W3XP Then iProduct = Packets.BNETProduct_WAR3
		  
		  Dim sProduct As String = MemClass.WriteDWORD(iProduct, False)
		  If ChrSearchB(sProduct, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", False) = False Then _
		  sProduct = MemClass.HexPrefix(iProduct, "0x", 8)
		  
		  Dim Base As FolderItem = Settings.ProductFiles.Child(sProduct)
		  
		  If Base = Nil Then Return Results
		  If Base.Directory = False Then Return Results
		  If Base.Exists = False Then
		    Base.CreateAsFolder()
		    Return Results
		  End If
		  
		  Select Case iProduct
		  Case Packets.BNETProduct_D2DV, Packets.BNETProduct_D2XP
		    If Base.Child("Game.exe") <> Nil Then Results.Append( Base.Child("Game.exe").AbsolutePath )
		    
		  Case Packets.BNETProduct_DRTL
		    If Base.Child("Diablo.exe") <> Nil Then Results.Append( Base.Child("Diablo.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("DRTL.bin") <> Nil Then Results.Append( Base.Child("DRTL.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_DSHR
		    If Base.Child("Diablo_s.exe") <> Nil Then Results.Append( Base.Child("Diablo_s.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("DSHR.bin") <> Nil Then Results.Append( Base.Child("DSHR.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_JSTR
		    If Base.Child("StarcraftJ.exe") <> Nil Then Results.Append( Base.Child("StarcraftJ.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("JSTR.bin") <> Nil Then Results.Append( Base.Child("JSTR.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_SSHR
		    If Base.Child("Starcraft_s.exe") <> Nil Then Results.Append( Base.Child("Starcraft_s.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("SSHR.bin") <> Nil Then Results.Append( Base.Child("SSHR.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_STAR, Packets.BNETProduct_SEXP
		    If Base.Child("Starcraft.exe") <> Nil Then Results.Append( Base.Child("Starcraft.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("STAR.bin") <> Nil Then Results.Append( Base.Child("STAR.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_W2BN
		    If Base.Child("Warcraft II BNE.exe") <> Nil Then Results.Append( Base.Child("Warcraft II BNE.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Battle.snp") <> Nil Then Results.Append( Base.Child("Battle.snp").AbsolutePath )
		    If Base.Child("W2BN.bin") <> Nil Then Results.Append( Base.Child("W2BN.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_W3DM
		    If Base.Child("War3Demo.exe") <> Nil Then Results.Append(  Base.Child("War3Demo.exe").AbsolutePath )
		    If Base.Child("Storm.dll") <> Nil Then Results.Append( Base.Child("Storm.dll").AbsolutePath )
		    If Base.Child("Game.dll") <> Nil Then Results.Append( Base.Child("Game.dll").AbsolutePath )
		    If Base.Child("W3DM.bin") <> Nil Then Results.Append( Base.Child("W3DM.bin").AbsolutePath )
		    
		  Case Packets.BNETProduct_WAR3, Packets.BNETProduct_W3XP
		    If Base.Child("Warcraft III.exe") <> Nil Then Results.Append( Base.Child("Warcraft III.exe").AbsolutePath )
		    
		  Case Else
		  End Select
		  
		  Return Results
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitCoreFiles()
		  
		  // **objective:**
		  // check debug work dir
		  // check non-debug work dir
		  // check path env var
		  // find bncsutil
		  // find checkrev dll
		  // find hashes
		  
		  Dim fileIterator, fileIterator2, fileObjects() As FolderItem
		  Dim s, strings() As String
		  
		  // collect file objects
		  
		  #If DebugBuild Then
		    fileObjects.Append( App.ExecutableFile.Parent.Parent.Child( "bin" ))
		  #EndIf
		  
		  fileObjects.Append( App.ExecutableFile.Parent )
		  fileObjects.Append( App.ExecutableFile.Parent.Parent )
		  
		  strings = Split( System.EnvironmentVariable( "PATH" ), ";" )
		  
		  For Each s In strings
		    fileIterator = GetFolderItem( s )
		    If fileIterator <> Nil And fileIterator.Exists Then
		      fileObjects.Append( fileIterator )
		    End If
		  Next
		  
		  // scan file object list
		  
		  For Each fileIterator In fileObjects
		    
		    If fileIterator = Nil Then Continue For
		    If Not fileIterator.Exists Then Continue For
		    
		    If Not fileIterator.Directory Then
		      
		      If Settings.BNCSUtil = Nil And fileIterator.Name = App.BNCSUtil Then Settings.BNCSUtil = fileIterator
		      If Settings.CheckRevDLL = Nil And fileIterator.Name = "CheckRevision.dll" Then Settings.CheckRevDLL = fileIterator
		      
		    Else
		      
		      fileIterator2 = fileIterator.Child( App.BNCSUtil )
		      If Settings.BNCSUtil = Nil And fileIterator2 <> Nil And fileIterator2.Exists Then Settings.BNCSUtil = fileIterator2
		      
		      fileIterator2 = fileIterator.Child( "CheckRevision.dll" )
		      If Settings.CheckRevDLL = Nil And fileIterator2 <> Nil And fileIterator2.Exists Then Settings.CheckRevDLL = fileIterator2
		      
		      fileIterator2 = fileIterator.Child( "Hashes" )
		      If Settings.ProductFiles = Nil And fileIterator2 <> Nil And fileIterator2.Exists Then Settings.ProductFiles = fileIterator2
		      
		    End If
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Load(File As FolderItem)
		  
		  Settings.LoadErrors = ""
		  
		  If File = Nil Then File = Settings.SettingsFile()
		  If File = Nil Then
		    Settings.AppendLoadError("Could not open the settings file because the file handle returned null.")
		    Return
		  End If
		  If File.Directory = True Then
		    Settings.AppendLoadError("Could not open the settings file because it is actually a directory.")
		    Return
		  End If
		  If File.Exists = False Then
		    Settings.AppendLoadError("Could not open the settings file because it does not exist yet.")
		    Settings.LoadDefaults()
		    Return
		  End If
		  If File.IsReadable = False Then
		    Settings.AppendLoadError("Could not open the settings file because your system reports it to be corrupted.")
		    Return
		  End If
		  
		  Dim Buffer As BinaryStream = BinaryStream.Open(File, False)
		  If Buffer = Nil Then
		    Settings.AppendLoadError("Could not open the settings file because the data handle returned null.")
		    Return
		  End If
		  
		  Dim Data As String = Buffer.Read(Buffer.Length)
		  Buffer.Close()
		  
		  Settings.Parse(Data)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadDefaultPingRanges()
		  
		  ReDim Settings.PrefPingRanges(-1)
		  
		  Dim pr As PingRange
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Green
		  pr.BarCount    = 1
		  pr.LowestPing  = 1
		  pr.HighestPing = 150
		  Settings.PrefPingRanges.Append(pr)
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Green
		  pr.BarCount    = 2
		  pr.LowestPing  = 151
		  pr.HighestPing = 250
		  Settings.PrefPingRanges.Append(pr)
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Yellow
		  pr.BarCount    = 3
		  pr.LowestPing  = 251
		  pr.HighestPing = 350
		  Settings.PrefPingRanges.Append(pr)
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Yellow
		  pr.BarCount    = 4
		  pr.LowestPing  = 351
		  pr.HighestPing = 450
		  Settings.PrefPingRanges.Append(pr)
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Red
		  pr.BarCount    = 5
		  pr.LowestPing  = 451
		  pr.HighestPing = 550
		  Settings.PrefPingRanges.Append(pr)
		  
		  pr             = New PingRange()
		  pr.BarColor    = PingRange.BarColor_Red
		  pr.BarCount    = 6
		  pr.LowestPing  = 551
		  pr.HighestPing = &H7FFFFFFF
		  Settings.PrefPingRanges.Append(pr)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadDefaults()
		  
		  For Each Config As Configuration In Settings.Configurations()
		    Config.BNET.DoDisconnect(False)
		  Next
		  
		  ReDim Settings.Configurations(-1)
		  
		  Settings.PrefCheckForUpdates = True
		  Settings.PrefGlobalFontFamily = "Arial"
		  Settings.PrefGlobalFontSize = "12px"
		  ReDim Settings.PrefMessageBlacklist(-1)
		  Settings.PrefMinimizeToTray = False
		  Settings.PrefPingRangesFlushRight = False
		  
		  Settings.LoadDefaultPingRanges()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Parse(Data As String)
		  
		  Dim Buffer As New MemClass(Data, True)
		  If Buffer = Nil Then
		    Settings.AppendLoadError("Could not parse the settings file because the binary reader returned null.")
		    Return
		  End If
		  
		  // First, get rid of the warning to idiots who try to edit the binary file:
		  Call Buffer.ReadCString()
		  
		  // Define some variables:
		  Dim Section As UInt32
		  Dim Options As UInt32
		  Dim Configs() As Configuration
		  Dim PingRanges() As PingRange
		  Dim MessageBlacklist() As Pair
		  
		  // Second, retrieve the version of the file and then try to parse the file:
		  Dim Version As Byte = Buffer.ReadBYTE()
		  
		  Select Case Version
		  Case 0
		    While Buffer.EOF() = False
		      
		      Section = Buffer.ReadDWORD()
		      Select Case Section
		      Case Settings.SectionGlobal
		        Options = Buffer.ReadBYTE()
		        Settings.PrefCheckForUpdates = (BitAnd(Options, &H01) > 0)
		        Settings.PrefMinimizeToTray = (BitAnd(Options, &H02) > 0)
		        Settings.PrefPingRangesFlushRight = (BitAnd(Options, &H04) > 0)
		        
		        // Font Settings (version 0 doesn't have this)
		        Settings.PrefGlobalFontFamily = "Arial"
		        Settings.PrefGlobalFontSize = "12px"
		        
		        // Ping Ranges
		        ReDim PingRanges(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(PingRanges) + 1 < Options
		          PingRanges.Append(New PingRange())
		          PingRanges(UBound(PingRanges)).BarCount = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).BarColor = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).LowestPing = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).HighestPing = Buffer.ReadDWORD()
		        Wend
		        
		        ReDim MessageBlacklist(-1) // Clear out any previous data (Fail safe check)
		        // Version 0 doesn't have a blacklist
		        
		      Case Settings.SectionConfiguration
		        Configs.Append(New Configuration())
		        Configs(UBound(Configs)).Name = Buffer.ReadCString()
		        Configs(UBound(Configs)).Username = Buffer.ReadCString()
		        Configs(UBound(Configs)).Password = Buffer.ReadCString()
		        Configs(UBound(Configs)).BNETHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).ReconnectInterval = 300000 // Version 0 didn't have this setting
		        Configs(UBound(Configs)).BNLSHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).Product = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).VersionByte = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).CDKey = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyExpansion = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyOwner = Buffer.ReadCString()
		        Configs(UBound(Configs)).EmailAddress = Buffer.ReadCString()
		        Configs(UBound(Configs)).HomeChannel = Buffer.ReadCString()
		        Configs(UBound(Configs)).Timestamp = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).PingSpoof = Buffer.ReadDWORD()
		        
		        Options = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSEnabled = (BitAnd(Options, &H01) > 0)
		        Configs(UBound(Configs)).CDKeySpawn = (BitAnd(Options, &H02) > 0)
		        Configs(UBound(Configs)).AutoRejoinWhenKicked = (BitAnd(Options, &H04) > 0)
		        Configs(UBound(Configs)).VerbosePackets = (BitAnd(Options, &H08) > 0)
		        Configs(UBound(Configs)).EnableUDP = (BitAnd(Options, &H10) > 0)
		        Configs(UBound(Configs)).BNLSVersionCheck = (BitAnd(Options, &H20) > 0)
		        // Unused Bit 0x40, used to be CBNET
		        Configs(UBound(Configs)).ShowJoinLeaveMessages = (BitAnd(Options, &H80) > 0)
		        Configs(UBound(Configs)).EnableUTF8 = (BitAnd(Options, &H100) > 0)
		        Configs(UBound(Configs)).SpamPrevention = (BitAnd(Options, &H200) > 0)
		        Configs(UBound(Configs)).IgnoreBanKickUnban = (BitAnd(Options, &H400) > 0)
		        Configs(UBound(Configs)).ConfirmRemovingClanMembers = (BitAnd(Options, &H800) > 0)
		        Configs(UBound(Configs)).CreateAccountsFirst = (BitAnd(Options, &H1000) > 0)
		        Configs(UBound(Configs)).ShowUserUpdateMessages = (BitAnd(Options, &H2000) > 0)
		        Configs(UBound(Configs)).Init6Protocol = False
		        
		        Call Buffer.ReadCString() // Unused String, used to be CBNET
		        Configs(UBound(Configs)).ProxyType = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).ProxyHost = Buffer.ReadCString()
		        
		      Case Else
		        // The section is unrecognized to us.
		        Settings.AppendLoadError("Could not parse the settings file because it contains at least one (1) bad section.")
		        Exit While
		        
		      End Select
		      
		    Wend
		    
		  Case 1
		    While Buffer.EOF() = False
		      
		      Section = Buffer.ReadDWORD()
		      Select Case Section
		      Case Settings.SectionGlobal
		        Options = Buffer.ReadBYTE()
		        Settings.PrefCheckForUpdates = (BitAnd(Options, &H01) > 0)
		        Settings.PrefMinimizeToTray = (BitAnd(Options, &H02) > 0)
		        Settings.PrefPingRangesFlushRight = (BitAnd(Options, &H04) > 0)
		        
		        // Font Settings (version 1 doesn't have this)
		        Settings.PrefGlobalFontFamily = "Arial"
		        Settings.PrefGlobalFontSize = "12px"
		        
		        // Ping Ranges
		        ReDim PingRanges(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(PingRanges) + 1 < Options
		          PingRanges.Append(New PingRange())
		          PingRanges(UBound(PingRanges)).BarCount = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).BarColor = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).LowestPing = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).HighestPing = Buffer.ReadDWORD()
		        Wend
		        
		        // Message Blacklist
		        ReDim MessageBlacklist(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(MessageBlacklist) + 1 < Options
		          MessageBlacklist.Append(New Pair(Buffer.ReadBYTE(), Buffer.ReadCString()))
		        Wend
		        
		      Case Settings.SectionConfiguration
		        Configs.Append(New Configuration())
		        Configs(UBound(Configs)).Name = Buffer.ReadCString()
		        Configs(UBound(Configs)).Username = Buffer.ReadCString()
		        Configs(UBound(Configs)).Password = Buffer.ReadCString()
		        Configs(UBound(Configs)).BNETHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).ReconnectInterval = 300000 // Version 1 didn't have this setting
		        Configs(UBound(Configs)).BNLSHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).Product = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).VersionByte = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).CDKey = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyExpansion = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyOwner = Buffer.ReadCString()
		        Configs(UBound(Configs)).EmailAddress = Buffer.ReadCString()
		        Configs(UBound(Configs)).HomeChannel = Buffer.ReadCString()
		        Configs(UBound(Configs)).Timestamp = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).PingSpoof = Buffer.ReadDWORD()
		        
		        Options = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSEnabled = (BitAnd(Options, &H01) > 0)
		        Configs(UBound(Configs)).CDKeySpawn = (BitAnd(Options, &H02) > 0)
		        Configs(UBound(Configs)).AutoRejoinWhenKicked = (BitAnd(Options, &H04) > 0)
		        Configs(UBound(Configs)).VerbosePackets = (BitAnd(Options, &H08) > 0)
		        Configs(UBound(Configs)).EnableUDP = (BitAnd(Options, &H10) > 0)
		        Configs(UBound(Configs)).BNLSVersionCheck = (BitAnd(Options, &H20) > 0)
		        Configs(UBound(Configs)).ShowJoinLeaveMessages = (BitAnd(Options, &H40) > 0)
		        Configs(UBound(Configs)).EnableUTF8 = (BitAnd(Options, &H80) > 0)
		        Configs(UBound(Configs)).SpamPrevention = (BitAnd(Options, &H100) > 0)
		        Configs(UBound(Configs)).IgnoreBanKickUnban = (BitAnd(Options, &H200) > 0)
		        Configs(UBound(Configs)).ConfirmRemovingClanMembers = (BitAnd(Options, &H400) > 0)
		        Configs(UBound(Configs)).CreateAccountsFirst = (BitAnd(Options, &H800) > 0)
		        Configs(UBound(Configs)).ShowUserUpdateMessages = (BitAnd(Options, &H1000) > 0)
		        Configs(UBound(Configs)).Init6Protocol = False
		        
		        Configs(UBound(Configs)).ProxyType = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).ProxyHost = Buffer.ReadCString()
		        
		      Case Else
		        // The section is unrecognized to us.
		        Settings.AppendLoadError("Could not parse the settings file because it contains at least one (1) bad section.")
		        Exit While
		        
		      End Select
		      
		    Wend
		    
		  Case 2
		    While Buffer.EOF() = False
		      
		      Section = Buffer.ReadDWORD()
		      Select Case Section
		      Case Settings.SectionGlobal
		        Options = Buffer.ReadBYTE()
		        Settings.PrefCheckForUpdates = (BitAnd(Options, &H01) > 0)
		        Settings.PrefMinimizeToTray = (BitAnd(Options, &H02) > 0)
		        Settings.PrefPingRangesFlushRight = (BitAnd(Options, &H04) > 0)
		        
		        // Font Settings (version 2 doesn't have this)
		        Settings.PrefGlobalFontFamily = "Arial"
		        Settings.PrefGlobalFontSize = "12px"
		        
		        // Ping Ranges
		        ReDim PingRanges(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(PingRanges) + 1 < Options
		          PingRanges.Append(New PingRange())
		          PingRanges(UBound(PingRanges)).BarCount = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).BarColor = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).LowestPing = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).HighestPing = Buffer.ReadDWORD()
		        Wend
		        
		        // Message Blacklist
		        ReDim MessageBlacklist(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(MessageBlacklist) + 1 < Options
		          MessageBlacklist.Append(New Pair(Buffer.ReadBYTE(), Buffer.ReadCString()))
		        Wend
		        
		      Case Settings.SectionConfiguration
		        Configs.Append(New Configuration())
		        Configs(UBound(Configs)).Name = Buffer.ReadCString()
		        Configs(UBound(Configs)).Username = Buffer.ReadCString()
		        Configs(UBound(Configs)).Password = Buffer.ReadCString()
		        Configs(UBound(Configs)).BNETHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).ReconnectInterval = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).Product = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).VersionByte = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).CDKey = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyExpansion = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyOwner = Buffer.ReadCString()
		        Configs(UBound(Configs)).EmailAddress = Buffer.ReadCString()
		        Configs(UBound(Configs)).HomeChannel = Buffer.ReadCString()
		        Configs(UBound(Configs)).Timestamp = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).PingSpoof = Buffer.ReadDWORD()
		        
		        Options = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSEnabled = (BitAnd(Options, &H01) > 0)
		        Configs(UBound(Configs)).CDKeySpawn = (BitAnd(Options, &H02) > 0)
		        Configs(UBound(Configs)).AutoRejoinWhenKicked = (BitAnd(Options, &H04) > 0)
		        Configs(UBound(Configs)).VerbosePackets = (BitAnd(Options, &H08) > 0)
		        Configs(UBound(Configs)).EnableUDP = (BitAnd(Options, &H10) > 0)
		        Configs(UBound(Configs)).BNLSVersionCheck = (BitAnd(Options, &H20) > 0)
		        Configs(UBound(Configs)).ShowJoinLeaveMessages = (BitAnd(Options, &H40) > 0)
		        Configs(UBound(Configs)).EnableUTF8 = (BitAnd(Options, &H80) > 0)
		        Configs(UBound(Configs)).SpamPrevention = (BitAnd(Options, &H100) > 0)
		        Configs(UBound(Configs)).IgnoreBanKickUnban = (BitAnd(Options, &H200) > 0)
		        Configs(UBound(Configs)).ConfirmRemovingClanMembers = (BitAnd(Options, &H400) > 0)
		        Configs(UBound(Configs)).CreateAccountsFirst = (BitAnd(Options, &H800) > 0)
		        Configs(UBound(Configs)).ShowUserUpdateMessages = (BitAnd(Options, &H1000) > 0)
		        Configs(UBound(Configs)).Init6Protocol = (BitAnd(Options, &H2000) > 0)
		        
		        Configs(UBound(Configs)).ProxyType = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).ProxyHost = Buffer.ReadCString()
		        
		      Case Else
		        // The section is unrecognized to us.
		        Settings.AppendLoadError("Could not parse the settings file because it contains at least one (1) bad section.")
		        Exit While
		        
		      End Select
		      
		    Wend
		    
		  Case 3
		    While Buffer.EOF() = False
		      
		      Section = Buffer.ReadDWORD()
		      Select Case Section
		      Case Settings.SectionGlobal
		        Options = Buffer.ReadBYTE()
		        Settings.PrefCheckForUpdates = (BitAnd(Options, &H01) > 0)
		        Settings.PrefMinimizeToTray = (BitAnd(Options, &H02) > 0)
		        Settings.PrefPingRangesFlushRight = (BitAnd(Options, &H04) > 0)
		        
		        // Font Settings
		        Settings.PrefGlobalFontFamily = Buffer.ReadCString()
		        Settings.PrefGlobalFontSize = Buffer.ReadCString()
		        
		        // Ping Ranges
		        ReDim PingRanges(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(PingRanges) + 1 < Options
		          PingRanges.Append(New PingRange())
		          PingRanges(UBound(PingRanges)).BarCount = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).BarColor = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).LowestPing = Buffer.ReadDWORD()
		          PingRanges(UBound(PingRanges)).HighestPing = Buffer.ReadDWORD()
		        Wend
		        
		        // Message Blacklist
		        ReDim MessageBlacklist(-1) // Clear out any previous data (Fail safe check)
		        Options = Buffer.ReadWORD() // Options is reused as a variable...
		        While UBound(MessageBlacklist) + 1 < Options
		          MessageBlacklist.Append(New Pair(Buffer.ReadBYTE(), Buffer.ReadCString()))
		        Wend
		        
		      Case Settings.SectionConfiguration
		        Configs.Append(New Configuration())
		        Configs(UBound(Configs)).Name = Buffer.ReadCString()
		        Configs(UBound(Configs)).Username = Buffer.ReadCString()
		        Configs(UBound(Configs)).Password = Buffer.ReadCString()
		        Configs(UBound(Configs)).BNETHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).ReconnectInterval = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSHost = Buffer.ReadCString()
		        Configs(UBound(Configs)).Product = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).VersionByte = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).CDKey = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyExpansion = Buffer.ReadCString()
		        Configs(UBound(Configs)).CDKeyOwner = Buffer.ReadCString()
		        Configs(UBound(Configs)).EmailAddress = Buffer.ReadCString()
		        Configs(UBound(Configs)).HomeChannel = Buffer.ReadCString()
		        Configs(UBound(Configs)).Timestamp = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).PingSpoof = Buffer.ReadDWORD()
		        
		        Options = Buffer.ReadDWORD()
		        Configs(UBound(Configs)).BNLSEnabled = (BitAnd(Options, &H01) > 0)
		        Configs(UBound(Configs)).CDKeySpawn = (BitAnd(Options, &H02) > 0)
		        Configs(UBound(Configs)).AutoRejoinWhenKicked = (BitAnd(Options, &H04) > 0)
		        Configs(UBound(Configs)).VerbosePackets = (BitAnd(Options, &H08) > 0)
		        Configs(UBound(Configs)).EnableUDP = (BitAnd(Options, &H10) > 0)
		        Configs(UBound(Configs)).BNLSVersionCheck = (BitAnd(Options, &H20) > 0)
		        Configs(UBound(Configs)).ShowJoinLeaveMessages = (BitAnd(Options, &H40) > 0)
		        Configs(UBound(Configs)).EnableUTF8 = (BitAnd(Options, &H80) > 0)
		        Configs(UBound(Configs)).SpamPrevention = (BitAnd(Options, &H100) > 0)
		        Configs(UBound(Configs)).IgnoreBanKickUnban = (BitAnd(Options, &H200) > 0)
		        Configs(UBound(Configs)).ConfirmRemovingClanMembers = (BitAnd(Options, &H400) > 0)
		        Configs(UBound(Configs)).CreateAccountsFirst = (BitAnd(Options, &H800) > 0)
		        Configs(UBound(Configs)).ShowUserUpdateMessages = (BitAnd(Options, &H1000) > 0)
		        Configs(UBound(Configs)).Init6Protocol = (BitAnd(Options, &H2000) > 0)
		        
		        Configs(UBound(Configs)).ProxyType = Buffer.ReadBYTE()
		        Configs(UBound(Configs)).ProxyHost = Buffer.ReadCString()
		        
		      Case Else
		        // The section is unrecognized to us.
		        Settings.AppendLoadError("Could not parse the settings file because it contains at least one (1) bad section.")
		        Exit While
		        
		      End Select
		      
		    Wend
		  Case Else
		    // The file version is unrecognized to us.
		    Settings.AppendLoadError("Could not parse the settings file because it reports an unrecognized version.")
		    
		  End Select
		  
		  If UBound(Configs) >= 0 Then Settings.Configurations = Configs
		  If UBound(PingRanges) >= 0 Then Settings.PrefPingRanges = PingRanges
		  If UBound(MessageBlacklist) >= 0 Then Settings.PrefMessageBlacklist = MessageBlacklist
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save(File As FolderItem)
		  
		  Settings.SaveErrors = ""
		  
		  If File = Nil Then File = Settings.SettingsFile()
		  If File = Nil Then
		    Settings.AppendSaveError("Could not save the settings file because the file handle returned null.")
		    Return
		  End If
		  If File.Directory = True Then
		    Settings.AppendSaveError("Could not save the settings file because it is actually a directory.")
		    Return
		  End If
		  If Settings.CreateFile(File, "") = False Then
		    Settings.AppendSaveError("Could not save the settings file because it either cannot be created or cannot be erased.")
		    Return
		  End If
		  If File.IsWriteable = False Then
		    Settings.AppendSaveError("Could not save the settings file because your system reports it to be corrupted.")
		    Return
		  End If
		  
		  Dim Buffer As BinaryStream = BinaryStream.Open(File, True)
		  If Buffer = Nil Then
		    Settings.AppendSaveError("Could not save the settings file because the data handle returned null.")
		    Return
		  End If
		  
		  Buffer.Write(Settings.SaveData())
		  Buffer.Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SaveData() As String
		  
		  Dim Buffer As New MemClass(True)
		  If Buffer = Nil Then
		    Settings.AppendSaveError("Could not save the settings file because the binary writer returned null.")
		    Return ""
		  End If
		  
		  // Some temporary variables
		  Dim Options As UInt32
		  
		  // The warning
		  Buffer.WriteCString("EDIT THIS FILE WITH BNRBOT, DO NOT MODIFY THIS FILE YOURSELF.")
		  
		  // File version
		  Buffer.WriteBYTE(&H03)
		  
		  // Section Global:
		  Buffer.WriteDWORD(Settings.SectionGlobal)
		  
		  Options = &H00000000
		  If Settings.PrefCheckForUpdates = True Then Options = BitOr(Options, &H01)
		  If Settings.PrefMinimizeToTray = True Then Options = BitOr(Options, &H02)
		  If Settings.PrefPingRangesFlushRight = True Then Options = BitOr(Options, &H04)
		  Buffer.WriteBYTE(Options)
		  
		  // Font Settings
		  Buffer.WriteCString(Settings.PrefGlobalFontFamily)
		  Buffer.WriteCString(Settings.PrefGlobalFontSize)
		  
		  // Ping Ranges
		  Buffer.WriteWORD(UBound(Settings.PrefPingRanges) + 1)
		  If UBound(Settings.PrefPingRanges) >= 0 Then
		    Options = &H0000 // Reuse Options as our loop variable.
		    While Options <= UBound(Settings.PrefPingRanges) And Options < &HFFFF
		      Buffer.WriteDWORD(Settings.PrefPingRanges(Options).BarCount)
		      Buffer.WriteDWORD(Settings.PrefPingRanges(Options).BarColor)
		      Buffer.WriteDWORD(Settings.PrefPingRanges(Options).LowestPing)
		      Buffer.WriteDWORD(Settings.PrefPingRanges(Options).HighestPing)
		      Options = Options + 1
		    Wend
		  End If
		  
		  // Message Blacklist
		  Buffer.WriteWORD(UBound(Settings.PrefMessageBlacklist) + 1)
		  If UBound(Settings.PrefMessageBlacklist) >= 0 Then
		    Options = &H0000 // Reuse Options as our loop variable.
		    While Options <= UBound(Settings.PrefMessageBlacklist) And Options < &HFFFF
		      Buffer.WriteBYTE(Settings.PrefMessageBlacklist(Options).Left)
		      Buffer.WriteCString(Settings.PrefMessageBlacklist(Options).Right)
		      Options = Options + 1
		    Wend
		  End If
		  
		  // Section Profile(s):
		  For Each Config As Configuration In Settings.Configurations
		    Buffer.WriteDWORD(Settings.SectionConfiguration)
		    
		    Buffer.WriteCString(Config.Name)
		    Buffer.WriteCString(Config.Username)
		    Buffer.WriteCString(Config.Password)
		    Buffer.WriteCString(Config.BNETHost)
		    Buffer.WriteDWORD(Config.ReconnectInterval)
		    Buffer.WriteCString(Config.BNLSHost)
		    Buffer.WriteDWORD(Config.Product)
		    Buffer.WriteDWORD(Config.VersionByte)
		    Buffer.WriteCString(Config.CDKey)
		    Buffer.WriteCString(Config.CDKeyExpansion)
		    Buffer.WriteCString(Config.CDKeyOwner)
		    Buffer.WriteCString(Config.EmailAddress)
		    Buffer.WriteCString(Config.HomeChannel)
		    Buffer.WriteBYTE(Config.Timestamp)
		    Buffer.WriteDWORD(Config.PingSpoof)
		    
		    Options = &H00000000
		    If Config.BNLSEnabled = True Then Options = BitOr(Options, &H01)
		    If Config.CDKeySpawn = True Then Options = BitOr(Options, &H02)
		    If Config.AutoRejoinWhenKicked = True Then Options = BitOr(Options, &H04)
		    If Config.VerbosePackets = True Then Options = BitOr(Options, &H08)
		    If Config.EnableUDP = True Then Options = BitOr(Options, &H10)
		    If Config.BNLSVersionCheck = True Then Options = BitOr(Options, &H20)
		    If Config.ShowJoinLeaveMessages = True Then Options = BitOr(Options, &H40)
		    If Config.EnableUTF8 = True Then Options = BitOr(Options, &H80)
		    If Config.SpamPrevention = True Then Options = BitOr(Options, &H100)
		    If Config.IgnoreBanKickUnban = True Then Options = BitOr(Options, &H200)
		    If Config.ConfirmRemovingClanMembers = True Then Options = BitOr(Options, &H400)
		    If Config.CreateAccountsFirst = True Then Options = BitOr(Options, &H800)
		    If Config.ShowUserUpdateMessages = True Then Options = BitOr(Options, &H1000)
		    If Config.Init6Protocol = True Then Options = BitOr(Options, &H2000)
		    Buffer.WriteDWORD(Options)
		    
		    Buffer.WriteBYTE(Config.ProxyType)
		    Buffer.WriteCString(Config.ProxyHost)
		    
		  Next
		  
		  // Give back all the data:
		  Return Buffer.GetWriteBuffer()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SettingsFile() As FolderItem
		  
		  Dim Folder As FolderItem
		  
		  If App.ExecutableFile <> Nil And SpecialFolder.Applications <> Nil And _
		    InStr(App.ExecutableFile.AbsolutePath, SpecialFolder.Applications.AbsolutePath) > 0 Then
		    If SpecialFolder.ApplicationData.Child("BNRBot v2").Exists = True Then _
		    SpecialFolder.ApplicationData.Child("BNRBot v2").Name = "BNRBot"
		    Folder = SpecialFolder.ApplicationData.Child("BNRBot")
		  Else
		    Folder = GetFolderItem("")
		    #If DebugBuild = True Then Folder = Folder.Parent()
		  End If
		  
		  If Folder = Nil Then Return Nil
		  Dim Filename As String = "BNRBot.dat"
		  
		  If App.ExecutableFile <> Nil And InStr(App.ExecutableFile.Name, ".") > 0 Then
		    Dim Extension As String = NthField(App.ExecutableFile.Name, ".", CountFields(App.ExecutableFile.Name, "."))
		    Filename = Left(Filename, Len(Filename) - Len(Extension)) + "dat"
		  End If
		  
		  If Folder.Child("BNRBot v2.dat").Exists = True Then _
		  Folder.Child("BNRBot v2.dat").Name = Filename
		  
		  Return Folder.Child(Filename)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected BNCSUtil As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CheckRevDLL As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Configurations() As Configuration
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LoadErrors As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefCheckForUpdates As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefGlobalFontFamily As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefGlobalFontSize As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefMessageBlacklist() As Pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefMinimizeToTray As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefPingRanges() As PingRange
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefPingRangesFlushRight As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ProductFiles As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SaveErrors As String
	#tag EndProperty


	#tag Constant, Name = SectionConfiguration, Type = Double, Dynamic = False, Default = \"&H50524F46", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SectionGlobal, Type = Double, Dynamic = False, Default = \"&H434F4E46", Scope = Protected
	#tag EndConstant


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
End Module
#tag EndModule
