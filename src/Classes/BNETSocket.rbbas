#tag Class
Protected Class BNETSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  If Me.Config <> Nil Then
		    Globals.ForceRedraw(MainWindow.lstProfiles)
		    Me.Config.Container.lstUsers_View = Me.Config.Container.lstUsers_View
		    Me.Config.AddChat(True, Colors.Lime, IIf(Me.Init6Protocol, "INIT6", "BNET") + ": Connected to " + Me.RemoteAddress + ".")
		  End If
		  
		  If Me.Config <> Nil And Me.Config.ProxyType <> Configuration.ProxyOff Then
		    Select Case Me.Config.ProxyType
		    Case Configuration.ProxyHTTP
		      If InStr(Config.BNETHost, ":") = 0 Then
		        Me.Send("CONNECT " + Config.BNETHost + ":6112 HTTP/1.1" + Chr(10) + Chr(10))
		      Else
		        Me.Send("CONNECT " + Config.BNETHost + " HTTP/1.1" + Chr(10) + Chr(10))
		      End If
		    Case Configuration.ProxySOCKS4
		      Dim Host As String = Config.BNETHost
		      If InStr(Host, ":") = 0 Then Host = Host + ":6112"
		      Me.Send(ChrB(4) + ChrB(1) + MemClass.WriteWORD(Val(NthField(Host, ":", 2)), False) _
		      + MemClass.WriteDWORD(Globals.IPToDWORD(NthField(Host, ":", 1)), True) + ChrB(0))
		    Case Configuration.ProxySOCKS5
		      Me.Send(ChrB(5) + ChrB(1) + ChrB(0))
		    End Select
		  Else
		    Packets.SendFirstSIDs(Me)
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		  If Me.Config <> Nil And Me.Config.ProxyType <> Configuration.ProxyOff Then
		    
		    Select Case Me.Config.ProxyType
		    Case Configuration.ProxyHTTP
		      If Me.ProxyWait = 0 Then
		        Dim sTmp As String = Left(NthField(Me.Read(1024), " ", 2), 1)
		        If sTmp = "4" Then
		          Me.Config.AddChat(True, Colors.Red, "PROXY: HTTP error #4" + Me.Read(2) + "!")
		          Me.Disconnect()
		        ElseIf sTmp = "2" Then
		          Me.ProxyWait = 1
		          Packets.SendFirstSIDs(Me)
		        End If
		      ElseIf Me.ProxyWait = 1 Then
		        Packets.Receive(Me)
		      End If
		    Case Configuration.ProxySOCKS4
		      If Me.ProxyWait = 0 And Me.BytesAvailable >= 6 Then
		        Dim VN As Byte = AscB(Me.Read(1))
		        Dim CN As Byte = AscB(Me.Read(1))
		        Dim DstPort As UInt16 = MemClass.ReadWORD(Me.Read(2), 1, False)
		        Dim DstIP As String = Globals.DWORDToIP(MemClass.ReadDWORD(Me.Read(4), 1, True))
		        #pragma Unused VN
		        #pragma Unused DstPort
		        Select Case CN
		        Case 90
		          Me.Config.AddChat(True, Colors.Lime, "PROXY: Connected to " + DstIP + ".")
		          Me.ProxyWait = 1
		          Packets.SendFirstSIDs(Me)
		          If Me.BytesAvailable > 0 Then Packets.Receive(Me)
		        Case 91
		          Me.Config.AddChat(True, Colors.Red, "PROXY: Request rejected or failed.")
		          Me.Disconnect()
		        Case 92
		          Me.Config.AddChat(True, Colors.Red, "PROXY: Request rejected because SOCKS server cannot " _
		          + "connect to identd on the client.")
		          Me.Disconnect()
		        Case 93
		          Me.Config.AddChat(True, Colors.Red, "PROXY: request rejected because the client program " _
		          + "and identd report different user-ids.")
		          Me.Disconnect()
		        End Select
		      ElseIf Me.ProxyWait = 1 Then
		        Packets.Receive(Me)
		      End If
		    Case Configuration.ProxySOCKS5
		      If Me.ProxyWait = 0 And Me.BytesAvailable >= 2 Then
		        Dim VN As Byte = AscB(Me.Read(1))
		        Dim MN As Byte = AscB(Me.Read(1))
		        If VN <> 5 Then
		          Me.Config.AddChat(True, Colors.Red, "PROXY: Server sent unexpected SOCKS version (" + Format(VN, "-#") + ")")
		          Me.Disconnect()
		        ElseIf MN <> 0 Then
		          Me.Config.AddChat(True, Colors.Red, "PROXY: Proxy requires authentication (type " + Format(MN, "-#") + ")")
		          Me.Disconnect()
		        Else
		          Dim Host As String = Config.BNETHost
		          Dim Port As UInt16
		          If InStr(Host, ":") = 0 Then
		            Port = 6112
		          Else
		            Port = Val(NthField(Host, ":", CountFields(Host, ":")))
		            Host = Left(Host, Len(Host) - Len(":" + NthField(Host, ":", CountFields(Host, ":"))))
		          End If
		          If Globals.IsIPv6(Host) Then
		            Me.Send(ChrB(5) + ChrB(1) + ChrB(0) + ChrB(4) + Globals.IPToBytes(Host) + MemClass.WriteWORD(Port, False))
		          ElseIf Globals.IsIPv4(Host) Then
		            Me.Send(ChrB(5) + ChrB(1) + ChrB(0) + ChrB(1) + MemClass.WriteDWORD(Globals.IPToDWORD(Host), True) + MemClass.WriteWORD(Port, False))
		          Else
		            Me.Send(ChrB(5) + ChrB(1) + ChrB(0) + ChrB(3) + ChrB(LenB(Host)) + Host + MemClass.WriteWORD(Port, False))
		          End If
		          Me.ProxyWait = 1
		        End If
		      ElseIf Me.ProxyWait = 1 Then
		        Dim VN As Byte = AscB(Me.Read(1))
		        Dim RF As Byte = AscB(Me.Read(1))
		        If VN <> 5 Then
		          Me.Config.AddChat(True, Colors.Red, "PROXY: Server sent unexpected SOCKS version (" + Format(VN, "-#") + ")")
		          Me.Disconnect()
		        Else
		          Select Case RF
		          Case 0
		            Me.Config.AddChat(True, Colors.Lime, "PROXY: Connected.")
		          Case 1
		            Me.Config.AddChat(True, Colors.Red, "PROXY: General SOCKS server failure.")
		          Case 2
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Connection not allowed by ruleset.")
		          Case 3
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Network unreachable.")
		          Case 4
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Host uneachable.")
		          Case 5
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Connection refused.")
		          Case 6
		            Me.Config.AddChat(True, Colors.Red, "PROXY: TTL expired.")
		          Case 7
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Command not supported.")
		          Case 8
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Address type not supported.")
		          Case Else
		            Me.Config.AddChat(True, Colors.Red, "PROXY: Unexpected SOCKSv5 error code received (" + Format(RF, "-#") + ").")
		          End Select
		          If RF <> 0 Then
		            Me.Disconnect()
		          Else
		            Call Me.Read(1) // Reserved Byte
		            Dim ATYP As Byte = AscB(Me.Read(1))
		            Select Case ATYP
		            Case 1
		              Call Me.Read(4) // Bound IPv4
		            Case 3
		              Call Me.Read(4) // Bound DOMAINNAME
		            Case 4
		              Call Me.Read(16) // Bound IPv6
		            End Select
		            Call Me.Read(2) // Bound Port
		            Me.ProxyWait = 2
		            Packets.SendFirstSIDs(Me)
		            If Me.BytesAvailable > 0 Then Packets.Receive(Me)
		          End If
		        End If
		      ElseIf Me.ProxyWait = 2 Then
		        Packets.Receive(Me)
		      End If
		    End Select
		    
		  Else
		    
		    Packets.Receive(Me)
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  
		  If Me.Config = Nil Then Return
		  
		  Globals.ForceRedraw(MainWindow.lstProfiles)
		  
		  Me.Config.AddChat(True, Colors.Red, IIf(Me.Init6Protocol, "INIT6", "BNET") + ": " _
		  + "Disconnected. #" + Format(Me.LastErrorCode, "-#") + ": " + Me.GetErrorMessage())
		  
		  If Me.DisconnectAlreadyHandled = False Then Me.DoDisconnect(True)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DoConnect()
		  
		  If Me.IsConnected = True Then Return
		  Me.DoReconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoDisconnect(Errored As Boolean = False)
		  
		  If Me.IsConnected = True Then
		    
		    If Me.Config <> Nil Then Me.Config.AddChat(True, Colors.Cyan, "Disconnecting...")
		    Me.DisconnectAlreadyHandled = True
		    Me.Disconnect()
		    
		  Else
		    
		    Me.Close()
		    
		  End If
		  
		  If Me.Config <> Nil Then Me.Config.Container.lstUsers_View = Me.Config.Container.lstUsers_View
		  If Me.BNLS <> Nil Then Me.BNLS.Close()
		  If Me.LogonTimeoutTimer <> Nil Then Me.LogonTimeoutTimer.Enabled = False
		  
		  If Me.ReconnectTimer <> Nil Then
		    Me.ReconnectTimer.Enabled = Errored
		    If Me.ReconnectTimer.Enabled = True Then _
		    Me.Config.AddChat(True, Colors.Cyan, "Reconnecting in " + _
		    IIf(Me.ReconnectTimer.Period < 1000, _
		    Format(Me.ReconnectTimer.Period, "-#") + "ms", _
		    Globals.TimeString(Me.ReconnectTimer.Period / 1000)) + _
		    "." + EndOfLine)
		  End If
		  
		  If Me.SendNullTimer <> Nil Then Me.SendNullTimer.Enabled = False
		  If Me.ChannelUsers <> Nil Then Me.ChannelUsers.Clear()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoReconnect()
		  
		  If Me.IsConnected = True Then
		    
		    If Me.Config <> Nil Then Me.Config.AddChat(True, Colors.Cyan, "Reconnecting...")
		    Me.Disconnect()
		    
		  End If
		  
		  If Me.Config <> Nil Then
		    If Me.Config.ProxyType = Me.Config.ProxyOff Then
		      Globals.AssignSocketDetails(Me, Me.Config.BNETHost, 6112)
		      Me.Config.AddChat(True, Colors.Yellow, IIf(Me.Config.Init6Protocol, "INIT6", "BNET") + ": Connecting to " + Me.Address + "...")
		    Else
		      Globals.AssignSocketDetails(Me, Me.Config.ProxyHost, 1080)
		      Me.Config.AddChat(True, Colors.Yellow, "PROXY: Connecting to " + Me.Address + ":" + Str(Me.Port) + "...")
		    End If
		  End If
		  
		  Me.Initialize()
		  Me.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize()
		  
		  If Me.Config = Nil Then Return
		  
		  Me.AccountName = ""
		  Me.BadPacketCount = 0
		  
		  
		  If Me.BNUDP <> Nil Then Me.BNUDP.Close()
		  If Me.Config.EnableUDP = True Then
		    If Me.BNUDP = Nil Then
		      Me.BNUDP = New BNUDPSocket()
		      Me.BNUDP.BNET = Me
		      Me.BNUDP.SendToSelf = False
		      Me.BNUDP.RouterHops = 255
		    End If
		    Me.BNUDP.Port = 0
		    Me.BNUDP.Connect()
		  Else
		    Me.BNUDP = Nil
		  End If
		  
		  
		  If Me.BNLS <> Nil Then Me.BNLS.DoDisconnect(False)
		  If Me.Config.BNLSEnabled = True Then
		    If Me.BNLS = Nil Then
		      Me.BNLS = New BNLSSocket()
		      Me.BNLS.BNET = Me
		    End If
		    Me.BNLS.DoConnect()
		  Else
		    Me.BNLS = Nil
		  End If
		  
		  
		  Me.ChannelFlags = 0
		  Me.ChannelName = ""
		  ReDim Me.Channels(-1)
		  Me.ChannelUsers = New Dictionary()
		  Me.ChatProtoTxnId = Me.ChatProtoTxnLoggingIn
		  Me.ClanMembers = Nil
		  Me.ClanRank = 0
		  Me.ClanTag = 0
		  Me.ClientToken = Globals.GenerateDWORD()
		  Me.ConnectionTime = Microseconds()
		  Me.DataBuffer = ""
		  Me.DisconnectAlreadyHandled = False
		  Me.EXEChecksum = 0
		  Me.EXEInfo = ""
		  Me.EXEVersion = 0
		  Me.Flags = 0
		  Me.FriendsList = Nil
		  Me.Init6Protocol = Me.Config.Init6Protocol
		  Me.Init6TransactionId = Me.Init6TransactionLoggingIn
		  Me.LastAdId = 0
		  Me.LastAdTime = 0
		  Me.LastNullReceive = 0
		  If Me.LogonTimeoutTimer = Nil Then Me.LogonTimeoutTimer = New SocketTimer(Me, 2000, SocketTimer.ModeSingle, False)
		  Me.LogonType = 0
		  Me.NLS = Nil
		  Me.MPQFilename = ""
		  Me.MPQFiletime = 0
		  Me.Password = Me.Config.Password
		  Me.Ping = 0
		  Me.PingSpoof = Me.Config.PingSpoof
		  Me.Platform = Packets.BNETPlatform
		  Me.Product = Me.Config.Product
		  Me.ProxyWait = 0
		  If Me.ReconnectTimer = Nil Then Me.ReconnectTimer = New SocketTimer(Me, Me.Config.ReconnectInterval, SocketTimer.ModeMultiple, False)
		  Me.RequiredWorkMPQ = ""
		  If Me.SendNullTimer = Nil Then Me.SendNullTimer = New SocketTimer(Me, 120000, SocketTimer.ModeMultiple, True) Else Me.SendNullTimer.Enabled = True
		  Me.ServerSignature = ""
		  Me.ServerToken = 0
		  Me.Statstring = ""
		  Me.TimingForNextChatEvent = Nil
		  Me.UDPCode = 0
		  Me.UDPCodeSet = False
		  Me.UDPValue = 0
		  Me.UniqueName = ""
		  Me.Username = Me.Config.Username
		  Me.ValueString = ""
		  Me.VersionByte = Me.Config.VersionByte
		  Me.WaitingForUDP = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(ParamArray Bytes As Byte)
		  
		  Dim Buffer As String
		  For Each sByte As Byte In Bytes
		    Buffer = Buffer + ChrB(sByte)
		  Next
		  Me.Send(Buffer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(Data As String)
		  
		  If Me.IsConnected = False Then Return
		  Me.Write(Data)
		  If Not (Me.Config <> Nil And Me.Config.VerbosePackets = True) Then Return
		  
		  Select Case Data
		  Case ChrB(&H01)
		    Me.Config.AddChat(True, Colors.Yellow, "SEND (PROTOCOL GAME)")
		  Case ChrB(&H02)
		    Me.Config.AddChat(True, Colors.Yellow, "SEND (PROTOCOL BNFTP)")
		  Case ChrB(&H03)
		    Me.Config.AddChat(True, Colors.Yellow, "SEND (PROTOCOL CHAT)")
		  Case "C1" + EndOfLine.Windows
		    Me.Config.AddChat(True, Colors.Yellow, "SEND (PROTOCOL INIT6)")
		  Case Else
		    If Me.Product = Packets.BNETProduct_CHAT And Me.Init6Protocol = True Then
		      Dim Lines() As String = Split(ReplaceLineEndings(Data, EndOfLine), EndOfLine)
		      If Len(Lines(UBound(Lines))) = 0 Then Lines.Remove(UBound(Lines))
		      For Each Line As String In Lines
		        Me.Config.AddChat(True, Colors.Yellow, "SEND " + Line)
		      Next
		    ElseIf Me.Product = Packets.BNETProduct_CHAT And Me.Init6Protocol = False Then
		      If Data = ChrB(&H04) Then
		        Me.Config.AddChat(True, Colors.Yellow, "SEND (CHAT'S LOGIN BYTE)")
		      Else
		        Dim Lines() As String = Split(ReplaceLineEndings(Data, EndOfLine), EndOfLine)
		        If Len(Lines(UBound(Lines))) = 0 Then Lines.Remove(UBound(Lines))
		        For Each Line As String In Lines
		          Me.Config.AddChat(True, Colors.Yellow, "SEND " + Line)
		        Next
		      End If
		    ElseIf AscB(MidB(Data, 1, 1)) = &HFF Then
		      Dim PktID As String = "0x" + Right("00" + Hex(AscB(MidB(Data, 2, 1))), 2)
		      Me.Config.AddChat(True, Colors.Yellow, "SEND SID_" + PktID + " (Bytes: " + Str(LenB(Data)) + ")")
		    End If
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TimerAction(ST As SocketTimer)
		  
		  Select Case ST
		  Case Nil
		    
		  Case Me.LogonTimeoutTimer
		    Me.Config.AddChat(True, Colors.Orange, "BNET: It is taking longer than usual to logon to the account.")
		    Me.Config.AddChat(True, Colors.Orange, "BNET: You may wish to reconnect in 30 minutes.")
		    
		  Case Me.ReconnectTimer
		    ST.Enabled = False
		    
		    If Me.IsConnected = False Then
		      Me.Config.AddChat(True, Colors.Cyan, "Reconnecting...")
		      Me.DoConnect()
		    End If
		    
		  Case Me.SendNullTimer
		    If Me.Product = Packets.BNETProduct_CHAT And Me.Init6Protocol = True Then
		      Me.Send("/NULL" + EndOfLine.Windows)
		    ElseIf Me.Product <> Packets.BNETProduct_CHAT Then
		      Me.Send(Packets.CreateSID_NULL())
		    End If
		    
		  Case Else
		    ST.Enabled = False
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewClanInfo(ClanTag As UInt32, Username As String)
		  
		  Dim Cookie As New Cookie(Cookie.TypeClanMemberInfo)
		  Cookie.Value("Username") = Username
		  Cookie.Value("ClanTag") = ClanTag
		  
		  Self.Send(Packets.CreateSID_CLANMEMBERINFORMATION(Cookie.Cookie, ClanTag, Username))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewProfile(Username As String, Product As UInt32)
		  
		  Dim Cookie As New Cookie(Cookie.TypeProfile)
		  Dim Game As String = MemClass.WriteDWORD(Product, False)
		  Dim ProfileKeys() As String
		  
		  Cookie.Value("Username") = Username
		  Cookie.Value("Product") = Product
		  
		  // Profile
		  ProfileKeys.Append("profile\age")
		  ProfileKeys.Append("profile\sex")
		  ProfileKeys.Append("profile\location")
		  ProfileKeys.Append("profile\description")
		  
		  // Normal Games
		  ProfileKeys.Append("Record\" + Game + "\0\Wins")
		  ProfileKeys.Append("Record\" + Game + "\0\Losses")
		  ProfileKeys.Append("Record\" + Game + "\0\Disconnects")
		  ProfileKeys.Append("Record\" + Game + "\0\Last Game Result")
		  ProfileKeys.Append("Record\" + Game + "\0\Last Game")
		  
		  // Ladder Games
		  ProfileKeys.Append("Record\" + Game + "\1\Wins")
		  ProfileKeys.Append("Record\" + Game + "\1\Losses")
		  ProfileKeys.Append("Record\" + Game + "\1\Disconnects")
		  ProfileKeys.Append("Record\" + Game + "\1\Last Game Result")
		  ProfileKeys.Append("Record\" + Game + "\1\Last Game")
		  ProfileKeys.Append("Record\" + Game + "\1\Rating")
		  ProfileKeys.Append("Record\" + Game + "\1\High Rating")
		  ProfileKeys.Append("DynKey\" + Game + "\1\Rank")
		  ProfileKeys.Append("Record\" + Game + "\1\High Rank")
		  
		  Cookie.Value("Keys") = ProfileKeys
		  
		  Me.Send(Packets.CreateSID_READUSERDATA(Cookie.Cookie, Array(Username), ProfileKeys))
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AccountName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BadPacketCount As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		BNETHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BNLS As BNLSSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		BNUDP As BNUDPSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		ChannelFlags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ChannelName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Channels() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ChannelUsers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatProtoTxnId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ClanMembers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ClanRank As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		ClanTag As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ClientToken As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Config As Configuration
	#tag EndProperty

	#tag Property, Flags = &h0
		ConnectionTime As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		DataBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DisconnectAlreadyHandled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EXEChecksum As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		EXEInfo As String
	#tag EndProperty

	#tag Property, Flags = &h0
		EXEVersion As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		FriendsList As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Init6Protocol As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Init6TransactionId As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastAdId As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		LastAdTime As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		LastNullReceive As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LogonTimeoutTimer As SocketTimer
	#tag EndProperty

	#tag Property, Flags = &h0
		LogonType As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		MPQFilename As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MPQFiletime As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		NLS As NLS
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Ping As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PingSpoof As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Platform As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Product As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ProxyWait As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ReconnectTimer As SocketTimer
	#tag EndProperty

	#tag Property, Flags = &h0
		RequiredWorkMPQ As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ReturnChannel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SendNullTimer As SocketTimer
	#tag EndProperty

	#tag Property, Flags = &h0
		ServerSignature As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ServerToken As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Statstring As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TimingForNextChatEvent As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		UDPCode As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		UDPCodeSet As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		UDPValue As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		UniqueName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ValueString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionByte As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		WaitingForUDP As Boolean
	#tag EndProperty


	#tag Constant, Name = ChatProtoTxnChatting, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ChatProtoTxnLoggingIn, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Init6TransactionChatting, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Init6TransactionLoggingIn, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccountName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BNETHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChannelName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatProtoTxnId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConnectionTime"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataBuffer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectAlreadyHandled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EXEInfo"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Init6Protocol"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Init6TransactionId"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastNullReceive"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MPQFilename"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ping"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PingSpoof"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProxyWait"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequiredWorkMPQ"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReturnChannel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServerSignature"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Statstring"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UDPCodeSet"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UniqueName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ValueString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WaitingForUDP"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
