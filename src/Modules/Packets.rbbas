#tag Module
Protected Module Packets
	#tag Method, Flags = &h21
		Private Function CreateBNLS(ID As Byte, Data As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteWORD(Buffer, 3 + LenB(Data), True)
		  MemClass.WriteBYTE(Buffer, ID)
		  MemClass.WriteRaw(Buffer, Data)
		  
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_NULL() As String
		  
		  Return Packets.CreateBNLS(Packets.BNLS_NULL, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_REQUESTVERSIONBYTE(Product As UInt32) As String
		  
		  Return Packets.CreateBNLS(Packets.BNLS_REQUESTVERSIONBYTE, MemClass.WriteDWORD(Product, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_VERSIONCHECKEX2(Product As UInt32, Flags As UInt32, Cookie As UInt32, MPQFiletime As UInt64, MPQFilename As String, ValueString As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Product)
		  MemClass.WriteDWORD(Buffer, Flags)
		  MemClass.WriteDWORD(Buffer, Cookie)
		  MemClass.WriteQWORD(Buffer, MPQFiletime)
		  MemClass.WriteCString(Buffer, MPQFilename)
		  MemClass.WriteCString(Buffer, ValueString)
		  
		  Return Packets.CreateBNLS(Packets.BNLS_VERSIONCHECKEX2, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateSID(ID As Byte, Data As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteBYTE(Buffer, &HFF)
		  MemClass.WriteBYTE(Buffer, ID)
		  MemClass.WriteWORD(Buffer, 4 + LenB(Data), True)
		  MemClass.WriteRaw(Buffer, Data)
		  
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_AUTH_ACCOUNTCREATE(Salt As String, Verifier As String, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteRaw(Buffer, LeftB(Salt, 32))
		  MemClass.WriteRaw(Buffer, LeftB(Verifier, 32))
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_AUTH_ACCOUNTCREATE, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_AUTH_ACCOUNTLOGON(ClientKey As String, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteRaw(Buffer, LeftB(ClientKey, 32))
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_AUTH_ACCOUNTLOGON, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_AUTH_ACCOUNTLOGONPROOF(ClientPasswordProof As String) As String
		  
		  Return Packets.CreateSID(Packets.SID_AUTH_ACCOUNTLOGONPROOF, LeftB(ClientPasswordProof, 20))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_AUTH_CHECK(ClientToken As UInt32, EXEVersion As UInt32, EXEChecksum As UInt32, EXEInfo As String, CDKeyOwner As String, SpawnKey As Boolean, CDKeys() As String) As String
		  
		  // Each CD-key is encoded first (36 bytes / 9 DWORDs) before arriving to this function.
		  
		  Dim Buffer As String
		  Dim Prebuffer As String, Keys As UInt32 = 0
		  
		  // We pre-buffer our CD-keys so that we can make sure we tell Battle.net how
		  // many exactly CD-keys there are. The only reason to pre-buffer the keys is
		  // so that we can add/remove accidentally invalid keys here, before they get
		  // sent to the Battle.net server for checking.
		  
		  For Each CDKey As String In CDKeys
		    If LenB(CDKey) = 36 Then
		      MemClass.WriteRaw(Prebuffer, CDKey)
		      Keys = Keys + 1
		    End If
		  Next
		  
		  // Buffer the rest of the packet, including the pre-buffer...
		  
		  MemClass.WriteDWORD(Buffer, ClientToken, True)
		  MemClass.WriteDWORD(Buffer, EXEVersion, True)
		  MemClass.WriteDWORD(Buffer, EXEChecksum, True)
		  MemClass.WriteDWORD(Buffer, Keys, True)
		  If SpawnKey = True Then MemClass.WriteDWORD(Buffer, 1, True) _
		  Else MemClass.WriteDWORD(Buffer, 0, True)
		    MemClass.WriteRaw(Buffer, Prebuffer)
		    MemClass.WriteCString(Buffer, EXEInfo)
		    MemClass.WriteCString(Buffer, CDKeyOwner)
		    
		    Return Packets.CreateSID(Packets.SID_AUTH_CHECK, Buffer)
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_AUTH_INFO(Protocol As UInt32, Platform As UInt32, Product As UInt32, VersionByte As UInt32, PLang As UInt32, IP As UInt32, Timezone As UInt32, Locale As UInt32, LangID As UInt32, CountryShort As String, CountryLong As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Protocol)
		  MemClass.WriteDWORD(Buffer, Platform)
		  MemClass.WriteDWORD(Buffer, Product)
		  MemClass.WriteDWORD(Buffer, VersionByte)
		  MemClass.WriteDWORD(Buffer, PLang)
		  MemClass.WriteDWORD(Buffer, IP)
		  MemClass.WriteDWORD(Buffer, Timezone)
		  MemClass.WriteDWORD(Buffer, Locale)
		  MemClass.WriteDWORD(Buffer, LangID)
		  MemClass.WriteCString(Buffer, CountryShort)
		  MemClass.WriteCString(Buffer, CountryLong)
		  
		  Return Packets.CreateSID(Packets.SID_AUTH_INFO, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CHATCOMMAND(Message As String) As String
		  
		  Return Packets.CreateSID(Packets.SID_CHATCOMMAND, MemClass.WriteCString(Message))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANCREATIONINVITATION(Cookie As UInt32, ClanTag As UInt32, Inviter As String, Result As Byte) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteDWORD(Buffer, ClanTag, True)
		  MemClass.WriteCString(Buffer, Inviter)
		  MemClass.WriteBYTE(Buffer, Result)
		  
		  Return Packets.CreateSID(Packets.SID_CLANCREATIONINVITATION, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANDISBAND(Cookie As UInt32) As String
		  
		  Return Packets.CreateSID(Packets.SID_CLANDISBAND, MemClass.WriteDWORD(Cookie, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANINVITATION(Cookie As UInt32, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_CLANINVITATION, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANINVITATIONRESPONSE(Cookie As UInt32, ClanTag As UInt32, Inviter As String, Result As Byte) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteDWORD(Buffer, ClanTag, True)
		  MemClass.WriteCString(Buffer, Inviter)
		  MemClass.WriteBYTE(Buffer, Result)
		  
		  Return Packets.CreateSID(Packets.SID_CLANINVITATIONRESPONSE, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANMEMBERINFORMATION(Cookie As UInt32, ClanTag As UInt32, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteDWORD(Buffer, ClanTag, True)
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_CLANMEMBERINFORMATION, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANMEMBERLIST(Cookie As UInt32) As String
		  
		  Return Packets.CreateSID(Packets.SID_CLANMEMBERLIST, MemClass.WriteDWORD(Cookie, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANMOTD(Cookie As UInt32) As String
		  
		  Return Packets.CreateSID( Packets.SID_CLANMOTD, MemClass.WriteDWORD( Cookie, True ))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANRANKCHANGE(Cookie As UInt32, Username As String, NewRank As Byte) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteCString(Buffer, Username)
		  MemClass.WriteBYTE(Buffer, NewRank)
		  
		  Return Packets.CreateSID(Packets.SID_CLANRANKCHANGE, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CLANREMOVEMEMBER(Cookie As UInt32, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Cookie, True)
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_CLANREMOVEMEMBER, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_CREATEACCOUNT2(Password As String, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteRaw(Buffer, Password)
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_CREATEACCOUNT2, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_ENTERCHAT(Username As String, Statstring As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteCString(Buffer, Username)
		  MemClass.WriteCString(Buffer, Statstring)
		  
		  Return Packets.CreateSID(Packets.SID_ENTERCHAT, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_FRIENDSLIST() As String
		  
		  Return Packets.CreateSID(Packets.SID_FRIENDSLIST, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_GETCHANNELLIST(Product As UInt32) As String
		  
		  Return Packets.CreateSID(Packets.SID_GETCHANNELLIST, MemClass.WriteDWORD(Product, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_GETICONDATA() As String
		  
		  Return Packets.CreateSID(Packets.SID_GETICONDATA, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_JOINCHANNEL(Flags As UInt32, ChannelName As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Flags, True)
		  MemClass.WriteCString(Buffer, ChannelName)
		  
		  Return Packets.CreateSID(Packets.SID_JOINCHANNEL, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_LEAVECHAT() As String
		  
		  Return Packets.CreateSID(Packets.SID_LEAVECHAT, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_LOGONRESPONSE2(ClientToken As UInt32, ServerToken As UInt32, Password As String, Username As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, ClientToken, True)
		  MemClass.WriteDWORD(Buffer, ServerToken, True)
		  MemClass.WriteRaw(Buffer, Password)
		  MemClass.WriteCString(Buffer, Username)
		  
		  Return Packets.CreateSID(Packets.SID_LOGONRESPONSE2, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_NOTIFYJOIN(Product As UInt32, Version As UInt32, Gamename As String, Password As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, Product)
		  MemClass.WriteDWORD(Buffer, Version)
		  MemClass.WriteCString(Buffer, Gamename)
		  MemClass.WriteCString(Buffer, Password)
		  
		  Return Packets.CreateSID(Packets.SID_NOTIFYJOIN, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_NULL() As String
		  
		  Return Packets.CreateSID(Packets.SID_NULL, "")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_PING(RawData As String) As String
		  
		  Return Packets.CreateSID(Packets.SID_PING, RawData)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_PING(Cookie As UInt32) As String
		  
		  Return Packets.CreateSID(Packets.SID_PING, MemClass.WriteDWORD(Cookie, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_READUSERDATA(Cookie As UInt32, Accounts() As String, Keys() As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, UBound(Accounts) + 1)
		  MemClass.WriteDWORD(Buffer, UBound(Keys) + 1)
		  MemClass.WriteDWORD(Buffer, Cookie)
		  
		  For Each Account As String In Accounts
		    MemClass.WriteCString(Buffer, Account)
		  Next
		  
		  For Each Key As String In Keys
		    MemClass.WriteCString(Buffer, Key)
		  Next
		  
		  Return Packets.CreateSID(Packets.SID_READUSERDATA, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_SETEMAIL(EmailAddress As String) As String
		  
		  Return Packets.CreateSID(Packets.SID_SETEMAIL, MemClass.WriteCString(EmailAddress))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_UDPPINGRESPONSE(Code As UInt32) As String
		  
		  Return Packets.CreateSID(Packets.SID_UDPPINGRESPONSE, MemClass.WriteDWORD(Code, True))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateSID_WRITEUSERDATA(Accounts() As String, Keys() As String, Values() As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteDWORD(Buffer, UBound(Accounts) + 1)
		  MemClass.WriteDWORD(Buffer, UBound(Keys) + 1)
		  
		  For Each Account As String In Accounts
		    MemClass.WriteCString(Buffer, Account)
		  Next
		  
		  For Each Key As String In Keys
		    MemClass.WriteCString(Buffer, Key)
		  Next
		  
		  For Each Value As String In Values
		    MemClass.WriteCString(Buffer, Value)
		  Next
		  
		  Return Packets.CreateSID(Packets.SID_WRITEUSERDATA, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Sock As BNETSocket, PktID As Byte, PktData As String, PktFull As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV SID_0x" + Right("00" + Hex(PktID), 2) + _
		  " (Bytes: " + Str(4 + LenB(PktData)) + ")" + EndOfLine)
		  
		  Dim ret As Boolean = True
		  
		  Select Case PktID
		  Case Packets.SID_NULL
		    ret = Packets.ParseSID_NULL(Sock, PktData)
		    
		  Case Packets.SID_ENTERCHAT
		    ret = Packets.ParseSID_ENTERCHAT(Sock, PktData)
		    
		  Case Packets.SID_GETCHANNELLIST
		    ret = Packets.ParseSID_GETCHANNELLIST(Sock, PktData)
		    
		  Case Packets.SID_CHATEVENT
		    ret = Packets.ParseSID_CHATEVENT(Sock, PktData)
		    
		  Case Packets.SID_FLOODDETECTED
		    ret = Packets.ParseSID_FLOODDETECTED(Sock, PktData)
		    
		  Case Packets.SID_MESSAGEBOX
		    ret = Packets.ParseSID_MESSAGEBOX(Sock, PktData)
		    
		  Case Packets.SID_PING
		    ret = Packets.ParseSID_PING(Sock, PktData)
		    
		  Case Packets.SID_READUSERDATA
		    ret = Packets.ParseSID_READUSERDATA(Sock, PktData)
		    
		  Case Packets.SID_LOGONRESPONSE2
		    ret = Packets.ParseSID_LOGONRESPONSE2(Sock, PktData)
		    
		  Case Packets.SID_CREATEACCOUNT2
		    ret = Packets.ParseSID_CREATEACCOUNT2(Sock, PktData)
		    
		  Case Packets.SID_REQUIREDWORK
		    ret = Packets.ParseSID_REQUIREDWORK(Sock, PktData)
		    
		  Case Packets.SID_AUTH_INFO
		    ret = Packets.ParseSID_AUTH_INFO(Sock, PktData)
		    
		  Case Packets.SID_AUTH_CHECK
		    ret = Packets.ParseSID_AUTH_CHECK(Sock, PktData)
		    
		  Case Packets.SID_AUTH_ACCOUNTCREATE
		    ret = Packets.ParseSID_AUTH_ACCOUNTCREATE(Sock, PktData)
		    
		  Case Packets.SID_AUTH_ACCOUNTLOGON
		    ret = Packets.ParseSID_AUTH_ACCOUNTLOGON(Sock, PktData)
		    
		  Case Packets.SID_AUTH_ACCOUNTLOGONPROOF
		    ret = Packets.ParseSID_AUTH_ACCOUNTLOGONPROOF(Sock, PktData)
		    
		  Case Packets.SID_SETEMAIL
		    ret = Packets.ParseSID_SETEMAIL(Sock, PktData)
		    
		  Case Packets.SID_FRIENDSLIST
		    ret = Packets.ParseSID_FRIENDSLIST(Sock, PktData)
		    
		  Case Packets.SID_FRIENDSUPDATE
		    ret = Packets.ParseSID_FRIENDSUPDATE(Sock, PktData)
		    
		  Case Packets.SID_FRIENDSADD
		    ret = Packets.ParseSID_FRIENDSADD(Sock, PktData)
		    
		  Case Packets.SID_FRIENDSREMOVE
		    ret = Packets.ParseSID_FRIENDSREMOVE(Sock, PktData)
		    
		  Case Packets.SID_FRIENDSPOSITION
		    ret = Packets.ParseSID_FRIENDSPOSITION(Sock, PktData)
		    
		  Case Packets.SID_CLANCREATIONINVITATION
		    ret = Packets.ParseSID_CLANCREATIONINVITATION(Sock, PktData)
		    
		  Case Packets.SID_CLANDISBAND
		    ret = Packets.ParseSID_CLANDISBAND(Sock, PktData)
		    
		  Case Packets.SID_CLANINFO
		    ret = Packets.ParseSID_CLANINFO(Sock, PktData)
		    
		  Case Packets.SID_CLANQUITNOTIFY
		    ret = Packets.ParseSID_CLANQUITNOTIFY(Sock, PktData)
		    
		  Case Packets.SID_CLANINVITATION
		    ret = Packets.ParseSID_CLANINVITATION(Sock, PktData)
		    
		  Case Packets.SID_CLANREMOVEMEMBER
		    ret = Packets.ParseSID_CLANREMOVEMEMBER(Sock, PktData)
		    
		  Case Packets.SID_CLANINVITATIONRESPONSE
		    ret = Packets.ParseSID_CLANINVITATIONRESPONSE(Sock, PktData)
		    
		  Case Packets.SID_CLANRANKCHANGE
		    ret = Packets.ParseSID_CLANRANKCHANGE(Sock, PktData)
		    
		  Case Packets.SID_CLANMOTD
		    ret = Packets.ParseSID_CLANMOTD(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERLIST
		    ret = Packets.ParseSID_CLANMEMBERLIST(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERREMOVED
		    ret = Packets.ParseSID_CLANMEMBERREMOVED(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERSTATUSCHANGE
		    ret = Packets.ParseSID_CLANMEMBERSTATUSCHANGE(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERANKCHANGE
		    ret = Packets.ParseSID_CLANMEMBERRANKCHANGE(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERINFORMATION
		    ret = Packets.ParseSID_CLANMEMBERINFORMATION(Sock, PktData)
		    
		  Case Else
		    Sock.BadPacketCount = Sock.BadPacketCount + 1
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown packet!")
		    //Sock.Config.AddChatHexDump(MemClass.HexPrefix(PktID, "SID_0x", 2), PktFull)
		    #pragma Unused PktFull
		    ret = (Sock.BadPacketCount < 3)
		    If ret = False Then Sock.DoDisconnect(False)
		    
		  End Select
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Sock As BNETSocket, Line As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV CHAT " + Line)
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Sock As BNLSSocket, PktID As Byte, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.BNET = Nil Then Return False
		  If Sock.BNET.Config = Nil Then Return False
		  
		  If Sock.BNET.Config.VerbosePackets = True Then _
		  Sock.BNET.Config.AddChat(True, Colors.Yellow, "RECV BNLS_0x" + Right("00" + Hex(PktID), 2) + _
		  " (Bytes: " + Str(4 + LenB(PktData)) + ")")
		  
		  Dim ret As Boolean = True
		  
		  Select Case PktID
		  Case Packets.BNLS_NULL
		    ret = Packets.ParseBNLS_NULL(Sock, PktData)
		    
		  Case Packets.BNLS_VERSIONCHECKEX2
		    ret = Packets.ParseBNLS_VERSIONCHECKEX2(Sock, PktData)
		    
		  Case Else
		    ret = False
		    
		  End Select
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseBNLS_NULL(Sock As BNLSSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 0 Then Return False
		  
		  Sock.LastNullReceive = Microseconds()
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseBNLS_VERSIONCHECKEX2(Sock As BNLSSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.BNET = Nil Then Return False
		  If Sock.BNET.Config = Nil Then Return False
		  If LenB(PktData) < 21 And LenB(PktData) <> 8 Then Return False
		  
		  Dim Success As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim EXEVersion As UInt32 = MemClass.ReadDWORD(PktData, 5)
		  Dim EXEChecksum As UInt32 = MemClass.ReadDWORD(PktData, 9)
		  Dim EXEInfo As String = MemClass.ReadCString(PktData, 13)
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 14 + LenB(EXEInfo))
		  Dim VersionByte As UInt32 = MemClass.ReadDWORD(PKtData, 18 + LenB(EXEInfo))
		  
		  #pragma Unused VersionByte
		  
		  If Success = 0 Then
		    Sock.BNET.Config.AddChat(True, Colors.Red, "BNLS: Version check failed.")
		    Sock.BNET.DoDisconnect(False)
		    Return False
		  ElseIf Cookie <> Packets.SID_AUTH_CHECK Then
		    Sock.BNET.Config.AddChat(True, Colors.Red, "BNLS: Unknown reply for version check.")
		    Sock.BNET.DoDisconnect(False)
		    Return False
		  End If
		  
		  Sock.BNET.EXEVersion = EXEVersion
		  Sock.BNET.EXEChecksum = EXEChecksum
		  Sock.BNET.EXEInfo = EXEInfo
		  
		  Return Packets.SendSID_AUTH_CHECK(Sock.BNET, True)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseInit6(Sock As BNETSocket, Line As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV INIT6 " + Line)
		  
		  Select Case Sock.Init6TransactionId
		  Case Sock.Init6TransactionLoggingIn
		    
		    Dim fields() As String = Split(Line, " ")
		    Dim pktName As String = fields(0)
		    fields.Remove(0)
		    
		    Select Case pktName
		    Case "OK"
		      
		      // Init6 protocol does not support non-unique names online.
		      Sock.AccountName = Sock.Username
		      Sock.UniqueName = Sock.Username
		      
		      // We're logged on, all further packets go under a different parse route.
		      Sock.Init6TransactionId = Sock.Init6TransactionChatting
		      
		      Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		      Sock.Config.AddChat(True, Colors.Cyan, "INIT6: Logged on as ", Colors.Teal, Sock.UniqueName, Colors.Cyan, "!")
		      
		    Case "FAIL"
		      Sock.Config.AddChat(True, Colors.Red, "INIT6: Login failure: " + Join(fields, " "))
		      Sock.DoDisconnect(False)
		      Return False
		      
		    Case Else
		      Sock.Config.AddChat(True, Colors.Red, "INIT6: Protocol error: unknown message received:")
		      Sock.Config.AddChat(True, Colors.Salmon, Line)
		      
		    End Select
		    
		  Case Sock.Init6TransactionChatting
		    
		    Select Case NthField(Line, " ", 1)
		    Case "PING"
		      Sock.Send("/PONG " + Mid(Line, 6) + EndOfLine.Windows)
		      
		    Case "USER"
		      Return Packets.ParseInit6User(Sock, Mid(Line, 6))
		      
		    Case "CHANNEL"
		      Return Packets.ParseInit6Channel(Sock, Mid(Line, 9))
		      
		    Case "SERVER"
		      Return Packets.ParseInit6Server(Sock, Mid(Line, 8))
		      
		    Case Else
		      Sock.Config.AddChat(True, Colors.Red, "INIT6: Protocol error: unknown type of message received:")
		      Sock.Config.AddChat(True, Colors.Salmon, Line)
		      
		    End Select
		    
		  Case Else
		    
		    Dim e As New RuntimeException()
		    e.Message = "Unknown Init6 transaction id: " + Format(Sock.Init6TransactionId, "-#")
		    Raise e
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseInit6Channel(Sock As BNETSocket, Data As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV INIT6 CHANNEL " + Data)
		  
		  Dim fields() As String = Split(Data, " ")
		  
		  Dim msgName As String = fields(0)
		  fields.Remove(0)
		  
		  // A timer on the MainWindow delays the users list redraw a tiny bit so that it doesn't lag so much.
		  // The lag is caused by the code updating the list N*N times, therefore causing a small (<50ms) pause.
		  // Delaying it until "after everything is done" reverses this to just N*1 times.
		  // How much time to wait is determined by the lstUsersTimer's Period on MainWindow.
		  // A significant performance increase is seen when the Period is 100ms.
		  
		  If MainWindow.IsConfigSelected(Sock.Config) = False Then
		    
		    Sock.Config.CacheChatUnread = True
		    Sock.Config.Container.lstUsersTimer.Reset()
		    
		  End If
		  
		  Select Case msgName
		  Case "JOIN"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Flags As UInt32 = Val(fields(0))
		    fields.Remove(0)
		    Dim Text As String = Join(fields, " ")
		    
		    Sock.ChannelFlags = Flags
		    Sock.ChannelName = Text
		    Sock.ChannelUsers.Clear()
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Sock.Config.AddChat(True, Colors.LightSeaGreen, "-- Entered channel: ", Colors.Aquamarine, Sock.ChannelName, _
		    Colors.SlateGray, " (" + Globals.SChannelFlags(Sock.ChannelFlags) + ")")
		    
		  Case "TOPIC"
		    
		    Sock.Config.AddChat(True, Colors.GoldenRod, Join(fields, " "))
		    
		  Case Else
		    
		    Sock.Config.AddChat(True, Colors.Red, "INIT6: Protocol error: unknown channel message received:")
		    Sock.Config.AddChat(True, Colors.Salmon, Data)
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseInit6Server(Sock As BNETSocket, Data As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV INIT6 SERVER " + Data)
		  
		  Dim fields() As String = Split(Data, " ")
		  
		  Dim msgName As String = fields(0)
		  fields.Remove(0)
		  
		  // A timer on the MainWindow delays the users list redraw a tiny bit so that it doesn't lag so much.
		  // The lag is caused by the code updating the list N*N times, therefore causing a small (<50ms) pause.
		  // Delaying it until "after everything is done" reverses this to just N*1 times.
		  // How much time to wait is determined by the lstUsersTimer's Period on MainWindow.
		  // A significant performance increase is seen when the Period is 100ms.
		  
		  If MainWindow.IsConfigSelected(Sock.Config) = False Then
		    
		    Sock.Config.CacheChatUnread = True
		    Sock.Config.Container.lstUsersTimer.Reset()
		    
		  End If
		  
		  Select Case msgName
		  Case "INFO", "TOPIC"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Text As String = Join(fields, " ")
		    
		    Sock.Config.AddChat(True, Colors.GoldenRod, Text)
		    
		  Case "ERROR"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Text As String = Join(fields, " ")
		    
		    Sock.Config.AddChat(True, Colors.FireBrick, Text)
		    
		  Case "BROADCAST", "UPDATE"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Username As String = fields(0)
		    fields.Remove(0)
		    Dim Text As String = Join(fields, " ")
		    
		    If Len(Username) > 0 Then
		      Sock.Config.AddChat(True, Colors.Cyan, "Server " + Titlecase(msgName) + " from ", Colors.Teal, Username, _
		      Colors.Cyan, ": ", Colors.Silver, Text)
		    Else
		      Sock.Config.AddChat(True, Colors.Cyan, "Server " + Titlecase(msgName) + ": ", Colors.Silver, Text)
		    End If
		    
		  Case Else
		    
		    Sock.Config.AddChat(True, Colors.Red, "INIT6: Protocol error: unknown server message received:")
		    Sock.Config.AddChat(True, Colors.Salmon, Data)
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseInit6User(Sock As BNETSocket, Data As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.VerbosePackets = True Then _
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV INIT6 USER " + Data)
		  
		  Dim bTmp As Boolean
		  Dim dTmp As Dictionary
		  Dim fields() As String = Split(Data, " ")
		  
		  Dim colorA, colorB, colorC As Color
		  
		  Dim msgName As String = fields(0)
		  fields.Remove(0)
		  
		  // A timer on the MainWindow delays the users list redraw a tiny bit so that it doesn't lag so much.
		  // The lag is caused by the code updating the list N*N times, therefore causing a small (<50ms) pause.
		  // Delaying it until "after everything is done" reverses this to just N*1 times.
		  // How much time to wait is determined by the lstUsersTimer's Period on MainWindow.
		  // A significant performance increase is seen when the Period is 100ms.
		  
		  If MainWindow.IsConfigSelected(Sock.Config) = False And msgName <> "UPDATE" Then
		    
		    Sock.Config.CacheChatUnread = True
		    Sock.Config.Container.lstUsersTimer.Reset()
		    
		  End If
		  
		  Select Case msgName
		  Case "IN", "JOIN", "UPDATE"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Flags As UInt32 = Val(fields(0))
		    fields.Remove(0)
		    Dim Ping As Integer = Val(fields(0))
		    fields.Remove(0)
		    Dim Username As String = fields(0)
		    fields.Remove(0)
		    Dim Text As String = Join(fields, " ")
		    
		    If Username = Sock.UniqueName Then
		      Sock.Flags = Flags
		      Sock.Ping = Ping
		      Sock.Statstring = Text
		    End If
		    
		    If Sock.ChannelUsers.HasKey(Username) = True Then
		      dTmp = Sock.ChannelUsers.Value(Username)
		      dTmp.Value("Username") = Username
		      dTmp.Value("FlagsOld") = dTmp.Value("Flags")
		      dTmp.Value("Flags") = Flags
		      dTmp.Value("Ping") = Ping
		      If LenB(Text) > 0 Then dTmp.Value("Statstring") = Text
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = msgName
		      dTmp.Value("LastMessage") = ""
		      
		    Else
		      dTmp = New Dictionary()
		      dTmp.Value("Username") = Username
		      dTmp.Value("FlagsOld") = Flags
		      dTmp.Value("Flags") = Flags
		      dTmp.Value("Ping") = Ping
		      dTmp.Value("Statstring") = Text
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = msgName
		      dTmp.Value("LastMessage") = ""
		      dTmp.Value("TimeEntered") = Microseconds()
		      Sock.ChannelUsers.Value(Username) = dTmp
		      
		      If msgName = "JOIN" And Sock.Config.ShowJoinLeaveMessages = True Then
		        Sock.Config.AddChat(True, Colors.DarkSeaGreen, "-- ", _
		        Colors.LightSeaGreen, Username, _
		        Colors.DarkSeaGreen, " joined the channel using ", _
		        Colors.LightSeaGreen, Globals.ProductName(MemClass.ReadDWORD(Text, 1, True), False))
		      End If
		      
		    End If
		    
		    Dim OldFlags As UInt32 = dTmp.Value("FlagsOld").Int32Value
		    If Sock.Config.ShowUserUpdateMessages = True And Flags <> OldFlags Then
		      If MainWindow.IsConfigSelected(Sock.Config) = False And msgName = "UPDATE" Then
		        
		        Sock.Config.CacheChatUnread = True
		        Sock.Config.Container.lstUsersTimer.Reset()
		        
		      End If
		      If BitAnd(OldFlags, &H01) = 0 And BitAnd(Flags, &H01) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", _
		        Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", _
		        Colors.LightSkyBlue, "Blizzard representative", _
		        Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H02) = 0 And BitAnd(Flags, &H02) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.White, "channel operator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H04) = 0 And BitAnd(Flags, &H04) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.Yellow, "channel speaker", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H08) = 0 And BitAnd(Flags, &H08) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.LightSeaGreen, "Battle.net administrator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H10) = 0 And BitAnd(Flags, &H10) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " no longer has ", Colors.Teal, "UDP support", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H20) = 0 And BitAnd(Flags, &H20) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now ", Colors.Red, "squelched", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H40) = 0 And BitAnd(Flags, &H40) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.Pink, "guest", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H01) > 0 And BitAnd(Flags, &H01) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.LightSkyBlue, "Blizzard representative", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H02) > 0 And BitAnd(Flags, &H02) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.White, "channel operator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H04) > 0 And BitAnd(Flags, &H04) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.Yellow, "channel speaker", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H08) > 0 And BitAnd(Flags, &H08) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.LightSeaGreen, "Battle.net administrator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H10) > 0 And BitAnd(Flags, &H10) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " now has ", Colors.Teal, "UDP support", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H20) > 0 And BitAnd(Flags, &H20) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer ", Colors.Red, "squelched", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H40) > 0 And BitAnd(Flags, &H40) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "INIT6: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.Pink, "guest", Colors.Cyan, ".")
		      End If
		    End If
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsersTimer.Reset()
		    
		  Case "LEAVE"
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Username As String = fields(0)
		    fields.Remove(0)
		    
		    If Sock.ChannelUsers.HasKey(Username) = True Then
		      Sock.ChannelUsers.Remove(Username)
		      
		      If Sock.Config.ShowJoinLeaveMessages = True Then
		        Sock.Config.AddChat(True, Colors.FireBrick, "-- ", Colors.Crimson, Username, Colors.FireBrick, " left the channel")
		      End If
		      
		      If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsersTimer.Reset()
		      
		    End If
		    
		  Case "WHISPER"
		    
		    Dim Direction As String = fields(0)
		    fields.Remove(0)
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Username As String = fields(0)
		    fields.Remove(0)
		    Dim Text As String = Join(fields, " ")
		    
		    If Sock.Config.EnableUTF8 = True Then Text = DefineEncoding(Text, Encodings.UTF8)
		    
		    dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = msgName
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    Dim Flags As UInt32 = 0
		    If dTmp <> Nil Then Flags = dTmp.Value("Flags")
		    
		    If BitAnd(Flags, &H20) <= 0 Then
		      If Direction = "TO" Then
		        Sock.Config.AddChat(True, Colors.MediumVioletRed, "To ", Colors.MediumOrchid, Username, Colors.MediumVioletRed, ": ", Colors.SlateGray, Text)
		      ElseIf Direction = "FROM" Then
		        Globals.DesktopNotification("Whisper received from " + Username, Text, 0)
		        If MainWindow.IsConfigSelected(Sock.Config) = False Then
		          Sock.Config.CacheChatMention = True
		          Sock.Config.Container.lstUsersTimer.Reset()
		        End If
		        Sock.Config.AddChat(True, Colors.GoldenRod, "From ", Colors.Gold, Username, Colors.GoldenRod, ": ", Colors.SlateGray, Text)
		      Else
		        Sock.Config.AddChat(True, Colors.Gray, "<" + Direction + ": " + Username + "> " + Text)
		      End If
		    End If
		    
		  Case "TALK", "EMOTE"
		    
		    Dim Direction As String = fields(0)
		    fields.Remove(0)
		    
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    fields.Remove(0) // Padding
		    
		    Dim Username As String = fields(0)
		    fields.Remove(0)
		    Dim Text As String = Join(fields, " ")
		    
		    If Sock.Config.EnableUTF8 = True Then Text = DefineEncoding(Text, Encodings.UTF8)
		    
		    If Sock.Config.SpamPrevention = True Then dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    bTmp = (Sock.Config.SpamPrevention = True And dTmp <> Nil And dTmp.Value("TimeEntered").DoubleValue + 400000 > Microseconds())
		    
		    // If bTmp = True then they are talking at most 0.4 seconds after entering.
		    
		    If dTmp <> Nil Then
		      If bTmp = False And Sock.Config.SpamPrevention = True And Text = dTmp.Value("LastMessage") Then bTmp = True
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = msgName
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    // If bTmp = True now then they may also be repeating their message.
		    
		    If bTmp = False And Globals.MessageBlacklistMatch(Text) = True Then bTmp = True
		    
		    // If bTmp = True now then the message may even also be on the blacklist
		    
		    Dim Flags As UInt32 = 0
		    If dTmp <> Nil Then Flags = dTmp.Value("Flags")
		    
		    If BitAnd(Flags, &H20) <= 0 And bTmp = False Then
		      If msgName = "TALK" Then
		        If Direction = "TO" Then
		          colorA = Colors.MediumOrchid
		          colorB = Colors.MediumVioletRed
		          colorC = Colors.White
		        ElseIf BitAnd(Flags, &H09) > 0 Then
		          colorA = Colors.Teal
		          colorB = Colors.Cyan
		          colorC = Colors.Cyan
		        ElseIf BitAnd(Flags, &H02) > 0 Then
		          colorA = Colors.Silver
		          colorB = Colors.White
		          colorC = Colors.White
		        Else
		          colorA = Colors.GoldenRod
		          colorB = Colors.Gold
		          If BitAnd(Flags, &H04) > 0 Then colorC = Colors.Yellow Else colorC = Colors.White
		        End If
		      ElseIf msgName = "EMOTE" Then
		        If Username = Sock.UniqueName Then
		          colorA = Colors.MediumOrchid
		          colorB = Colors.MediumVioletRed
		          colorC = Colors.MediumOrchid
		        ElseIf BitAnd(Flags, &H09) > 0 Then
		          colorA = Colors.GoldenRod
		          colorB = Colors.Cyan
		          colorC = Colors.GoldenRod
		        ElseIf BitAnd(Flags, &H02) > 0 Then
		          colorA = Colors.Silver
		          colorB = Colors.White
		          colorC = Colors.Silver
		        Else
		          colorA = Colors.GoldenRod
		          colorB = Colors.Gold
		          colorC = Colors.GoldenRod
		        End If
		      End If
		      
		      If InStr(Text, Sock.UniqueName) > 0 Or InStr(Text, Sock.AccountName) > 0 Then
		        Globals.DesktopNotification("Mentioned by " + Username, Text, 0)
		        If MainWindow.IsConfigSelected(Sock.Config) = False Then
		          Sock.Config.CacheChatMention = True
		          Sock.Config.Container.lstUsersTimer.Reset()
		        End If
		      End If
		      
		      If msgName = "TALK" Then
		        Sock.Config.AddChat(True, colorB, Username, colorA, ": ", colorC, Text)
		      ElseIf msgName = "EMOTE" Then
		        Sock.Config.AddChat(True, colorA, "-- ", colorB, Username, colorA, " ", colorC, Text)
		      End If
		    End If
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config And _
		      Sock.Config.Container.lstUsers_View = ChatContainer.lstUsers_View_Channel_Activity Then _
		      Sock.Config.Container.lstUsersTimer.Reset()
		      
		  Case Else
		    
		    Sock.Config.AddChat(True, Colors.Red, "INIT6: Protocol error: unknown user message received:")
		    Sock.Config.AddChat(True, Colors.Salmon, Data)
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_AUTH_ACCOUNTCREATE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 4 Then Return False
		  
		  Dim Status As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  
		  If Sock.Config <> Nil Then
		    Select Case Status
		    Case &H00 // Successfully created account name.
		    Case &H04 // Name already exists.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account already exists.")
		    Case &H07 // Name is too short/blank.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name is too short.")
		    Case &H08 // Name contains an illegal character.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains invalid characters.")
		    Case &H09 // Name contains an illegal word.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name uses a banned word.")
		    Case &H0A // Name contains too few alphanumeric characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name doesn't have enough alphanumeric characters.")
		    Case &H0B // Name contains adjacent punctuation characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains adjacent punctuations.")
		    Case &H0C // Name contains too many punctuation characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains too many punctuations.")
		    Case Else // Any other: Name already exists.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS create failure.")
		    End Select
		  End If
		  
		  If Status <> &H00 And Not (Status = &H04 And Sock.Config.CreateAccountsFirst = True) Then
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  Packets.SendLogonPkt(Sock, True)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_AUTH_ACCOUNTLOGON(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 68 Then Return False
		  
		  Dim Status As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  
		  If Sock.Config <> Nil Then
		    Select Case Status
		    Case &H00 // Logon accepted, requires proof.
		      Sock.Send(Packets.CreateSID_AUTH_ACCOUNTLOGONPROOF(Sock.NLS.AccountLogonProof(MidB(PktData, 5, 32), MidB(PktData, 37, 32))))
		    Case &H01 // Account doesn't exist.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account is non-existant; ", Colors.Yellow, "creating it...")
		    Case &H05 // Account requires upgrade.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account requires upgrade. (NYI)")
		    Case Else // Unknown (failure).
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS logon failure.")
		    End Select
		  End If
		  
		  If Status <> &H00 And Status <> &H01 Then
		    Sock.DoDisconnect(False)
		    Return False
		  ElseIf Status = &H01 Then
		    // Try to create the account...
		    Sock.Send(Packets.CreateSID(Packets.SID_AUTH_ACCOUNTCREATE, Sock.NLS.AccountCreate()))
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_AUTH_ACCOUNTLOGONPROOF(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 24 Then Return False
		  
		  Dim Status As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim ServerPasswordProof As String = MemClass.ReadRaw(PktData, 5, 20)
		  Dim MoreInfo As String = MemClass.ReadCString(PktData, 25)
		  
		  If Sock.NLS.ServerPasswordProof(ServerPasswordProof) = False Then
		    If Sock.Config <> Nil Then Sock.Config.AddChat(True, Colors.Red, "BNET: Server doesn't really know your password!")
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  If Sock.Config <> Nil Then
		    Select Case Status
		    Case &H00, &H0E // Logon successful. (OR) An email address should be registered for this account.
		      
		      If Sock.BNLS <> Nil Then Sock.BNLS.Close()
		      
		      If Status = &H0E And LenB(Sock.Config.EmailAddress) > 0 Then
		        Sock.Send(Packets.CreateSID_SETEMAIL(Sock.Config.EmailAddress))
		        
		        If Sock.Config <> Nil Then
		          Sock.Config.AddChat(True, Colors.Cyan, "BNET: Binded ", Colors.Teal, Sock.Config.EmailAddress, Colors.Cyan, " to the account.")
		        End If
		      End If
		      
		      Packets.SendAfterLogonSIDs(Sock)
		      
		    Case &H02 // Incorrect password.
		      
		      If Sock.Config <> Nil Then Sock.Config.AddChat(True, Colors.Red, "BNET: Your password is incorrect.")
		      Sock.DoDisconnect(False)
		      Return False
		      
		    Case &H0F // Custom error. A string at the end of this message contains the error.
		      
		      Sock.Config.AddChat(True, Colors.Red, "BNET: " + MoreInfo + ".")
		      
		    Case Else // Unknown (failure).
		      
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS logon proof failure.")
		      
		    End Select
		  End If
		  
		  If Status <> &H00 And Status <> &H0E Then
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_AUTH_CHECK(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 5 Then Return False
		  
		  Dim Result As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim MoreInfo As String = MemClass.ReadCString(PktData, 5)
		  
		  Select Case Result
		  Case &H000 // Passed challenge
		  Case &H100 // Old game version
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Old game version.")
		  Case &H101 // Invalid version
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Invalid game version.")
		  Case &H102 // Game version must be downgraded
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Game version is too new.")
		  Case Sock.VersionByte // Invalid version code
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Invalid version byte code.")
		  Case &H200 // CD-Key is invalid
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is invalid.")
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are probably now banned for 2 weeks.")
		  Case &H201 // CD-Key is in use
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is in use.") Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is in use by " + MoreInfo + ".")
		  Case &H202 // CD-Key is banned
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is banned.")
		  Case &H203 // CD-Key is for another game
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is for another game.")
		  Case &H210 // Expansion-set CD-Key is invalid
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is invalid.")
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are probably now banned for 2 weeks.")
		  Case &H211 // Expansion-set CD-Key is in use
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is in use.") Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is in use by " + MoreInfo + ".")
		  Case &H212 // Expansion-set CD-Key is banned
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is banned.")
		  Case &H213 // Expansion-set CD-Key is for another game
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is for another game.")
		  Case Else // Unknown result code
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown version/cd-key check result.")
		  End Select
		  
		  If Result <> &H000 Then
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  Packets.SendLogonPkt(Sock)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_AUTH_INFO(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 22 Then Return False
		  
		  Sock.LogonType = MemClass.ReadDWORD(PktData, 1, True)
		  Sock.ServerToken = MemClass.ReadDWORD(PktData, 5, True)
		  Sock.UDPValue = MemClass.ReadDWORD(PktData, 9, True)
		  Sock.MPQFiletime = MemClass.ReadQWORD(PktData, 13, True)
		  Sock.MPQFilename = MemClass.ReadCString(PktData, 21)
		  Sock.ValueString = MemClass.ReadCString(PktData, 22 + LenB(Sock.MPQFilename))
		  Sock.ServerSignature = MemClass.ReadRaw(PktData, 23 + LenB(Sock.MPQFilename + Sock.ValueString), 128)
		  
		  If Sock.LogonType < 0 Or Sock.LogonType > 2 Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown logon type! " + _
		    MemClass.HexPrefix(Sock.LogonType, "0x", 8))
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  If Sock.BNUDP <> Nil And Sock.BNUDP.IsConnected = True Then
		    Dim UDPPkt As New Datagram(), UDPData As String
		    UDPPkt.Address = Sock.Address
		    If InStr(Sock.Config.BNETHost, ":") <= 0 Then UDPPkt.Port = 6112 Else _
		    UDPPkt.Port = Val(NthField(Sock.Config.BNETHost, ":", 2))
		    
		    MemClass.WriteDWORD(UDPData, Packets.PKT_CONNTEST2, True)
		    MemClass.WriteDWORD(UDPData, Sock.ServerToken, True)
		    MemClass.WriteDWORD(UDPData, Sock.UDPValue, True)
		    
		    UDPPkt.Data = UDPData
		    Sock.BNUDP.Write(UDPPkt)
		  End If
		  
		  If Packets.SendSID_AUTH_CHECK(Sock) = False Then Return False
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CHATEVENT(Sock As BNETSocket, PktData As String) As Boolean
		  
		  // TODO Fix this beast
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 26 Then Return False
		  
		  Dim EventID As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim Flags As UInt32 = MemClass.ReadDWORD(PktData, 5)
		  Dim Ping As UInt32 = MemClass.ReadDWORD(PktData, 9)
		  Dim IPAddress As UInt32 = MemClass.ReadDWORD(PktData, 13)
		  Dim AccountNumber As UInt32 = MemClass.ReadDWORD(PktData, 17)
		  Dim RegistrationAuthority As UInt32 = MemClass.ReadDWORD(PktData, 21)
		  Dim Username As String = MemClass.ReadCString(PktData, 25)
		  Dim Text As String = MemClass.ReadCString(PktData, 26 + LenB(Username))
		  
		  If Sock.Config.EnableUTF8 = True Then _
		  Text = DefineEncoding(Text, Encodings.UTF8)
		  
		  #pragma Unused IPAddress
		  #pragma Unused AccountNumber
		  #pragma Unused RegistrationAuthority
		  
		  Dim dTmp As Dictionary
		  Dim colorA, colorB, colorC As Color
		  Dim bTmp As Boolean
		  
		  // A timer on the MainWindow delays the users list redraw a tiny bit so that it doesn't lag so much.
		  // The lag is caused by the code updating the list N*N times, therefore causing a small (<50ms) pause.
		  // Delaying it until "after everything is done" reverses this to just N*1 times.
		  // How much time to wait is determined by the lstUsersTimer's Period on MainWindow.
		  // A significant performance increase is seen when the Period is 100ms.
		  
		  If MainWindow.IsConfigSelected(Sock.Config) = False And EventID <> 9 Then
		    
		    Sock.Config.CacheChatUnread = True
		    Sock.Config.Container.lstUsersTimer.Reset()
		    
		  End If
		  
		  If Sock.TimingForNextChatEvent <> Nil And Sock.TimingForNextChatEvent.Left Then
		    
		    // calculate time elapsed
		    Sock.TimingForNextChatEvent = New Pair(False, Microseconds() - Sock.TimingForNextChatEvent.Right)
		    
		    // display it
		    Sock.Config.AddChat(True, Colors.Gray, "Time from mark to next chat event: ", _
		    Format((Sock.TimingForNextChatEvent.Right / 1000) - Sock.Ping, "-#.0#") + "ms.")
		    
		    // and reset
		    Sock.TimingForNextChatEvent = Nil
		    
		  End If
		  
		  Select Case EventID
		  Case &H01, &H02, &H09
		    
		    If Username = Sock.UniqueName Then
		      Sock.Flags = Flags
		      Sock.Ping = Ping
		      Sock.Statstring = Text
		    End If
		    
		    If Sock.ChannelUsers.HasKey(Username) = True Then
		      dTmp = Sock.ChannelUsers.Value(Username)
		      dTmp.Value("Username") = Username
		      dTmp.Value("FlagsOld") = dTmp.Value("Flags")
		      dTmp.Value("Flags") = Flags
		      dTmp.Value("Ping") = Ping
		      If LenB(Text) > 0 Then dTmp.Value("Statstring") = Text
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = ""
		      
		    Else
		      dTmp = New Dictionary()
		      dTmp.Value("Username") = Username
		      dTmp.Value("FlagsOld") = Flags
		      dTmp.Value("Flags") = Flags
		      dTmp.Value("Ping") = Ping
		      dTmp.Value("Statstring") = Text
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = ""
		      dTmp.Value("TimeEntered") = Microseconds()
		      Sock.ChannelUsers.Value(Username) = dTmp
		      
		      If EventID = &H02 And Sock.Config.ShowJoinLeaveMessages = True Then
		        Sock.Config.AddChat(True, Colors.DarkSeaGreen, "-- ", _
		        Colors.LightSeaGreen, Username, _
		        Colors.DarkSeaGreen, " joined the channel using ", _
		        Colors.LightSeaGreen, Globals.ProductName(MemClass.ReadDWORD(Text, 1, True), False))
		      End If
		      
		    End If
		    
		    Dim OldFlags As UInt32 = dTmp.Value("FlagsOld").Int32Value
		    If Sock.Config.ShowUserUpdateMessages = True And Flags <> OldFlags Then
		      If MainWindow.IsConfigSelected(Sock.Config) = False And EventID = 9 Then
		        
		        Sock.Config.CacheChatUnread = True
		        Sock.Config.Container.lstUsersTimer.Reset()
		        
		      End If
		      If BitAnd(OldFlags, &H01) = 0 And BitAnd(Flags, &H01) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", _
		        Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", _
		        Colors.LightSkyBlue, "Blizzard representative", _
		        Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H02) = 0 And BitAnd(Flags, &H02) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.White, "channel operator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H04) = 0 And BitAnd(Flags, &H04) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.Yellow, "channel speaker", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H08) = 0 And BitAnd(Flags, &H08) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.LightSeaGreen, "Battle.net administrator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H10) = 0 And BitAnd(Flags, &H10) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " no longer has ", Colors.Teal, "UDP support", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H20) = 0 And BitAnd(Flags, &H20) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now ", Colors.Red, "squelched", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H40) = 0 And BitAnd(Flags, &H40) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is now a ", Colors.Pink, "guest", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H01) > 0 And BitAnd(Flags, &H01) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.LightSkyBlue, "Blizzard representative", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H02) > 0 And BitAnd(Flags, &H02) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.White, "channel operator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H04) > 0 And BitAnd(Flags, &H04) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.Yellow, "channel speaker", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H08) > 0 And BitAnd(Flags, &H08) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.LightSeaGreen, "Battle.net administrator", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H10) > 0 And BitAnd(Flags, &H10) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " now has ", Colors.Teal, "UDP support", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H20) > 0 And BitAnd(Flags, &H20) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer ", Colors.Red, "squelched", Colors.Cyan, ".")
		      End If
		      If BitAnd(OldFlags, &H40) > 0 And BitAnd(Flags, &H40) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ", Colors.Teal, Username, _
		        Colors.Cyan, " is no longer a ", Colors.Pink, "guest", Colors.Cyan, ".")
		      End If
		    End If
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsersTimer.Reset()
		    
		  Case &H03
		    
		    If Sock.ChannelUsers.HasKey(Username) = True Then
		      Sock.ChannelUsers.Remove(Username)
		      
		      If Sock.Config.ShowJoinLeaveMessages = True Then
		        Sock.Config.AddChat(True, Colors.FireBrick, "-- ", Colors.Crimson, Username, Colors.FireBrick, " left the channel")
		      End If
		      
		      If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsersTimer.Reset()
		      
		    End If
		    
		  Case &H04
		    
		    dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    If BitAnd(Flags, &H20) <= 0 Then
		      Globals.DesktopNotification("Whisper received from " + Username, Text, 0)
		      If MainWindow.IsConfigSelected(Sock.Config) = False Then
		        Sock.Config.CacheChatMention = True
		        Sock.Config.Container.lstUsersTimer.Reset()
		      End If
		      Sock.Config.AddChat(True, Colors.GoldenRod, "From ", Colors.Gold, Username, Colors.GoldenRod, ": ", Colors.SlateGray, Text)
		    End If
		    
		  Case &H05
		    
		    If Sock.Config.SpamPrevention = True Then dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    bTmp = (Sock.Config.SpamPrevention = True And dTmp <> Nil And dTmp.Value("TimeEntered").DoubleValue + 400000 > Microseconds())
		    
		    // If bTmp = True then they are talking at most 0.4 seconds after entering.
		    
		    If dTmp <> Nil Then
		      If bTmp = False And Sock.Config.SpamPrevention = True And Text = dTmp.Value("LastMessage") Then bTmp = True
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    // If bTmp = True now then they may also be repeating their message.
		    
		    If bTmp = False And Globals.MessageBlacklistMatch(Text) = True Then bTmp = True
		    
		    // If bTmp = True now then the message may even also be on the blacklist
		    
		    If BitAnd(Flags, &H20) <= 0 And bTmp = False Then
		      If BitAnd(Flags, &H09) > 0 Then
		        colorA = Colors.Teal
		        colorB = Colors.Cyan
		        colorC = Colors.Cyan
		      ElseIf BitAnd(Flags, &H02) > 0 Then
		        colorA = Colors.Silver
		        colorB = Colors.White
		        colorC = Colors.White
		      Else
		        colorA = Colors.GoldenRod
		        colorB = Colors.Gold
		        If BitAnd(Flags, &H04) > 0 Then colorC = Colors.Yellow Else colorC = Colors.White
		      End If
		      
		      If InStr(Text, Sock.UniqueName) > 0 Or InStr(Text, Sock.AccountName) > 0 Then
		        Globals.DesktopNotification("Mentioned by " + Username, Text, 0)
		        If MainWindow.IsConfigSelected(Sock.Config) = False Then
		          Sock.Config.CacheChatMention = True
		          Sock.Config.Container.lstUsersTimer.Reset()
		        End If
		      End If
		      
		      Sock.Config.AddChat(True, colorB, Username, colorA, ": ", colorC, Text)
		    End If
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config And _
		      Sock.Config.Container.lstUsers_View = ChatContainer.lstUsers_View_Channel_Activity Then _
		      Sock.Config.Container.lstUsersTimer.Reset()
		      
		  Case &H06
		    
		    If Username <> "Battle.net" And LenB(Username) > 0 Then
		      Sock.Config.AddChat(True, Colors.Cyan, "Server broadcast from ", Colors.Teal, Username, _
		      Colors.Cyan, ": ", Colors.Silver, Text)
		    Else
		      Sock.Config.AddChat(True, Colors.Cyan, "Server broadcast: ", Colors.Silver, Text)
		    End If
		    
		  Case &H07
		    
		    Sock.ChannelFlags = Flags
		    Sock.ChannelName = Text
		    Sock.ChannelUsers.Clear()
		    
		    #If DebugBuild Then
		      Sock.TimingForNextChatEvent = New Pair(True, Microseconds())
		    #EndIf
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config Then Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Sock.Config.AddChat(True, Colors.LightSeaGreen, "-- Entered channel: ", Colors.Aquamarine, Sock.ChannelName, _
		    Colors.SlateGray, " (" + Globals.SChannelFlags(Sock.ChannelFlags) + ")")
		    
		  Case &H0A
		    
		    #If DebugBuild Then
		      Sock.TimingForNextChatEvent = New Pair(True, Microseconds())
		    #EndIf
		    
		    dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    If BitAnd(Flags, &H20) <= 0 Then
		      Sock.Config.AddChat(True, Colors.MediumVioletRed, "To ", Colors.MediumOrchid, Username, Colors.MediumVioletRed, ": ", Colors.SlateGray, Text)
		    End If
		    
		  Case &H0D // full
		    
		    Sock.Config.AddChat(True, Colors.FireBrick, "BNET: The channel ", Colors.Crimson, Text, Colors.FireBrick, " is full.")
		    
		  Case &H0E // empty
		    
		    Sock.Config.AddChat(True, Colors.FireBrick, "BNET: The channel ", Colors.Crimson, Text, Colors.FireBrick, " is empty", _
		    Colors.GoldenRod, "; forcing join...")
		    Sock.Send(Packets.CreateSID_JOINCHANNEL(&H2, Text))
		    
		  Case &H0F // restricted
		    
		    Sock.Config.AddChat(True, Colors.FireBrick, "BNET: The channel ", Colors.Crimson, Text, Colors.FireBrick, " is restricted.")
		    
		  Case &H12
		    
		    Dim showLine As Boolean
		    
		    If Sock.Config.IgnoreBanKickUnban = True And _
		      (InStr(Text, "was unbanned by") > 0 Or _
		      InStr(Text, "was banned by") > 0 Or _
		      InStr(Text, "was kicked out of the channel by") > 0) Then
		      showLine = False
		      
		    ElseIf Sock.Config.ShowUserUpdateMessages = True And _
		      (Right(Text, Len(" has been squelched.")) = " has been squelched." Or _
		      Right(Text, Len(" has been unsquelched.")) = " has been unsquelched.") Then
		      showLine = False
		      
		    Else
		      showLine = True
		      
		    End If
		    
		    If showLine = True Then
		      For Each Line As String In Split(ReplaceLineEndings(Text, EndOfLine), EndOfLine)
		        Sock.Config.AddChat(True, Colors.GoldenRod, Line)
		      Next
		    End If
		    
		    If Sock.Config.AutoRejoinWhenKicked = True And LenB(Sock.ChannelName) > 0 And _
		      Right(Text, Len("kicked you out of the channel!")) = "kicked you out of the channel!" Then _
		      Sock.Send(Packets.CreateSID_JOINCHANNEL(&H2, Sock.ChannelName))
		      
		  Case &H13
		    
		    For Each Line As String In Split(ReplaceLineEndings(Text, EndOfLine), EndOfLine)
		      Sock.Config.AddChat(True, Colors.FireBrick, Line)
		    Next
		    
		  Case &H17
		    
		    If Sock.Config.SpamPrevention = True Then dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    bTmp = (Sock.Config.SpamPrevention = True And dTmp <> Nil And dTmp.Value("TimeEntered").DoubleValue + 400000 > Microseconds())
		    
		    // If bTmp = True then they are talking at most 0.4 seconds after entering.
		    
		    If dTmp <> Nil Then
		      If bTmp = False And Sock.Config.SpamPrevention = True And Text = dTmp.Value("LastMessage") Then bTmp = True
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    // If bTmp = True now then they may also be repeating their message.
		    
		    If bTmp = False And Globals.MessageBlacklistMatch(Text) = True Then bTmp = True
		    
		    // If bTmp = True now then the message may even also be on the blacklist
		    
		    If BitAnd(Flags, &H20) <= 0 And bTmp = False Then
		      If BitAnd(Flags, &H09) > 0 Then
		        colorA = Colors.GoldenRod
		        colorB = Colors.Cyan
		        colorC = Colors.GoldenRod
		      ElseIf BitAnd(Flags, &H02) > 0 Then
		        colorA = Colors.Silver
		        colorB = Colors.White
		        colorC = Colors.Silver
		      ElseIf Username = Sock.UniqueName Then
		        colorA = Colors.MediumOrchid
		        colorB = Colors.MediumVioletRed
		        colorC = Colors.MediumOrchid
		      Else
		        colorA = Colors.GoldenRod
		        colorB = Colors.Gold
		        colorC = Colors.GoldenRod
		      End If
		      
		      Sock.Config.AddChat(True, colorA, "-- ", colorB, Username, colorA, " ", colorC, Text)
		    End If
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config And _
		      Sock.Config.Container.lstUsers_View = ChatContainer.lstUsers_View_Channel_Activity Then _
		      Sock.Config.Container.lstUsersTimer.Reset()
		      
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown chat event.")
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANCREATIONINVITATION(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 12 Then Return False
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim ClanTag As UInt32 = MemClass.ReadDWORD(PktData, 5, True)
		  Dim ClanName As String = MemClass.ReadCString(PktData, 9)
		  Dim Inviter As String = MemClass.ReadCString(PktData, 10 + LenB(ClanName))
		  Dim MemberCount As Byte = MemClass.ReadByte(PktData, 11 + LenB(ClanName + Inviter))
		  Dim Members() As String
		  Dim i As Integer = 12 + LenB(ClanName + Inviter)
		  
		  While UBound(Members) + 1 < MemberCount
		    Members.Append(MemClass.ReadCString(PktData, i))
		    i = i + 1 + LenB(Members(UBound(Members)))
		  Wend
		  
		  Dim w As New ClanCreationInvitationWindow()
		  Dim ret As Byte = &H00
		  
		  w.fldClanName.Text = ClanName
		  w.fldClanTag.Text = Globals.SClanTag(ClanTag)
		  w.fldClanInviter.Text = Inviter
		  For i = 0 To UBound(Members)
		    w.lstMembers.AddRow(Members(i))
		  Next
		  w.ShowModal()
		  
		  If w <> Nil Then
		    If w.Result = w.btnAccept Then
		      ret = &H06
		    ElseIf w.Result = w.btnDecline Then
		      ret = &H04
		    ElseIf w.Result = w.btnIgnore Then
		      ret = &H00
		    End If
		    w.Close()
		  End If
		  
		  If ret <> &H00 Then Sock.Send(Packets.CreateSID_CLANCREATIONINVITATION(Cookie, ClanTag, Inviter, ret))
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANDISBAND(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  If Cookie <> 0 Then Return False
		  
		  Select Case Result
		  Case &H00 // Successfully disbanded the clan
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: The clan was successfully disbanded.")
		    
		  Case &H04 // Cannot quit clan, not one week old yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: The clan is too new for it to be disbanded.")
		    
		  Case &H05 // Not authorized to disband the clan
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to disband the clan.")
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to disband clan (", Colors.Maroon, _
		    MemClass.HexPrefix(Result, "0x", 2), Colors.Red, ").")
		    
		  End Select
		  
		  If Result = &H00 Then
		    Sock.ClanMembers.Clear()
		    Sock.ClanRank = 0
		    Sock.ClanTag = 0
		    If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANINFO(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 6 Then Return False
		  
		  // (BYTE) Unknown (0)
		  Sock.ClanTag = MemClass.ReadDWORD(PktData, 2, True)
		  Sock.ClanRank = MemClass.ReadBYTE(PktData, 6)
		  
		  If Sock.Config <> Nil Then
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: You are a ", Colors.Teal, Globals.ClanRankName(Sock.ClanRank), _
		    Colors.Cyan, " in ", Colors.Teal, "Clan " + Globals.SClanTag(Sock.ClanTag), Colors.Cyan, ".")
		  End If
		  
		  Sock.Send(Packets.CreateSID_CLANMEMBERLIST(0))
		  
		  Dim Cookie As New Cookie( Cookie.TypeClanMotd )
		  Sock.Send( Packets.CreateSID_CLANMOTD( Cookie.Cookie ))
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANINVITATION(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim CookieId As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Cookie As Cookie = Cookie.Lookup(CookieId, True)
		  
		  If Cookie = Nil Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan invitation reply.")
		    Return True
		  End If
		  
		  Dim Username As String = Cookie.Value("Username")
		  
		  Select Case Result
		  Case &H00 // Invitation accepted
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Clan invitation to ", Colors.Green, Username, Colors.Lime, " accepted.")
		    
		  Case &H04 // Invitation declined
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ", Colors.Maroon, Username, Colors.Red, " rejected.")
		    
		  Case &H05 // Failed to invite user
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ", Colors.Maroon, Username, Colors.Red, " failed.")
		    
		  Case &H09 // Clan is full
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ", Colors.Maroon, Username, Colors.Red, _
		    " failed because the clan is full.")
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ", Colors.Maroon, Username, Colors.Red, " failed (", _
		    Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2), Colors.Red, ").")
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANINVITATIONRESPONSE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 10 Then Return False
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim ClanTag As UInt32 = MemClass.ReadDWORD(PktData, 5, True)
		  Dim ClanName As String = MemClass.ReadCString(PktData, 9)
		  Dim Inviter As String = MemClass.ReadCString(PktData, 10 + LenB(ClanName))
		  
		  Dim w As New ClanInvitationWindow()
		  Dim ret As Byte = &H00
		  
		  w.fldClanName.Text = ClanName
		  w.fldClanTag.Text = Globals.SClanTag(ClanTag)
		  w.fldClanInviter.Text = Inviter
		  w.ShowModal()
		  
		  If w <> Nil Then
		    If w.Result = w.btnAccept Then
		      ret = &H06
		    ElseIf w.Result = w.btnDecline Then
		      ret = &H04
		    ElseIf w.Result = w.btnIgnore Then
		      ret = &H00
		    End If
		    w.Close()
		  End If
		  
		  If ret <> &H00 Then Sock.Send(Packets.CreateSID_CLANINVITATIONRESPONSE(Cookie, ClanTag, Inviter, ret))
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMEMBERINFORMATION(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 15 Then Return False
		  
		  Dim iCookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Status As Byte = MemClass.ReadBYTE(PktData, 5)
		  Dim ClanName As String = MemClass.ReadCString(PktData, 6)
		  Dim ClanRank As Byte = MemClass.ReadBYTE(PktData, 7 + LenB(ClanName))
		  Dim DateJoined As Date = Globals.WindowsFileTimeToDate(_
		  MemClass.ReadDWORD(PktData, 8 + LenB(ClanName)), _
		  MemClass.ReadDWORD(PktData, 12 + LenB(ClanName)))
		  
		  Dim oCookie As Cookie = Cookie.Lookup(iCookie, True)
		  Dim Username As String
		  Dim ClanTag As UInt32
		  If oCookie <> Nil Then
		    Username = oCookie.Value("Username", "").StringValue
		    ClanTag = oCookie.Value("ClanTag", 0).UInt32Value
		  End If
		  
		  Select Case Status
		  Case &H00 // User membership valid
		    
		    Globals.ShowClanMemberInfo(Username, ClanTag, ClanName, ClanRank, DateJoined)
		    
		  Case &H0C // User is not a member of that clan
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: ", Colors.Maroon, Username, _
		    Colors.Red, " is not a member of that clan.")
		    
		  Case Else
		    
		    If Sock.Config <> Nil Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown status ", _
		      Colors.Maroon, "0x" + Right("0000000" + Hex(Status), 8), _
		      Colors.Red, " received from clan member info.")
		    End If
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMEMBERLIST(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 5 Then Return False
		  
		  Dim Buffer As New MemClass(PktData, True)
		  Dim Cookie As UInt32 = Buffer.ReadDWORD()
		  Dim Count As Byte = Buffer.ReadBYTE()
		  
		  If Cookie <> 0 And Cookie <> 1 Then Return False
		  
		  If Sock.Config <> Nil And Cookie = 0 Then
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: There are ", Colors.Teal, Str(Count) + " member" _
		    + IIf(Count <> 1, "s", ""), Colors.Cyan, " in your clan.")
		  End If
		  
		  If Sock.ClanMembers = Nil Then Sock.ClanMembers = New Dictionary() _
		  Else Sock.ClanMembers.Clear()
		    Dim User As Dictionary
		    
		    While Sock.ClanMembers.Count < Count
		      User = New Dictionary()
		      User.Value("Username") = Buffer.ReadCString()
		      User.Value("Rank") = Buffer.ReadBYTE()
		      User.Value("Status") = Buffer.ReadBYTE()
		      User.Value("Location") = Buffer.ReadCString()
		      Sock.ClanMembers.Value(User.Value("Username").StringValue) = User
		      
		      If User.Value("Username") = Sock.AccountName Or User.Value("Username") = Sock.UniqueName Then _
		      Sock.ClanRank = User.Value("Rank")
		    Wend
		    
		    If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMEMBERRANKCHANGE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 3 Then Return False
		  
		  Dim OldRank As Byte = MemClass.ReadBYTE(PktData, 1)
		  Dim NewRank As Byte = MemClass.ReadBYTE(PktData, 2)
		  Dim Username As String = MemClass.ReadCString(PktData, 3)
		  
		  If Sock.ClanMembers = Nil Then
		    Sock.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		    Return True
		  End If
		  
		  Dim User As Dictionary = Sock.ClanMembers.Lookup(Username, Nil)
		  If User = Nil Then
		    Sock.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		    Return True
		  End If
		  
		  User.Value("OldRank") = OldRank
		  User.Value("Rank") = NewRank
		  
		  If Username = Sock.AccountName Or Username = Sock.UniqueName Then Sock.ClanRank = NewRank
		  
		  If Sock.Config <> Nil Then
		    If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ", Colors.Teal, Username, Colors.Cyan, " has been " _
		    + IIf(NewRank > OldRank, "promoted", "demoted") + " from ", Colors.Teal, Globals.ClanRankName(OldRank), _
		    Colors.Cyan, " to ", Colors.Teal, Globals.ClanRankName(NewRank), Colors.Cyan, ".")
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMEMBERREMOVED(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 1 Then Return False
		  
		  Dim Username As String = MemClass.ReadCString(PktData, 1)
		  
		  If Sock.ClanMembers <> Nil And Sock.ClanMembers.HasKey(Username) = True Then Sock.ClanMembers.Remove(Username)
		  
		  If Sock.Config <> Nil Then
		    If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ", Colors.Teal, Username, _
		    Colors.Cyan, " was removed from the clan.")
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMEMBERSTATUSCHANGE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 4 Then Return False
		  
		  Dim Username As String = MemClass.ReadCString(PktData, 1)
		  Dim Rank As Byte = MemClass.ReadBYTE(PktData, 2 + LenB(Username))
		  Dim Status As Byte = MemClass.ReadBYTE(PktData, 3 + LenB(Username))
		  Dim Location As String = MemClass.ReadCString(PktData, 4 + LenB(Username))
		  
		  If Sock.ClanMembers = Nil Then
		    Sock.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		    Return True
		  End If
		  
		  Dim User As Dictionary = Sock.ClanMembers.Lookup(Username, Nil)
		  If User = Nil Then
		    Sock.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		    Return True
		  End If
		  
		  User.Value("Status") = Status
		  User.Value("Location") = Location
		  
		  If Rank <> User.Value("Rank") Then
		    User.Value("OldRank") = User.Value("Rank")
		    User.Value("Rank") = Rank
		    If Sock.Config <> Nil Then
		      If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		      Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		      Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ", Colors.Teal, Username, Colors.Cyan, " has been " _
		      + IIf(Rank > User.Value("OldRank"), "promoted", "demoted") + " from ", Colors.Teal, _
		      Globals.ClanRankName(User.Value("OldRank")), Colors.Cyan, " to ", Colors.Teal, _
		      Globals.ClanRankName(Rank), Colors.Cyan, ".")
		    End If
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANMOTD(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB( PktData ) < 9 Then Return False
		  
		  Dim CookieId As UInt32 = MemClass.ReadDWORD( PktData, 1, True )
		  Dim Unknown As UInt32 = MemClass.ReadDWORD( PktData, 5, True )
		  Dim Message As String = MemClass.ReadCString( PktData, 9 )
		  
		  Dim Cookie As Cookie = Cookie.Lookup( CookieId, True )
		  
		  If Cookie = Nil Then
		    Sock.Config.AddChat( True, Colors.Red, "BNET: Received unknown clan message of the day response." )
		    Return True
		  End If
		  
		  If Unknown <> 0 Then
		    Sock.Config.AddChat( True, Colors.Red, "BNET: SID_CLANMOTD unknown value is non-zero (" + MemClass.HexPrefix( Unknown, "0x" ) + ")." )
		  End If
		  
		  If LenB( Message ) = 0 Then
		    Sock.Config.AddChat( True, Colors.GoldenRod, "BNET: There is no message of the day for the clan." )
		  Else
		    Sock.Config.AddChat( True, Colors.GoldenRod, "BNET: Clan message of the day:" )
		    Sock.Config.AddChat( True, Colors.GoldenRod, Message )
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANQUITNOTIFY(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 1 Then Return False
		  
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 1)
		  
		  If Result = &H01 Then
		    
		    If Sock.ClanMembers <> Nil Then Sock.ClanMembers.Clear()
		    Sock.ClanMembers = Nil
		    Sock.ClanRank = 0
		    Sock.ClanTag = 0
		    
		    If Sock.Config <> Nil Then
		      If MainWindow.GetSelectedConfig() = Sock.Config And Sock.Config.Container.lstUsers_Viewing_Clan() Then _
		      Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		      Sock.Config.AddChat(True, Colors.Cyan, "BNET: You are no longer in a clan.")
		    End If
		    
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANRANKCHANGE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim CookieId As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Cookie As Cookie = Cookie.Lookup(CookieId, True)
		  
		  If Cookie = Nil Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan rank change reply." + EndOfLine)
		    Return True
		  End If
		  
		  Dim Username As String = Cookie.Value("Username")
		  
		  Select Case Result
		  Case &H00 // Successfully changed rank
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Successfully changed the rank of ", Colors.Green, Username, Colors.Lime, ".")
		    
		  Case &H01 // Failed to change rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to change the rank of ", Colors.Maroon, Username, Colors.Red, ".")
		    
		  Case &H02 // Cannot change user's rank yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Cannot change the rank of ", Colors.Maroon, Username, Colors.Red, " yet.")
		    
		  Case &H07 // Not authorized to change user rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to change the rank of ", Colors.Maroon, Username, Colors.Red, ".")
		    
		  Case &H08 // Not allowed to change user rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not allowed to change the rank of ", Colors.Maroon, Username, Colors.Red, ".")
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan rank change for ", Colors.Maroon, Username, Colors.Red, " failed (", _
		    Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2), Colors.Red, ").")
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANREMOVEMEMBER(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim CookieId As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Cookie As Cookie = Cookie.Lookup(CookieId, True)
		  
		  If Cookie = Nil Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan member removal reply.")
		    Return True
		  End If
		  
		  Dim Username As String = Cookie.Value("Username")
		  
		  Select Case Result
		  Case &H00 // Removed
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Successfully removed ", Colors.Green, Username, Colors.Lime, " from the clan.")
		    
		  Case &H01 // Removal failed
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to remove ", Colors.Maroon, Username, Colors.Red, " from the clan.")
		    
		  Case &H02 // Cannot be removed yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Cannot remove ", Colors.Maroon, Username, Colors.Red, " from the clan yet.")
		    
		  Case &H07 // Not authorized to remove
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to remove ", Colors.Maroon, Username, Colors.Red, " from the clan.")
		    
		  Case &H08 // Not allowed to remove
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not allowed to remove ", Colors.Maroon, Username, Colors.Red, " from the clan.")
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan member removal for ", Colors.Maroon, Username, Colors.Red, " failed (", _
		    Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2), Colors.Red, ").")
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CREATEACCOUNT2(Sock As BNETSocket, PktData As String) As Boolean
		  
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 5 Then Return False
		  
		  Dim Result As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim NameSuggestion As String = MemClass.ReadCString(PktData, 5)
		  
		  #pragma Unused NameSuggestion
		  
		  If Sock.Config <> Nil Then
		    Select Case Result
		    Case &H00 // Account created
		      Sock.Config.AddChat(True, Colors.Lime, "BNET: Account created successfully.")
		    Case &H01
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name is too short.")
		    Case &H02
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains invalid characters.")
		    Case &H03
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name uses a banned word.")
		    Case &H04
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account already exists.")
		    Case &H05
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account is still being created.")
		    Case &H06
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name doesn't have enough alphanumeric characters.")
		    Case &H07
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains adjacent punctuations.")
		    Case &H08
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains too many punctuations.")
		    Case Else
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown logon result.")
		    End Select
		  End If
		  
		  If (Result = &H00 Or Result = &H05) Or (Result = &H04 And Sock.Config.CreateAccountsFirst = True) Then
		    
		    // Try to logon...
		    Packets.SendLogonPkt(Sock, True)
		    Return True
		    
		  Else
		    
		    Sock.DoDisconnect(False)
		    Return False
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_ENTERCHAT(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 3 Then Return False
		  
		  Sock.UniqueName = MemClass.ReadCString(PktData, 1)
		  Sock.Statstring = MemClass.ReadCString(PktData, 2 + LenB(Sock.UniqueName))
		  Sock.AccountName = MemClass.ReadCString(PktData, 3 + LenB(Sock.UniqueName + Sock.Statstring))
		  
		  If Sock.Config <> Nil Then
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Logged on as ", Colors.Teal, Sock.UniqueName, Colors.Cyan, "!")
		  End If
		  
		  Sock.Send(Packets.CreateSID_GETCHANNELLIST(Sock.Product))
		  Sock.Send(Packets.CreateSID_FRIENDSLIST())
		  
		  Dim Cookie As New Cookie(Cookie.TypeExtendedAccount)
		  Dim ProfileKeys() As String
		  
		  Cookie.Value("Username") = Sock.AccountName
		  Cookie.Value("Product") = Sock.Product
		  
		  // Extended Account Info
		  ProfileKeys.Append("System\Account Created")
		  ProfileKeys.Append("System\Last Logoff")
		  ProfileKeys.Append("System\Last Logon")
		  ProfileKeys.Append("System\Time Logged")
		  
		  Cookie.Value("Keys") = ProfileKeys
		  
		  Sock.Send(Packets.CreateSID_READUSERDATA(Cookie.Cookie, Array(Sock.AccountName), ProfileKeys))
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FLOODDETECTED(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) <> 0 Then Return False
		  
		  Sock.Config.AddChat(True, Colors.Red, "BNET: You have been disconnected for flooding.")
		  Sock.DoDisconnect(False)
		  
		  Sock.ReconnectTimer.Period = (1000 * 120) // reconnect in 2 minutes
		  Sock.ReconnectTimer.Mode = Sock.ReconnectTimer.ModeSingle
		  Sock.ReconnectTimer.Enabled = True
		  
		  Sock.ReturnChannel = Sock.ChannelName
		  
		  'Sock.Config.AddChat(True, Colors.Red, "BNET: Reconnecting in 2 minutes..." + EndOfLine)
		  
		  Return False // normally we'd return true, but we disconnect here, so we want to cancel the loop...
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FRIENDSADD(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 8 Then Return False
		  
		  Dim Username As String = MemClass.ReadCString(PktData, 1)
		  Dim Status As Byte = AscB(MidB(PktData, 2 + LenB(Username), 1))
		  Dim Location As Byte = AscB(MidB(PktData, 3 + LenB(Username), 1))
		  Dim Product As UInt32 = MemClass.ReadDWORD(PktData, 4 + LenB(Username), True)
		  Dim LocationName As String = MemClass.ReadCString(PktData, 8 + LenB(Username))
		  
		  Dim dTmp As New Dictionary()
		  dTmp.Value("Username") = Username
		  dTmp.Value("Status") = Status
		  dTmp.Value("Location") = Location
		  dTmp.Value("Product") = Product
		  dTmp.Value("Location Name") = LocationName
		  
		  If Sock.FriendsList = Nil Then Sock.FriendsList = New Dictionary()
		  Sock.FriendsList.Value(Sock.FriendsList.Count) = dTmp
		  
		  If Sock.Config.Container <> Nil And _
		    Sock.Config.Container.lstUsers_Viewing_Friends() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FRIENDSLIST(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 1 Then Return False
		  
		  Dim Buffer As New MemClass(PktData, True)
		  Dim dTmp As Dictionary
		  
		  Dim Count As Byte = Buffer.ReadBYTE()
		  
		  If Sock.FriendsList = Nil Then Sock.FriendsList = New Dictionary() Else Sock.FriendsList.Clear()
		  While Sock.FriendsList.Count < Count
		    
		    dTmp = New Dictionary()
		    dTmp.Value("Username") = Buffer.ReadCString()
		    dTmp.Value("Status") = Buffer.ReadBYTE()
		    dTmp.Value("Location") = Buffer.ReadBYTE()
		    dTmp.Value("Product") = Buffer.ReadDWORD()
		    dTmp.Value("Location Name") = Buffer.ReadCString()
		    
		    Sock.FriendsList.Value(Sock.FriendsList.Count) = dTmp
		    
		  Wend
		  
		  If Sock.Config.Container <> Nil And _
		    Sock.Config.Container.lstUsers_Viewing_Friends() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FRIENDSPOSITION(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) <> 2 Then Return False
		  
		  Dim OldIndex As Byte = AscB(MidB(PktData, 1, 1))
		  Dim NewIndex As Byte = AscB(MidB(PktData, 2, 1))
		  
		  If Sock.FriendsList = Nil Then
		    Sock.FriendsList = New Dictionary()
		    // Since we don't have the list, we have to recheck ourselves:
		    Sock.Send(Packets.CreateSID_FRIENDSLIST())
		  Else
		    If Sock.FriendsList.HasKey(OldIndex) = False Or Sock.FriendsList.HasKey(NewIndex) = False Then
		      // Since we don't have one of the two indexes, we have to recheck ourselves:
		      Sock.Send(Packets.CreateSID_FRIENDSLIST())
		    Else
		      Dim dTmp1 As Dictionary = Sock.FriendsList.Value(OldIndex)
		      Dim dTmp2 As Dictionary = Sock.FriendsList.Value(NewIndex)
		      Sock.FriendsList.Remove(OldIndex)
		      Sock.FriendsList.Remove(NewIndex)
		      Sock.FriendsList.Value(OldIndex) = dTmp2
		      Sock.FriendsList.Value(NewIndex) = dTmp1
		    End If
		  End If
		  
		  If Sock.Config.Container <> Nil And _
		    Sock.Config.Container.lstUsers_Viewing_Friends() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FRIENDSREMOVE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) <> 1 Then Return False
		  
		  Dim Index As Byte = AscB(MidB(PktData, 1, 1))
		  
		  If Sock.FriendsList = Nil Then
		    Sock.FriendsList = New Dictionary()
		  Else
		    If Sock.FriendsList.HasKey(Index) = True Then _
		    Sock.FriendsList.Remove(Index)
		  End If
		  
		  If Sock.Config.Container <> Nil And _
		    Sock.Config.Container.lstUsers_Viewing_Friends() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FRIENDSUPDATE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 8 Then Return False
		  
		  Dim Index As Byte = AscB(MidB(PktData, 1, 1))
		  Dim Status As Byte = AscB(MidB(PktData, 2, 1))
		  Dim Location As Byte = AscB(MidB(PktData, 3, 1))
		  Dim Product As UInt32 = MemClass.ReadDWORD(PktData, 4, True)
		  Dim LocationName As String = MemClass.ReadCString(PktData, 8)
		  
		  Dim dTmp As Dictionary = Sock.FriendsList.Lookup(Index, Nil)
		  If dTmp = Nil Then
		    dTmp = New Dictionary()
		    Sock.FriendsList.Value(Index) = dTmp
		    // Since we don't have this index, we have to recheck ourselves:
		    Sock.Send(Packets.CreateSID_FRIENDSLIST())
		  End If
		  
		  If dTmp.HasKey("Username") = False Then dTmp.Value("Username") = ""
		  dTmp.Value("Status") = Status
		  dTmp.Value("Location") = Location
		  dTmp.Value("Product") = Product
		  dTmp.Value("Location Name") = LocationName
		  
		  If Sock.Config.Container <> Nil And _
		    Sock.Config.Container.lstUsers_Viewing_Friends() Then _
		    Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		    
		    #If DebugBuild = True Then
		      If BitAnd(Status, &H01) > 0 Then
		        Select Case Location
		        Case &H00 // User went offline; Battle.net will send a whisper so no message needs to be displayed.
		        Case &H01 // Sent SID_LEAVECHAT to Battle.net.
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Your friend " + dTmp.Value("Username") + " left chat.")
		        Case &H02 // Entered chat.
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Your friend " + dTmp.Value("Username") + " entered the channel " + LocationName + ".")
		        Case &H03 // Joined a public game.
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Your friend " + dTmp.Value("Username") + " entered the game " + LocationName + ".")
		        Case &H04 // Joined a private game, not on friends list.
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Your friend " + dTmp.Value("Username") + " entered a private game.")
		        Case &H05 // Joined a private game, on friends list.
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Your friend " + dTmp.Value("Username") + " entered the private game " + LocationName + ".")
		        Case Else // ???
		          Sock.Config.AddChat(True, Colors.Gray, "BNET: Received unknown friend location in an update! " + MemClass.HexPrefix(Location, "0x", 2))
		        End Select
		      End If
		    #EndIf
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_GETCHANNELLIST(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 1 Then Return False
		  
		  Dim Channels(), sTmp As String, i As Integer = 1
		  While i <= LenB(PktData)
		    sTmp = MemClass.ReadCString(PktData, i)
		    Channels.Append(sTmp)
		    i = i + 1 + LenB(sTmp)
		  Wend
		  
		  If LenB(Channels(UBound(Channels))) < 1 Then Channels.Remove(UBound(Channels))
		  
		  Sock.Channels = Channels
		  
		  If Sock.Config <> Nil And Sock.Config.Container.lstUsers_Viewing_ChannelList() Then _
		  Sock.Config.Container.lstUsers_View = Sock.Config.Container.lstUsers_View
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_LOGONRESPONSE2(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 4 Then Return False
		  
		  Dim Result As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim MoreInfo As String = MemClass.ReadCString(PktData, 5)
		  
		  Select Case Result
		  Case &H00 // Success
		    
		    If Sock.BNLS <> Nil Then Sock.BNLS.Close()
		    Packets.SendAfterLogonSIDs(Sock)
		    Return True
		    
		  Case &H01 // Account does not exist
		    
		    If Sock.Config <> Nil Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account is non-existant; ", Colors.Yellow, "creating it...")
		    End If
		    
		    // Try to create the account...
		    Sock.Send(Packets.CreateSID_CREATEACCOUNT2(Globals.EncryptOLSPW(Sock.Password), Sock.Username))
		    Return True
		    
		  Case &H02 // Invalid password
		    
		    If Sock.Config <> Nil Then Sock.Config.AddChat(True, Colors.Red, "BNET: Your password is incorrect.")
		    Sock.DoDisconnect(False)
		    Return False
		    
		  Case &H06 // Account closed
		    
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your account has been closed.") Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: " + MoreInfo)
		    Sock.DoDisconnect(False)
		    Return False
		    
		  Case Else // Unknown result code
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown logon result.")
		    Sock.DoDisconnect(False)
		    Return False
		    
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_MESSAGEBOX(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 6 Then Return False
		  
		  Dim Style As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim Text As String = MemClass.ReadCString(PktData, 5)
		  Dim Caption As String = MemClass.ReadCString(PktData, 6 + LenB(Text))
		  
		  #pragma Unused Style
		  
		  If Text = "You have been disconnected for flooding." Then Return True
		  If Sock.Config = Nil Then Return True
		  
		  If Caption <> "Battle.net" Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Message from Battle.net: " + Caption)
		  Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Message from Battle.net:")
		  End If
		  
		  Dim Lines() As String = Split(ReplaceLineEndings(Text, Chr(13)), Chr(13))
		  For Each Line As String In Lines
		    Sock.Config.AddChat(True, Colors.Red, "BNET: " + Line)
		  Next
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_NULL(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 0 Then Return False
		  
		  Sock.LastNullReceive = Microseconds()
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_PING(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 4 Then Return False
		  
		  Sock.Send(Packets.CreateSID_PING(PktData))
		  Sock.Poll()
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_READUSERDATA(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) < 12 Then Return False
		  
		  Dim Buffer As New MemClass(PktData, True)
		  
		  Dim AccountCount As UInt32 = Buffer.ReadDWORD()
		  Dim KeyCount As UInt32 = Buffer.ReadDWORD()
		  Dim CookieId As UInt32 = Buffer.ReadDWORD()
		  
		  Dim Cookie As Cookie = Cookie.Lookup(CookieId, True)
		  
		  If Cookie = Nil Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown user data response.")
		    Return True
		  End If
		  
		  Select Case Cookie.Type
		  Case Cookie.TypeExtendedAccount
		    Dim sAccountCreated As String = Buffer.ReadCString()
		    Dim sLastLogoff As String = Buffer.ReadCString()
		    Dim sLastLogon As String = Buffer.ReadCString()
		    Dim sTimeLogged As String = Buffer.ReadCString()
		    
		    Dim oDate As New Date()
		    Dim oAccountCreated As Date
		    Dim oLastLogoff As Date
		    Dim oLastLogon As Date
		    
		    If Len(sAccountCreated) > 0 Then
		      oAccountCreated = Globals.WindowsFileTimeToDate(_
		      Val(NthField(sAccountCreated, " ", 2)), Val(NthField(sAccountCreated, " ", 1)))
		    End If
		    If Len(sLastLogoff) > 0 Then
		      oLastLogoff = Globals.WindowsFileTimeToDate(_
		      Val(NthField(sLastLogoff, " ", 2)), Val(NthField(sLastLogoff, " ", 1)))
		    End If
		    If Len(sLastLogon) > 0 Then
		      oLastLogon = Globals.WindowsFileTimeToDate(_
		      Val(NthField(sLastLogon, " ", 2)), Val(NthField(sLastLogon, " ", 1)))
		    End If
		    If Len(sTimeLogged) > 0 Then
		      sTimeLogged = Globals.TimeString(Val(sTimeLogged), False, True)
		    End If
		    
		    If oAccountCreated <> Nil Then
		      oAccountCreated.GMTOffset = oAccountCreated.GMTOffset + oDate.GMTOffset
		      Sock.Config.AddChat(True, Colors.Gray, "Account Created: " + _
		      oAccountCreated.ShortDate + " " + oAccountCreated.LongTime)
		    End If
		    If oLastLogoff <> Nil Then
		      oLastLogoff.GMTOffset = oLastLogoff.GMTOffset + oDate.GMTOffset
		      Sock.Config.AddChat(True, Colors.Gray, "Last Logoff: " + _
		      oLastLogoff.ShortDate + " " + oLastLogoff.LongTime)
		    End If
		    If oLastLogon <> Nil Then
		      oLastLogon.GMTOffset = oLastLogon.GMTOffset + oDate.GMTOffset
		      Sock.Config.AddChat(True, Colors.Gray, "Last Logon: " + _
		      oLastLogon.ShortDate + " " + oLastLogon.LongTime)
		    End If
		    If Len(sTimeLogged) > 0 Then
		      Sock.Config.AddChat(True, Colors.Gray, "Time Logged: " + sTimeLogged)
		    End If
		    
		  Case Cookie.TypeProfile
		    Dim Values() As String
		    
		    While UBound(Values) + 1 < AccountCount * KeyCount
		      Values.Append(Buffer.ReadCString())
		    Wend
		    
		    Globals.AddProfileDialog(Sock.Config, Cookie.Value("Username"), Cookie.Value("Keys"), Values, Cookie.Value("Product"))
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown user data response.")
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_REQUIREDWORK(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 1 Then Return False
		  
		  Sock.RequiredWorkMPQ = MemClass.ReadCString(PktData, 1)
		  
		  If Sock.Config <> Nil Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Required Work Archive: ", Colors.GoldenRod, Sock.RequiredWorkMPQ)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_SETEMAIL(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 0 Then Return False
		  If LenB(Sock.Config.EmailAddress) < 1 Then Return True
		  
		  Sock.Send(Packets.CreateSID_SETEMAIL(Sock.Config.EmailAddress))
		  
		  If Sock.Config <> Nil Then
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Binded ", Colors.Teal, Sock.Config.EmailAddress, Colors.Cyan, " to the account.")
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Receive(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  Sock.DataBuffer = Sock.DataBuffer + Sock.ReadAll()
		  
		  If Sock.Product = Packets.BNETProduct_CHAT And Sock.Init6Protocol = True Then
		    Packets.ReceiveInit6(Sock)
		  ElseIf Sock.Product = Packets.BNETProduct_CHAT And Sock.Init6Protocol = False Then
		    Packets.ReceiveCHAT(Sock)
		  Else
		    Packets.ReceiveSID(Sock)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Receive(Sock As BNLSSocket)
		  
		  If Sock = Nil Then Return
		  Sock.DataBuffer = Sock.DataBuffer + Sock.ReadAll()
		  
		  Dim PktLen As UInt16
		  Dim PktID As Byte
		  Dim PktData As String
		  
		  While LenB(Sock.DataBuffer) >= 3
		    
		    PktLen = MemClass.ReadWORD(Sock.DataBuffer, 1, True)
		    
		    If LenB(Sock.DataBuffer) < PktLen Then Exit While
		    
		    PktID = AscB(MidB(Sock.DataBuffer, 3, 1))
		    PktData = MidB(Sock.DataBuffer, 4, PktLen - 3)
		    Sock.DataBuffer = MidB(Sock.DataBuffer, PktLen + 1)
		    
		    If Packets.Parse(Sock, PktID, PktData) = False Then Exit While
		    
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReceiveCHAT(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  Dim Data As String = ReplaceLineEndings(Sock.DataBuffer, EndOfLine)
		  Dim Line As String
		  
		  While InStr(Data, EndOfLine) > 0
		    Line = NthField(Data, EndOfLine, 1)
		    Data = Mid(Data, Len(Line + EndOfLine) + 1)
		    
		    If Packets.Parse(Sock, Line) = False Then Exit While
		    
		  Wend
		  
		  Sock.DataBuffer = Data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReceiveInit6(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  Dim Data As String = ReplaceLineEndings(Sock.DataBuffer, EndOfLine)
		  Dim Line As String
		  
		  While InStr(Data, EndOfLine) > 0
		    Line = NthField(Data, EndOfLine, 1)
		    Data = Mid(Data, Len(Line + EndOfLine) + 1)
		    
		    If Packets.ParseInit6(Sock, Line) = False Then Exit While
		    
		  Wend
		  
		  Sock.DataBuffer = Data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReceiveSID(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  
		  Dim PktID As Byte
		  Dim PktLen As UInt16
		  Dim PktData As String
		  Dim PktFull As String
		  
		  While LenB(Sock.DataBuffer) >= 4
		    
		    If AscB(MidB(Sock.DataBuffer, 1, 1)) <> &HFF Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Packet parse error -- invalid header checksum.")
		      Sock.DataBuffer = ""
		      Exit While
		    End If
		    
		    PktID = AscB(MidB(Sock.DataBuffer, 2, 1))
		    PktLen = MemClass.ReadWORD(Sock.DataBuffer, 3, True)
		    
		    If LenB(Sock.DataBuffer) < PktLen Then Exit While
		    
		    PktData = MidB(Sock.DataBuffer, 5, PktLen - 4)
		    PktFull = MidB(Sock.DataBuffer, 1, PktLen)
		    Sock.DataBuffer = MidB(Sock.DataBuffer, PktLen + 1)
		    
		    If Packets.Parse(Sock, PktID, PktData, PktFull) = False Then Exit While
		    
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendAfterLogonSIDs(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  If Sock.IsConnected = False Then Return
		  If Sock.Config = Nil Then Return
		  
		  Sock.LogonTimeoutTimer.Enabled = False
		  
		  If Sock.UDPCodeSet = True Then
		    If Globals.IsWarcraftII(Sock.Product) = True Or Globals.IsStarcraft(Sock.Product) = True Or _
		      Globals.IsDiablo(Sock.Product) = True Then Sock.Send(Packets.CreateSID_UDPPINGRESPONSE(Sock.UDPCode))
		    Else
		      Sock.WaitingForUDP = True
		    End If
		    
		    Sock.Send(Packets.CreateSID_ENTERCHAT(Sock.Username, ""))
		    
		    If LenB(Sock.ReturnChannel) > 0 Then
		      Sock.Send(Packets.CreateSID_JOINCHANNEL(&H02, Sock.ReturnChannel))
		      Sock.ReturnChannel = ""
		    ElseIf LenB(Sock.Config.HomeChannel) > 0 Then
		      Sock.Send(Packets.CreateSID_JOINCHANNEL(&H02, Sock.Config.HomeChannel))
		    Else
		      Dim Flags As UInt32 = &H01
		      If Sock.Product = Packets.BNETProduct_D2DV Or Sock.Product = Packets.BNETProduct_D2XP Then Flags = &H05
		      Sock.Send(Packets.CreateSID_JOINCHANNEL(Flags, Globals.ProductName(Sock.Product, True)))
		    End If
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendFirstSIDs(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  
		  If Sock.Product = Packets.BNETProduct_CHAT And Sock.Init6Protocol = True Then
		    
		    Sock.Send("C1" + EndOfLine.Windows)
		    Sock.Send("ACCT " + Sock.Username + EndOfLine.Windows)
		    Sock.Send("PASS " + Sock.Password + EndOfLine.Windows)
		    
		    If Sock.Config <> Nil And Len(Sock.Config.HomeChannel) > 0 Then
		      Sock.Send("HOME " + Sock.Config.HomeChannel + EndOfLine.Windows)
		    End If
		    
		    Sock.Send("LOGIN" + EndOfLine.Windows)
		    
		  ElseIf Sock.Product = Packets.BNETProduct_CHAT And Sock.Init6Protocol = False Then
		    
		    Sock.Send(&H03)
		    Sock.Send(&H04)
		    Sock.Send(Sock.Username + ChrB(13))
		    Sock.Send(Sock.Password + ChrB(13))
		    
		  Else
		    
		    Sock.Send(&H01)
		    Sock.Send(Packets.CreateSID_AUTH_INFO(&H00000000, Sock.Platform, Sock.Product, Sock.VersionByte, _
		    &H00000000, Globals.IPToDWORD(Sock.LocalAddress), Globals.TimezoneBias(), 1033, 1033, "USA", "United States"))
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SendLogonPkt(Sock As BNETSocket, SkipAccountCreate As Boolean = False)
		  
		  Select Case Sock.LogonType
		  Case &H0 //OLS
		    
		    If Sock.Config.CreateAccountsFirst = False Or SkipAccountCreate = True Then
		      Sock.Send(Packets.CreateSID_LOGONRESPONSE2(Sock.ClientToken, Sock.ServerToken, _
		      Globals.EncryptOLSPW(Sock.Password, Sock.ClientToken, Sock.ServerToken), _
		      Sock.Username))
		      Sock.LogonTimeoutTimer.Enabled = True
		    Else
		      Sock.Send(Packets.CreateSID_CREATEACCOUNT2(Globals.BSHA1(Sock.Password), Sock.Username))
		    End If
		    
		  Case &H1, &H2 //NLS
		    
		    If Sock.NLS = Nil Then Sock.NLS = New NLS(Sock.Username, Sock.Password)
		    If Sock.Config.CreateAccountsFirst = False Or SkipAccountCreate = True Then
		      Sock.Send(Packets.CreateSID(Packets.SID_AUTH_ACCOUNTLOGON, Sock.NLS.AccountLogon()))
		    Else
		      Sock.Send(Packets.CreateSID(Packets.SID_AUTH_ACCOUNTCREATE, Sock.NLS.AccountCreate()))
		    End If
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SendSID_AUTH_CHECK(Sock As BNETSocket, FromBNLS As Boolean = False) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  
		  If Sock.Config.BNLSEnabled = True And Sock.Config.BNLSVersionCheck = True And FromBNLS = False Then
		    If Sock.BNLS <> Nil And Sock.BNLS.IsConnected = False And Sock.BNLS.IsConnecting = False Then Sock.BNLS.DoConnect()
		    Sock.BNLS.Send(Packets.CreateBNLS_VERSIONCHECKEX2(Globals.ProductConvert(Sock.Product, True), _
		    &H00000000, Packets.SID_AUTH_CHECK, Sock.MPQFiletime, Sock.MPQFilename, Sock.ValueString))
		    Return True
		  End If
		  
		  Dim EXEChecksum As UInt32
		  Dim EXEInfo As String
		  Dim EXEVersion As UInt32
		  Dim CRevResult As UInt32
		  
		  If FromBNLS = False Then
		    If Settings.CheckRevDLL = Nil Or Not Settings.CheckRevDLL.Exists Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Error - it appears CheckRevision.dll is missing." + EndOfLine)
		      Sock.DoDisconnect()
		      Return False
		    End If
		    
		    CRevResult = Globals.CheckRevision(Sock.Product, Sock.ValueString, _
		    EXEVersion, EXEChecksum, EXEInfo, Sock.MPQFilename)
		    
		    If CRevResult = &H0 Then
		      // Invalid check revision
		      Sock.Config.AddChat(True, Colors.Red, "BNET: CheckRevision.dll failed. Use BNLS or update local hashes." + EndOfLine)
		      Sock.DoDisconnect(False)
		      Return False
		    End If
		    
		    Sock.EXEChecksum = EXEChecksum
		    Sock.EXEInfo = EXEInfo
		    Sock.EXEVersion = EXEVersion
		  End If
		  
		  Dim CDKeys(), TempKey As String
		  Dim NeedsKey1, NeedsKey2 As Boolean
		  
		  NeedsKey1 = (Len(Sock.Config.CDKey) > 0)
		  NeedsKey2 = (Len(Sock.Config.CDKeyExpansion) > 0)
		  
		  If NeedsKey1 And Not Globals.NeedsCDKey(Sock.Product) Then
		    Sock.Config.AddChat(True, Colors.Orange, "BNET: Original CD-Key is being used when it's considered not required." + EndOfLine)
		  ElseIf Not NeedsKey1 And Globals.NeedsCDKey(Sock.Product) Then
		    Sock.Config.AddChat(True, Colors.Orange, "BNET: Original CD-Key is missing when it's considered required." + EndOfLine)
		  End If
		  
		  If NeedsKey2 And Not Globals.NeedsCDKeyExpansion(Sock.Product) Then
		    Sock.Config.AddChat(True, Colors.Orange, "BNET: Expansion-set CD-Key is being used when it's considered not required." + EndOfLine)
		  ElseIf Not NeedsKey2 And Globals.NeedsCDKeyExpansion(Sock.Product) Then
		    Sock.Config.AddChat(True, Colors.Orange, "BNET: Expansion-set CD-Key is missing when it's considered required." + EndOfLine)
		  End If
		  
		  // CD-Key decrypting begins here.
		  // Exclude any products that don't use CD-Keys now.
		  If NeedsKey1 Or NeedsKey2 Then
		    
		    If Settings.BNCSUtil = Nil Or Not Settings.BNCSUtil.Exists Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Error - it appears " + App.BNCSUtil + " is missing." + EndOfLine)
		      Sock.DoDisconnect()
		      Return False
		    End If
		    
		    // Decrypt original CD-Key
		    If NeedsKey1 Then
		      TempKey = Globals.DecryptCDKey(Sock.Config.CDKey, Sock.ClientToken, Sock.ServerToken)
		      If LenB(TempKey) < 1 Then
		        // Invalid CD-Key
		        Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to validate your CD-Key." + EndOfLine)
		        Sock.DoDisconnect(False)
		        Return False
		      End If
		      CDKeys.Append(TempKey)
		    End If
		    
		    // Decrypt expansion CD-Key, if necessary
		    //
		    If NeedsKey2 Then
		      TempKey = Globals.DecryptCDKey(Sock.Config.CDKeyExpansion, Sock.ClientToken, Sock.ServerToken)
		      If LenB(TempKey) < 1 Then
		        // Invalid CD-Key
		        Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to validate your expansion-set CD-Key." + EndOfLine)
		        Sock.DoDisconnect(False)
		        Return False
		      End If
		      CDKeys.Append(TempKey)
		    End If
		    
		  End If
		  
		  // Send SID_AUTH_CHECK with or without CD-Keys...
		  Sock.Send(Packets.CreateSID_AUTH_CHECK(Sock.ClientToken, Sock.EXEVersion, Sock.EXEChecksum, Sock.EXEInfo, _
		  Sock.Config.CDKeyOwner, (Sock.Config.CDKeySpawn = True And (Globals.IsStarcraft(Sock.Product) Or _
		  Globals.IsWarcraftII(Sock.Product))), CDKeys))
		  
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = BNETPlatform, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&H49583836"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&H49583836"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"&H584D4143"
		#Tag Instance, Platform = Mac Classic, Language = Default, Definition  = \"&H504D4143"
	#tag EndConstant

	#tag Constant, Name = BNETPlatform_IX86, Type = Double, Dynamic = False, Default = \"&H49583836", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETPlatform_PMAC, Type = Double, Dynamic = False, Default = \"&H504D4143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETPlatform_XMAC, Type = Double, Dynamic = False, Default = \"&H584D4143", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_CHAT, Type = Double, Dynamic = False, Default = \"&H43484154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_D2DV, Type = Double, Dynamic = False, Default = \"&H44324456", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_D2XP, Type = Double, Dynamic = False, Default = \"&H44325850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_DRTL, Type = Double, Dynamic = False, Default = \"&H4452544C", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_DSHR, Type = Double, Dynamic = False, Default = \"&H44534852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_JSTR, Type = Double, Dynamic = False, Default = \"&H4A535452", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_SEXP, Type = Double, Dynamic = False, Default = \"&H53455850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_SSHR, Type = Double, Dynamic = False, Default = \"&H53534852", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_STAR, Type = Double, Dynamic = False, Default = \"&H53544152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_W2BN, Type = Double, Dynamic = False, Default = \"&H5732424E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_W3DM, Type = Double, Dynamic = False, Default = \"&H5733444D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_W3XP, Type = Double, Dynamic = False, Default = \"&H57335850", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNETProduct_WAR3, Type = Double, Dynamic = False, Default = \"&H57415233", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_IPBAN, Type = Double, Dynamic = False, Default = \"&HFF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_NULL, Type = Double, Dynamic = False, Default = \"&H00", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_REQUESTVERSIONBYTE, Type = Double, Dynamic = False, Default = \"&H10", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_VERSIONCHECKEX2, Type = Double, Dynamic = False, Default = \"&H1A", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PKT_CONNTEST2, Type = Double, Dynamic = False, Default = \"&H09", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PKT_SERVERPING, Type = Double, Dynamic = False, Default = \"&H05", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_AUTH_ACCOUNTCREATE, Type = Double, Dynamic = False, Default = \"&H52", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_AUTH_ACCOUNTLOGON, Type = Double, Dynamic = False, Default = \"&H53", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_AUTH_ACCOUNTLOGONPROOF, Type = Double, Dynamic = False, Default = \"&H54", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_AUTH_CHECK, Type = Double, Dynamic = False, Default = \"&H51", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_AUTH_INFO, Type = Double, Dynamic = False, Default = \"&H50", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CHATCOMMAND, Type = Double, Dynamic = False, Default = \"&H0E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CHATEVENT, Type = Double, Dynamic = False, Default = \"&H0F", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANCREATIONINVITATION, Type = Double, Dynamic = False, Default = \"&H72", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANDISBAND, Type = Double, Dynamic = False, Default = \"&H73", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANINFO, Type = Double, Dynamic = False, Default = \"&H75", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANINVITATION, Type = Double, Dynamic = False, Default = \"&H77", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANINVITATIONRESPONSE, Type = Double, Dynamic = False, Default = \"&H79", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMEMBERANKCHANGE, Type = Double, Dynamic = False, Default = \"&H81", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMEMBERINFORMATION, Type = Double, Dynamic = False, Default = \"&H82", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMEMBERLIST, Type = Double, Dynamic = False, Default = \"&H7D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMEMBERREMOVED, Type = Double, Dynamic = False, Default = \"&H7E", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMEMBERSTATUSCHANGE, Type = Double, Dynamic = False, Default = \"&H7F", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANMOTD, Type = Double, Dynamic = False, Default = \"&H7C", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANQUITNOTIFY, Type = Double, Dynamic = False, Default = \"&H76", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANRANKCHANGE, Type = Double, Dynamic = False, Default = \"&H7A", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CLANREMOVEMEMBER, Type = Double, Dynamic = False, Default = \"&H78", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_CREATEACCOUNT2, Type = Double, Dynamic = False, Default = \"&H3D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_ENTERCHAT, Type = Double, Dynamic = False, Default = \"&H0A", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FLOODDETECTED, Type = Double, Dynamic = False, Default = \"&H13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FRIENDSADD, Type = Double, Dynamic = False, Default = \"&H67", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FRIENDSLIST, Type = Double, Dynamic = False, Default = \"&H65", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FRIENDSPOSITION, Type = Double, Dynamic = False, Default = \"&H69", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FRIENDSREMOVE, Type = Double, Dynamic = False, Default = \"&H68", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_FRIENDSUPDATE, Type = Double, Dynamic = False, Default = \"&H66", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_GETCHANNELLIST, Type = Double, Dynamic = False, Default = \"&H0B", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_GETICONDATA, Type = Double, Dynamic = False, Default = \"&H2D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_JOINCHANNEL, Type = Double, Dynamic = False, Default = \"&H0C", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_LEAVECHAT, Type = Double, Dynamic = False, Default = \"&H10", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_LOGONRESPONSE2, Type = Double, Dynamic = False, Default = \"&H3A", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_MESSAGEBOX, Type = Double, Dynamic = False, Default = \"&H19", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_NOTIFYJOIN, Type = Double, Dynamic = False, Default = \"&H22", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_NULL, Type = Double, Dynamic = False, Default = \"&H00", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_PING, Type = Double, Dynamic = False, Default = \"&H25", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_READUSERDATA, Type = Double, Dynamic = False, Default = \"&H26", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_REQUIREDWORK, Type = Double, Dynamic = False, Default = \"&H4C", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_SETEMAIL, Type = Double, Dynamic = False, Default = \"&H59", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_UDPPINGRESPONSE, Type = Double, Dynamic = False, Default = \"&H14", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SID_WRITEUSERDATA, Type = Double, Dynamic = False, Default = \"&H27", Scope = Protected
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
