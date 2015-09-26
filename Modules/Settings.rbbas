#tag Module
Protected Module Settings
	#tag Method, Flags = &h21
		Private Sub AppendLoadError(Line As String)
		  
		  Settings.LoadErrors = Settings.LoadErrors + Line
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendSaveError(Line As String)
		  
		  Settings.LoadErrors = Settings.LoadErrors + Line
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CheckFiles()
		  
		  Dim Result As String
		  
		  Dim FoundBNCSUtil As Boolean = False
		  Dim FoundCheckRevisionDLL As Boolean = False
		  Dim FoundLockdown(19) As Boolean
		  Dim FoundLockdowns As Boolean = False
		  Dim FoundVerCheck(7) As Boolean
		  Dim FoundVerChecks As Boolean = False
		  
		  Dim i, j, k As Integer
		  
		  Dim Folder As FolderItem
		  Dim FoldersToCheck() As FolderItem
		  
		  Settings.HashFolder = Nil
		  
		  #If DebugBuild = True Then
		    FoldersToCheck.Append(GetFolderItem("").Parent)
		  #Else
		    FoldersToCheck.Append(GetFolderItem(""))
		  #EndIf
		  
		  Dim sTmp As String
		  Dim varPATH() As String = Split(Globals.GetSystemPathVariable(), ";")
		  For Each sTmp In varPATH
		    Folder = GetFolderItem(sTmp)
		    If Folder <> Nil Then FoldersToCheck.Append(Folder)
		  Next
		  
		  For Each Folder In FoldersToCheck
		    If FoundBNCSUtil = False And Folder <> Nil And Folder.Child("BNCSutil.dll") <> Nil _
		      And Folder.Child("BNCSutil.dll").Exists = True Then FoundBNCSUtil = True
		      If FoundCheckRevisionDLL = False And Folder <> Nil And Folder.Child("CheckRevision.dll") <> Nil _
		        And Folder.Child("CheckRevision.dll").Exists = True Then FoundCheckRevisionDLL = True
		        If Settings.HashFolder = Nil And Folder <> Nil And Folder.Child("Hashes") <> Nil _
		          And Folder.Child("Hashes").Exists = True Then Settings.HashFolder = Folder.Child("Hashes")
		          If FoundBNCSUtil = True And FoundCheckRevisionDLL = True And Settings.HashFolder <> Nil Then Exit For
		  Next
		  
		  ReDim FoldersToCheck(-1)
		  If Settings.HashFolder <> Nil Then
		    i = 1
		    While i < Settings.HashFolder.Count
		      If Settings.HashFolder.Item(i) <> Nil Then FoldersToCheck.Append(Settings.HashFolder.Item(i))
		      i = i + 1
		    Wend
		  End If
		  
		  j = 0
		  k = 0
		  For Each Folder In FoldersToCheck
		    If Left(Folder.Name, 14) = "lockdown-IX86-" And Right(Folder.Name, 4) = ".dll" Then
		      i = Val(Mid(Folder.Name, 15, Len(Folder.Name) - 18))
		      If i >= 00 And i <= UBound(FoundLockdown) Then
		        FoundLockdown(i) = True
		        j = j + 1
		      End If
		    End If
		    If Left(Folder.Name, 9) = "ver-IX86-" And Right(Folder.Name, 4) = ".dll" Then
		      i = Val(Mid(Folder.Name, 10, Len(Folder.Name) - 18))
		      If i >= 0 And i <= UBound(FoundVerCheck) Then
		        FoundVerCheck(i) = True
		        k = k + 1
		      End If
		    End If
		    If j > UBound(FoundLockdown) And k > UBound(FoundVerCheck) Then Exit For
		  Next
		  FoundLockdowns = (j > UBound(FoundLockdown))
		  FoundVerChecks = (k > UBound(FoundVerCheck))
		  
		  // We're finally done checking every file, except for the true hash files (we only
		  // checked for the Hashes folder, not each individual hash folder plus files).
		  
		  If FoundBNCSUtil = False Then Result = Result + "Cannot find BNCSutil.dll on your system." + EndOfLine
		  If FoundCheckRevisionDLL = False Then Result = Result + "Cannot find CheckRevision.dll on your system." + EndOfLine
		  If FoundLockdowns = False Then Result = Result + "One or more lockdown-IX86-##.dll files were not found on your system." + EndOfLine
		  If FoundVerChecks = False Then Result = Result + "One or more ver-IX86-#.dll files were not found on your system." + EndOfLine
		  
		  Settings.FileCheckResults = Result
		  
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
		Protected Function GetHashFiles(Product As UInt32, DLLName As String, ByRef sPathToDLL As String) As String()
		  
		  Dim Result(3) As String
		  Dim iProduct As UInt32 = Product
		  
		  If Settings.HashFolder = Nil Then Settings.CheckFiles()
		  If Settings.HashFolder = Nil Then Return Result
		  
		  If LenB(DLLName) > 0 Then
		    Dim Extension As String = NthField(DLLName, ".", CountFields(DLLName, "."))
		    sPathToDLL = Settings.HashFolder.Child(Left(DLLName, Len(DLLName) - Len(Extension)) + "dll").AbsolutePath
		  End If
		  
		  If iProduct = Packets.BNETProduct_SEXP Then iProduct = Packets.BNETProduct_STAR
		  If iProduct = Packets.BNETProduct_D2XP Then iProduct = Packets.BNETProduct_D2DV
		  If iProduct = Packets.BNETProduct_W3XP Then iProduct = Packets.BNETProduct_WAR3
		  
		  Dim sProduct As String = MemClass.WriteDWORD(iProduct, False)
		  If ChrSearchB(sProduct, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz", False) = False Then _
		  sProduct = MemClass.HexPrefix(iProduct, "0x", 8)
		  
		  Dim Base As FolderItem = Settings.HashFolder.Child(sProduct)
		  
		  If Base = Nil Then Return Result
		  If Base.Directory = False Then Return Result
		  If Base.Exists = False Then
		    Base.CreateAsFolder()
		    Return Result
		  End If
		  
		  Select Case iProduct
		  Case Packets.BNETProduct_D2DV, Packets.BNETProduct_D2XP
		    If Base.Child("Game.exe") <> Nil Then Result(0) = Base.Child("Game.exe").AbsolutePath
		    If Base.Child("Bnclient.dll") <> Nil Then Result(1) = Base.Child("Bnclient.dll").AbsolutePath
		    If Base.Child("D2Client.dll") <> Nil Then Result(2) = Base.Child("D2Client.dll").AbsolutePath
		    Result(3) = ""
		    
		  Case Packets.BNETProduct_DRTL
		    If Base.Child("Diablo.exe") <> Nil Then Result(0) = Base.Child("Diablo.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("DRTL.bin") <> Nil Then Result(3) = Base.Child("DRTL.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_DSHR
		    If Base.Child("Diablo_s.exe") <> Nil Then Result(0) = Base.Child("Diablo_s.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("DSHR.bin") <> Nil Then Result(3) = Base.Child("DSHR.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_JSTR
		    If Base.Child("StarcraftJ.exe") <> Nil Then Result(0) = Base.Child("StarcraftJ.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("JSTR.bin") <> Nil Then Result(3) = Base.Child("JSTR.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_SSHR
		    If Base.Child("Starcraft_s.exe") <> Nil Then Result(0) = Base.Child("Starcraft_s.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("SSHR.bin") <> Nil Then Result(3) = Base.Child("SSHR.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_STAR, Packets.BNETProduct_SEXP
		    If Base.Child("Starcraft.exe") <> Nil Then Result(0) = Base.Child("Starcraft.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("STAR.bin") <> Nil Then Result(3) = Base.Child("STAR.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_W2BN
		    If Base.Child("Warcraft II BNE.exe") <> Nil Then Result(0) = Base.Child("Warcraft II BNE.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Battle.snp") <> Nil Then Result(2) = Base.Child("Battle.snp").AbsolutePath
		    If Base.Child("W2BN.bin") <> Nil Then Result(3) = Base.Child("W2BN.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_W3DM
		    If Base.Child("War3Demo.exe") <> Nil Then Result(0) = Base.Child("War3Demo.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("Game.dll") <> Nil Then Result(2) = Base.Child("Game.dll").AbsolutePath
		    If Base.Child("W3DM.bin") <> Nil Then Result(3) = Base.Child("W3DM.bin").AbsolutePath
		    
		  Case Packets.BNETProduct_WAR3, Packets.BNETProduct_W3XP
		    If Base.Child("war3.exe") <> Nil Then Result(0) = Base.Child("war3.exe").AbsolutePath
		    If Base.Child("Storm.dll") <> Nil Then Result(1) = Base.Child("Storm.dll").AbsolutePath
		    If Base.Child("game.dll") <> Nil Then Result(2) = Base.Child("game.dll").AbsolutePath
		    Result(3) = ""
		    
		  Case Else
		  End Select
		  
		  Return Result
		  
		End Function
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
		Protected Function MustRunAsAdmin() As Boolean
		  
		  // DEPRECATED
		  // This function is no longer used anywhere but can be used later.
		  
		  Return (OSVersionInformation.IsVista() = True Or OSVersionInformation.Is7() = True Or _
		  OSVersionInformation.Is2008() = True)
		  
		End Function
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
		        
		      Case Settings.SectionConfiguration
		        Configs.Append(New Configuration())
		        Configs(UBound(Configs)).Name = Buffer.ReadCString()
		        Configs(UBound(Configs)).Username = Buffer.ReadCString()
		        Configs(UBound(Configs)).Password = Buffer.ReadCString()
		        Configs(UBound(Configs)).BNETHost = Buffer.ReadCString()
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
		        
		        Call Buffer.ReadCString() // Unused String, used to be CBNET
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
		  Buffer.WriteBYTE(&H00)
		  
		  // Section Global:
		  Buffer.WriteDWORD(Settings.SectionGlobal)
		  
		  Options = &H00000000
		  If Settings.PrefCheckForUpdates = True Then Options = BitOr(Options, &H01)
		  If Settings.PrefMinimizeToTray = True Then Options = BitOr(Options, &H02)
		  If Settings.PrefPingRangesFlushRight = True Then Options = BitOr(Options, &H04)
		  Buffer.WriteBYTE(Options)
		  
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
		  
		  // Section Profile(s):
		  For Each Config As Configuration In Settings.Configurations
		    Buffer.WriteDWORD(Settings.SectionConfiguration)
		    
		    Buffer.WriteCString(Config.Name)
		    Buffer.WriteCString(Config.Username)
		    Buffer.WriteCString(Config.Password)
		    Buffer.WriteCString(Config.BNETHost)
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
		    // Unused Bit 0x40, used to be CBNET
		    If Config.ShowJoinLeaveMessages = True Then Options = BitOr(Options, &H80)
		    If Config.EnableUTF8 = True Then Options = BitOr(Options, &H100)
		    If Config.SpamPrevention = True Then Options = BitOr(Options, &H200)
		    If Config.IgnoreBanKickUnban = True Then Options = BitOr(Options, &H400)
		    If Config.ConfirmRemovingClanMembers = True Then Options = BitOr(Options, &H800)
		    If Config.CreateAccountsFirst = True Then Options = BitOr(Options, &H1000)
		    If Config.ShowUserUpdateMessages = True Then Options = BitOr(Options, &H2000)
		    Buffer.WriteDWORD(Options)
		    
		    Buffer.WriteCString("") // Unused String, used to be CBNET
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
		  
		  If App.ExecutableFile <> Nil Then
		    Dim Extension As String = NthField(App.ExecutableFile.Name, ".", CountFields(App.ExecutableFile.Name, "."))
		    Filename = Left(Filename, Len(Filename) - Len(Extension)) + "dat"
		  End If
		  
		  If Folder.Child("BNRBot v2.dat").Exists = True Then _
		  Folder.Child("BNRBot v2.dat").Name = Filename
		  
		  Return Folder.Child(Filename)
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Configurations() As Configuration
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FileCheckResults As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected HashFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LoadErrors As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrefCheckForUpdates As Boolean
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
