#tag Module
Protected Module Battlenet
	#tag Method, Flags = &h1
		Protected Function bncsutilVersion() As String
		  
		  Soft Declare Function bncsutil_getVersionString Lib Battlenet.libBNCSUtil ( outBuf As Ptr ) As Integer
		  
		  Dim buf As New MemoryBlock( 8 )
		  
		  Call bncsutil_getVersionString( buf )
		  
		  Return buf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub changePassword(client As BNETClient)
		  
		  Const TYPE_OLS      = &H00
		  Const TYPE_NLS_BETA = &H01
		  Const TYPE_NLS      = &H02
		  
		  Select Case client.state.logonType
		  Case TYPE_OLS
		    
		    client.socBNET.Write(Packets.CreateBNET_SID_CHANGEPASSWORD(_
		    client.state.clientToken, client.state.serverToken, _
		    Battlenet.passwordDataOLS(client.state.password, _
		    client.state.clientToken, client.state.serverToken), _
		    Battlenet.passwordDataOLS(client.state.passwordNew, _
		    client.state.clientToken, client.state.serverToken), _
		    client.state.username))
		    
		  Case TYPE_NLS_BETA, TYPE_NLS
		    
		    GUIUpdateEvent.InternalMessage("DEBUG: NLS", ChatMessage.InternalFlagDebug, client)
		    
		  Case Else
		    
		    Raise New BattlenetException("Undefined logon type '" + Format(client.state.logonType, "-#") + "'")
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getClientToken() As UInt32
		  
		  Dim mem As New MemoryBlock(4)
		  
		  mem.UInt8Value(0) = Floor(Rnd() * 255)
		  mem.UInt8Value(1) = Floor(Rnd() * 255)
		  mem.UInt8Value(2) = Floor(Rnd() * 255)
		  mem.UInt8Value(3) = Floor(Rnd() * 255)
		  
		  Return mem.UInt32Value(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub getDefaultChannel(product As UInt32, ByRef flags As Uint32, ByRef channel As String)
		  
		  flags = Packets.FLAG_FIRSTJOIN
		  
		  If Battlenet.isDiablo2(product) Then
		    flags = BitOr(flags, Packets.FLAG_DIABLO2JOIN)
		  End If
		  
		  Select Case product
		  Case Battlenet.Product_STAR
		    channel = "StarCraft"
		  Case Battlenet.Product_SEXP
		    channel = "Brood War"
		  Case Battlenet.Product_W2BN
		    channel = "WarCraft II"
		  Case Battlenet.Product_D2DV
		    channel = "Diablo II"
		  Case Battlenet.Product_D2XP
		    channel = "Lord of Destruction"
		  Case Battlenet.Product_JSTR
		    channel = "StarCraft"
		  Case Battlenet.Product_WAR3
		    channel = "WarCraft III"
		  Case Battlenet.Product_W3XP
		    channel = "Frozen Throne"
		  Case Battlenet.Product_DRTL
		    channel = "Diablo"
		  Case Battlenet.Product_DSHR
		    channel = "Diablo"
		  Case Battlenet.Product_SSHR
		    channel = "StarCraft"
		  Case Battlenet.Product_W3DM
		    channel = "WarCraft III"
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + Format(product, "-#") + "' to default channel")
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getKeyData(strKey As String, clientToken As UInt32, serverToken As UInt32) As String
		  
		  // For use with 0x51 SID_AUTH_CHECK
		  
		  Soft Declare Function kd_quick Lib Battlenet.libBNCSUtil (_
		  key As Ptr, clientToken As UInt32, serverToken As UInt32, _
		  publicVal As Ptr, productVal As Ptr, privateVal As Ptr, privateValLen As UInt32) _
		  As Boolean
		  
		  Dim mKey As New MemoryBlock(LenB(strKey) + 1)
		  mKey.CString(0) = strKey
		  
		  Dim mPublicVal As New MemoryBlock(4)
		  Dim mProductVal As New MemoryBlock(4)
		  Dim mPrivateVal As New MemoryBlock(20)
		  
		  Dim returnVal As Boolean = kd_quick(_
		  mKey, clientToken, serverToken, _
		  mPublicVal, mProductVal, mPrivateVal, mPrivateVal.Size)
		  
		  If returnVal = False Then Return ""
		  
		  Dim mReturnVal As New MemoryBlock(16 + mPrivateVal.Size)
		  
		  mReturnVal.UInt32Value(0) = LenB(strKey)
		  mReturnVal.UInt32Value(4) = mProductVal.UInt32Value(0)
		  mReturnVal.UInt32Value(8) = mPublicVal.UInt32Value(0)
		  mReturnVal.UInt32Value(12) = 0
		  mReturnVal.StringValue(16, mPrivateVal.Size) = mPrivateVal.StringValue(0, mPrivateVal.Size)
		  
		  Return mReturnVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getKeyData(strKey As String, ByRef productVal As UInt32, ByRef publicVal As UInt32, ByRef privateVal As MemoryBlock) As Boolean
		  
		  Soft Declare Function kd_init   Lib Battlenet.libBNCSUtil () As Boolean
		  Soft Declare Function kd_create Lib Battlenet.libBNCSUtil (cdkey As CString, keyLength As Integer) As Integer
		  Soft Declare Function kd_free   Lib Battlenet.libBNCSUtil (decoder As Integer) As Boolean
		  
		  Soft Declare Function kd_product    Lib Battlenet.libBNCSUtil (decoder As Integer) As Integer
		  Soft Declare Function kd_val1       Lib Battlenet.libBNCSUtil (decoder As Integer) As Integer
		  Soft Declare Function kd_val2Length Lib Battlenet.libBNCSUtil (decoder As Integer) As Integer
		  Soft Declare Function kd_val2       Lib Battlenet.libBNCSUtil (decoder As Integer) As Integer
		  Soft Declare Function kd_longVal2   Lib Battlenet.libBNCSUtil (decoder As Integer, out As Ptr) As Integer
		  
		  If Not kd_init() Then Return False
		  
		  Dim decoder As Integer = kd_create(strKey, Len(strKey))
		  
		  If decoder = -1 Then Return False
		  
		  Try
		    
		    productVal = kd_product(decoder)
		    publicVal  = kd_val1(decoder)
		    
		    privateVal = New MemoryBlock(kd_val2Length(decoder))
		    
		    If privateVal.Size <= 4 Then
		      privateVal.Int32Value(0) = kd_val2(decoder)
		    Else
		      privateVal.Size = kd_longVal2(decoder, privateVal)
		    End If
		    
		  Finally
		    Call kd_free(decoder)
		  End Try
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getLocalIP() As UInt32
		  
		  Dim soc As New TCPSocket()
		  Dim mem As New MemoryBlock(4)
		  
		  mem.UInt8Value(0) = Val(NthField(soc.LocalAddress, ".", 4))
		  mem.UInt8Value(1) = Val(NthField(soc.LocalAddress, ".", 3))
		  mem.UInt8Value(2) = Val(NthField(soc.LocalAddress, ".", 2))
		  mem.UInt8Value(3) = Val(NthField(soc.LocalAddress, ".", 1))
		  
		  Return mem.UInt32Value(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getTimezoneBias() As UInt32
		  
		  Dim o As New Date()
		  
		  Return (0 - o.GMTOffset) * 60
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GreetBot(client As BNETClient, message As ChatMessage, username As String) As ChatResponse
		  
		  If client = Nil Then Return Nil
		  
		  Dim buffer As String = client.config.greetMessage
		  
		  If Len(buffer) = 0 Then Return Nil
		  
		  Dim user As ChannelUser = client.state.channelUsers.Lookup(username, Nil)
		  Dim acl As UserAccess = client.getAcl(username)
		  
		  If client.config.greetAclExclusive = True And acl = Nil Then Return Nil
		  
		  Dim oTimestamp As New Date()
		  Dim timestamp As String = oTimestamp.AbbreviatedDate + " " + oTimestamp.ShortTime
		  
		  buffer = ReplaceAll(buffer, "%{user}", username)
		  buffer = ReplaceAll(buffer, "%{ping}", Format(message.ping, "-#"))
		  If user = Nil Then
		    buffer = ReplaceAll(buffer, "%{game}", "(null)")
		  Else
		    buffer = ReplaceAll(buffer, "%{game}", Battlenet.productToStr(Battlenet.strToProduct(MidB(user.metadata, 1, 4)), True))
		  End If
		  If client.state = Nil Or Len(client.state.channel) = 0 Then
		    buffer = ReplaceAll(buffer, "%{channel}", "(null)")
		  Else
		    buffer = ReplaceAll(buffer, "%{channel}", client.state.channel)
		  End If
		  buffer = ReplaceAll(buffer, "%{time}", timestamp)
		  
		  Return New ChatResponse(ChatResponse.TYPE_TALK, buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function isDiablo2(product As UInt32) As Boolean
		  
		  Select Case product
		  Case Battlenet.Product_D2DV
		  Case Battlenet.Product_D2XP
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function isWarcraft3(product As UInt32) As Boolean
		  
		  Select Case product
		  Case Battlenet.Product_W3DM
		  Case Battlenet.Product_W3XP
		  Case Battlenet.Product_WAR3
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function keyProductToStr(value As UInt32) As String
		  
		  Select Case value
		  Case &H00000001, &H00000002
		    Return "StarCraft"
		  Case &H00000004
		    Return "WarCraft II BNE"
		  Case &H00000005
		    Return "Generic Alpha/Beta Key"
		  Case &H00000006, &H00000007
		    Return "Diablo II"
		  Case &H00000009
		    Return "Diablo II Stress Test"
		  Case &H0000000A, &H0000000C
		    Return "Diablo II Lord of Destruction"
		  Case &H000000D
		    Return "WarCraft III Beta"
		  Case &H000000E, &H0000000F
		    Return "WarCraft III"
		  Case &H00000011
		    Return "WarCraft III Frozen Throne Beta"
		  Case &H00000012, &H00000013
		    Return "WarCraft III Frozen Throne"
		  Case &H00000015
		    Return "WoW Burning Crusade"
		  Case &H00000016
		    Return "WoW 14-Day Trial"
		  Case &H00000017
		    Return "StarCraft Digital Download"
		  Case &H00000018
		    Return "Diablo II Digital Download"
		  Case &H00000019
		    Return "Diablo II Lord of Destruction Digital Download"
		  Case &H0000001A
		    Return "WoW Wrath of the Lich King"
		  Case &H0000001C
		    Return "StarCraft II"
		  Case &H0000001E
		    Return "Diablo III"
		  Case &H00000024
		    Return "Heroes of the Storm"
		  Case Else
		    Return "Unknown"
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub login(client As BNETClient)
		  
		  Const TYPE_OLS      = &H00
		  Const TYPE_NLS_BETA = &H01
		  Const TYPE_NLS      = &H02
		  
		  Select Case client.state.logonType
		  Case TYPE_OLS
		    
		    client.socBNET.Write(Packets.CreateBNET_SID_LOGONRESPONSE2(_
		    client.state.clientToken, client.state.serverToken, _
		    Battlenet.passwordDataOLS(client.state.password, _
		    client.state.clientToken, client.state.serverToken), _
		    client.state.username))
		    
		  Case TYPE_NLS_BETA, TYPE_NLS
		    
		    client.socBNET.Write( Packets.CreateBNET_SID_AUTH_ACCOUNTLOGON( client.state.nls.AccountLogon() ))
		    
		  Case Else
		    
		    Raise New BattlenetException("Undefined logon type '" + Format(client.state.logonType, "-#") + "'")
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function needsGameKey1(product As UInt32) As Boolean
		  
		  Select Case product
		  Case Battlenet.Product_D2DV
		  Case Battlenet.Product_D2XP
		  Case Battlenet.Product_JSTR
		  Case Battlenet.Product_SEXP
		  Case Battlenet.Product_STAR
		  Case Battlenet.Product_W2BN
		  Case Battlenet.Product_W3XP
		  Case Battlenet.Product_WAR3
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function needsGameKey2(product As UInt32) As Boolean
		  
		  Select Case product
		  Case Battlenet.Product_D2XP
		  Case Battlenet.Product_W3XP
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function onlineNameToAccountName(onlineName As String, ourProduct As UInt32, ignoreRealm As Boolean, supplementalRealms As String) As String
		  
		  Dim realmChr As String = "#"
		  
		  Dim accountName As String = onlineName
		  
		  Dim d2Asterisk As Integer = InStr(accountName, "*")
		  If Battlenet.isDiablo2(ourProduct) And d2Asterisk > 0 Then
		    accountName = Mid(accountName, d2Asterisk + 1)
		  End If
		  
		  If ignoreRealm = False Then
		    
		    Dim realms() As String
		    Dim extraRealms() As String
		    Dim cursor As Integer
		    
		    If Battlenet.isWarcraft3(ourProduct) Then
		      realms.Append(realmChr + "USWest")
		      realms.Append(realmChr + "USEast")
		      realms.Append(realmChr + "Asia")
		      realms.Append(realmChr + "Europe")
		    Else
		      realms.Append(realmChr + "Lordaeron")
		      realms.Append(realmChr + "Azeroth")
		      realms.Append(realmChr + "Kalimdor")
		      realms.Append(realmChr + "Northrend")
		    End If
		    
		    extraRealms = Split(supplementalRealms, ",")
		    
		    For Each realm As String In extraRealms
		      If Left(realm, Len(realmChr)) <> realmChr Then realms.Append(realmChr + realm) Else realms.Append(realm)
		    Next
		    
		    Do Until UBound(realms) < 0
		      
		      cursor = InStr(accountName, realms.Pop())
		      If cursor > 0 Then
		        accountName = Left(accountName, cursor - 1)
		        Exit Do
		      End If
		      
		    Loop
		    
		  End If
		  
		  Return accountName
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function passwordDataOLS(password As String, clientToken As UInt32, serverToken As UInt32) As String
		  
		  Soft Declare Sub doubleHashPassword Lib Battlenet.libBNCSUtil (_
		  password As Ptr,clientToken As UInt32, serverToken As UInt32, _
		  passwordHash As Ptr)
		  
		  Dim mPassword As New MemoryBlock(LenB(password) + 1)
		  mPassword.CString(0) = password
		  
		  Dim mPasswordHash As New MemoryBlock(20)
		  
		  doubleHashPassword(mPassword, clientToken, serverToken, mPasswordHash)
		  
		  Return mPasswordHash
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function productToBNET(value As UInt32) As UInt32
		  
		  Select Case value
		  Case 1
		    Return Battlenet.Product_STAR
		  Case 2
		    Return Battlenet.Product_SEXP
		  Case 3
		    Return Battlenet.Product_W2BN
		  Case 4
		    Return Battlenet.Product_D2DV
		  Case 5
		    Return Battlenet.Product_D2XP
		  Case 6
		    Return Battlenet.Product_JSTR
		  Case 7
		    Return Battlenet.Product_WAR3
		  Case 8
		    Return Battlenet.Product_W3XP
		  Case 9
		    Return Battlenet.Product_DRTL
		  Case 10
		    Return Battlenet.Product_DSHR
		  Case 11
		    Return Battlenet.Product_SSHR
		  Case 12
		    Return Battlenet.Product_W3DM
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + Format(value, "-#") + "' to BNET product id")
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function productToBNLS(value As UInt32) As UInt32
		  
		  Select Case value
		  Case Battlenet.Product_STAR
		    Return 1
		  Case Battlenet.Product_SEXP
		    Return 2
		  Case Battlenet.Product_W2BN
		    Return 3
		  Case Battlenet.Product_D2DV
		    Return 4
		  Case Battlenet.Product_D2XP
		    Return 5
		  Case Battlenet.Product_JSTR
		    Return 6
		  Case Battlenet.Product_WAR3
		    Return 7
		  Case Battlenet.Product_W3XP
		    Return 8
		  Case Battlenet.Product_DRTL
		    Return 9
		  Case Battlenet.Product_DSHR
		    Return 10
		  Case Battlenet.Product_SSHR
		    Return 11
		  Case Battlenet.Product_W3DM
		    Return 12
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + Format(value, "-#") + "' to BNLS product id")
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function productToStr(value As UInt32, fullName As Boolean) As String
		  
		  Select Case value
		  Case Battlenet.Product_CHAT
		    Return "Telnet"
		  Case Battlenet.Product_D2DV
		    Return "Diablo II"
		  Case Battlenet.Product_D2XP
		    If fullName = False Then Return "Lord of Destruction" Else Return "Diablo II Lord of Destruction"
		  Case Battlenet.Product_DRTL
		    Return "Diablo"
		  Case Battlenet.Product_DSHR
		    Return "Diablo Shareware"
		  Case Battlenet.Product_JSTR
		    Return "Starcraft Japanese"
		  Case Battlenet.Product_SEXP
		    If fullName = False Then Return "Brood War" Else Return "Starcraft Broodwar"
		  Case Battlenet.Product_SSHR
		    Return "Starcraft Shareware"
		  Case Battlenet.Product_STAR
		    Return "Starcraft"
		  Case Battlenet.Product_W2BN
		    Return "Warcraft II"
		  Case Battlenet.Product_W3DM
		    Return "Warcraft III Demo"
		  Case Battlenet.Product_W3XP
		    Return "Frozen Throne"
		  Case Battlenet.Product_WAR3
		    Return "Warcraft III"
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + Format(value, "-#") + "' to product string")
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub resetPassword(client As BNETClient)
		  
		  Const TYPE_OLS      = &H00
		  Const TYPE_NLS_BETA = &H01
		  Const TYPE_NLS      = &H02
		  
		  Select Case client.state.logonType
		  Case TYPE_OLS
		    
		    client.socBNET.Write(Packets.CreateBNET_SID_RESETPASSWORD(_
		    client.state.username, client.state.email))
		    
		  Case TYPE_NLS_BETA, TYPE_NLS
		    
		    GUIUpdateEvent.InternalMessage("DEBUG: NLS", ChatMessage.InternalFlagDebug, client)
		    
		  Case Else
		    
		    Raise New BattlenetException("Undefined logon type '" + Format(client.state.logonType, "-#") + "'")
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setEmail(client As BNETClient)
		  
		  Const TYPE_OLS      = &H00
		  Const TYPE_NLS_BETA = &H01
		  Const TYPE_NLS      = &H02
		  
		  Select Case client.state.logonType
		  Case TYPE_OLS
		    
		    client.socBNET.Write(Packets.CreateBNET_SID_LOGONRESPONSE2(_
		    client.state.clientToken, client.state.serverToken, _
		    Battlenet.passwordDataOLS(client.state.password, _
		    client.state.clientToken, client.state.serverToken), _
		    client.state.username))
		    
		  Case TYPE_NLS_BETA, TYPE_NLS
		    
		    client.socBNET.Write( Packets.CreateBNET_SID_AUTH_ACCOUNTLOGON( client.state.nls.AccountLogon() ))
		    
		  Case Else
		    
		    Raise New BattlenetException("Undefined logon type '" + Format(client.state.logonType, "-#") + "'")
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function strToBool(value As String) As Boolean
		  
		  Select Case value
		  Case "1"
		  Case "On"
		  Case "True"
		  Case "Y"
		  Case "Yes"
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function strToGameKey(value As String) As String
		  
		  // Filter 'value' through A-Za-z0-9 pattern forming 'key'.
		  // This removes spaces, dashes, and other anomalies.
		  
		  Dim key As String = ""
		  Dim i As Integer
		  Dim j As Integer = Len(value)
		  Dim k As Integer
		  
		  For i = 1 To j
		    k = Asc(Mid(value, i, 1))
		    If (k >= &H41 And k <= &H5A) Or (k >= &H61 And k <= &H7A) Or (k >= &H30 And k <= &H39) Then
		      key = key + Chr(k)
		    End If
		  Next
		  
		  Return Uppercase(key) // The final 'key' should be uppercase.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function strToPlatform(value As String) As UInt32
		  
		  Select Case ReplaceAll(value, " ", "")
		  Case "IX86", "68XI", "windows", "win32", "win64", "win", "linux", "unix"
		    Return Battlenet.Platform_IX86
		  Case "PMAC", "CAMP", "powerpc", "classicmac", "macclassic"
		    Return Battlenet.Platform_PMAC
		  Case "XMAC", "CAMX", "macintosh", "mac", "osx", "macosx", "macos"
		    Return Battlenet.Platform_XMAC
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + value + "' to platform id")
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function strToProduct(value As String) As UInt32
		  
		  Select Case ReplaceAll(value, " ", "")
		  Case "CHAT", "TAHC", "Telnet", "Plaintext", "Text"
		    Return Battlenet.Product_CHAT
		  Case "D2DV", "VD2D", "D2", "Diablo2", "DiabloII"
		    Return Battlenet.Product_D2DV
		  Case "D2XP", "PX2D", "LOD", "LordOfDestruction", "Diablo2LOD", "DiabloIILOD", "D2EXP"
		    Return Battlenet.Product_D2XP
		  Case "DRTL", "LTRD", "D1", "Diablo", "Diablo1", "DiabloI"
		    Return Battlenet.Product_DRTL
		  Case "DSHR", "RHSD", "DS", "DiabloShareware", "Diablo1Shareware", "DiabloIShareware", "DSHW", "DSW"
		    Return Battlenet.Product_DSHR
		  Case "JSTR", "RTSJ", "SCJ", "StarcraftJapan", "StarcraftJapanese", "SCJapan", "SCJapanese"
		    Return Battlenet.Product_JSTR
		  Case "SEXP", "PXES", "BW", "StarcraftBroodwar", "SCBroodwar", "SCBW", "SCEXP"
		    Return Battlenet.Product_SEXP
		  Case "SSHR", "RHSS", "SS", "StarcraftShareware", "SCShareware", "SCSW", "SCSH"
		    Return Battlenet.Product_SSHR
		  Case "STAR", "RATS", "SC", "Starcraft", "StarcraftOriginal", "StarcraftOrig"
		    Return Battlenet.Product_STAR
		  Case "W2BN", "NB2W", "W2", "WarcraftII", "Warcraft2", "WarcraftIIBNE", "Warcraft2BNE", "WC2"
		    Return Battlenet.Product_W2BN
		  Case "W3DM", "MD3W", "W3D", "WarcraftIIIDemo", "Warcraft3Demo", "WC3Demo"
		    Return Battlenet.Product_W3DM
		  Case "W3XP", "PX3W", "TFT", "WarcraftIIITFT", "Warcraft3TFT", "W3EXP", "WC3EXP", "WC3TFT", "W3TFT"
		    Return Battlenet.Product_W3XP
		  Case "WAR3", "3RAW", "W3", "WarcraftIII", "WarcraftIIIROC", "WC3"
		    Return Battlenet.Product_WAR3
		  Case Else
		    Raise New BattlenetException("Unable to translate value '" + value + "' to product id")
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = libBNCSUtil, Type = String, Dynamic = False, Default = \"", Scope = Protected
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libbncsutil.so"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"bncsutil.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libbncsutil.so"
	#tag EndConstant

	#tag Constant, Name = Platform_IX86, Type = Double, Dynamic = False, Default = \"&H49583836", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Platform_PMAC, Type = Double, Dynamic = False, Default = \"&H504D4143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Platform_XMAC, Type = Double, Dynamic = False, Default = \"&H584D4143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_CHAT, Type = Double, Dynamic = False, Default = \"&H43484154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_D2DV, Type = Double, Dynamic = False, Default = \"&H44324456", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_D2XP, Type = Double, Dynamic = False, Default = \"&H44325850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_DRTL, Type = Double, Dynamic = False, Default = \"&H4452544C", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_DSHR, Type = Double, Dynamic = False, Default = \"&H44534852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_JSTR, Type = Double, Dynamic = False, Default = \"&H4A535452", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_SEXP, Type = Double, Dynamic = False, Default = \"&H53455850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_SSHR, Type = Double, Dynamic = False, Default = \"&H53534852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_STAR, Type = Double, Dynamic = False, Default = \"&H53544152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_W2BN, Type = Double, Dynamic = False, Default = \"&H5732424E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_W3DM, Type = Double, Dynamic = False, Default = \"&H5733444D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_W3XP, Type = Double, Dynamic = False, Default = \"&H57335850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = Product_WAR3, Type = Double, Dynamic = False, Default = \"&H57415233", Scope = Protected
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
