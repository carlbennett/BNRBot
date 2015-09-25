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
		Protected Function CreateBNLS_CHOOSENLSREVISION(Revision As UInt32) As String
		  
		  Return Packets.CreateBNLS(Packets.BNLS_CHOOSENLSREVISION, MemClass.WriteDWORD(Revision))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_CREATEACCOUNT(Username As String, Password As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteCString(Buffer, Username)
		  MemClass.WriteCString(Buffer, Password)
		  
		  Return Packets.CreateBNLS(Packets.BNLS_CREATEACCOUNT, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_LOGONCHALLENGE(Username As String, Password As String) As String
		  
		  Dim Buffer As String
		  
		  MemClass.WriteCString(Buffer, Username)
		  MemClass.WriteCString(Buffer, Password)
		  
		  Return Packets.CreateBNLS(Packets.BNLS_LOGONCHALLENGE, Buffer)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateBNLS_LOGONPROOF(RawData As String) As String
		  
		  Return Packets.CreateBNLS(Packets.BNLS_LOGONPROOF, LeftB(RawData, 64))
		  
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
		    
		  Case Packets.SID_CLANMEMBERLIST
		    ret = Packets.ParseSID_CLANMEMBERLIST(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERREMOVED
		    ret = Packets.ParseSID_CLANMEMBERREMOVED(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERSTATUSCHANGE
		    ret = Packets.ParseSID_CLANMEMBERSTATUSCHANGE(Sock, PktData)
		    
		  Case Packets.SID_CLANMEMBERANKCHANGE
		    ret = Packets.ParseSID_CLANMEMBERRANKCHANGE(Sock, PktData)
		    
		  Case Else
		    Sock.BadPacketCount = Sock.BadPacketCount + 1
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown packet!" + EndOfLine)
		    Sock.Config.AddChatHexDump(MemClass.HexPrefix(PktID, "SID_0x", 2), PktFull)
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
		  Sock.Config.AddChat(True, Colors.Yellow, "RECV TELNET " + Line + EndOfLine)
		  
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
		  " (Bytes: " + Str(4 + LenB(PktData)) + ")" + EndOfLine)
		  
		  Dim ret As Boolean = True
		  
		  Select Case PktID
		  Case Packets.BNLS_NULL
		    ret = Packets.ParseBNLS_NULL(Sock, PktData)
		    
		  Case Packets.BNLS_LOGONCHALLENGE
		    ret = Packets.ParseBNLS_LOGONCHALLENGE(Sock, PktData)
		    
		  Case Packets.BNLS_LOGONPROOF
		    ret = Packets.ParseBNLS_LOGONPROOF(Sock, PktData)
		    
		  Case Packets.BNLS_CREATEACCOUNT
		    ret = Packets.ParseBNLS_CREATEACCOUNT(Sock, PktData)
		    
		  Case Packets.BNLS_VERSIONCHECKEX2
		    ret = Packets.ParseBNLS_VERSIONCHECKEX2(Sock, PktData)
		    
		  Case Else
		    ret = False
		    
		  End Select
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Parse(Sock As CBNETSocket, PktID As Byte, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.BNET = Nil Then Return False
		  If Sock.BNET.Config = Nil Then Return False
		  
		  If Sock.BNET.Config.VerbosePackets = True Then _
		  Sock.BNET.Config.AddChat(True, Colors.Yellow, "RECV CBNET_0x" + Right("00" + Hex(PktID), 2) + _
		  " (Bytes: " + Str(4 + LenB(PktData)) + ")" + EndOfLine)
		  
		  Dim ret As Boolean = True
		  
		  Select Case PktID
		  Case Else
		    ret = False
		    
		  End Select
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseBNLS_CREATEACCOUNT(Sock As BNLSSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 64 Then Return False
		  
		  Sock.BNET.Send(Packets.CreateSID_AUTH_ACCOUNTCREATE(MidB(PktData, 1, 32), MidB(PktData, 33, 32), Sock.BNET.Username))
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseBNLS_LOGONCHALLENGE(Sock As BNLSSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 32 Then Return False
		  
		  Sock.BNET.Send(Packets.CreateSID_AUTH_ACCOUNTLOGON(PktData, Sock.BNET.Username))
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseBNLS_LOGONPROOF(Sock As BNLSSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 20 Then Return False
		  
		  Sock.BNET.Send(Packets.CreateSID_AUTH_ACCOUNTLOGONPROOF(PktData))
		  Return True
		  
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
		    Sock.BNET.Config.AddChat(True, Colors.Red, "BNLS: Version check failed." + EndOfLine)
		    Sock.BNET.DoDisconnect(False)
		    Return False
		  ElseIf Cookie <> Packets.SID_AUTH_CHECK Then
		    Sock.BNET.Config.AddChat(True, Colors.Red, "BNLS: Unknown reply for version check." + EndOfLine)
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
		Protected Function ParseSID_AUTH_ACCOUNTCREATE(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 4 Then Return False
		  
		  Dim Status As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  
		  If Sock.Config <> Nil Then
		    Select Case Status
		    Case &H00 // Successfully created account name.
		    Case &H04 // Name already exists.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account already exists." + EndOfLine)
		    Case &H07 // Name is too short/blank.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name is too short." + EndOfLine)
		    Case &H08 // Name contains an illegal character.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains invalid characters." + EndOfLine)
		    Case &H09 // Name contains an illegal word.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name uses a banned word." + EndOfLine)
		    Case &H0A // Name contains too few alphanumeric characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name doesn't have enough alphanumeric characters." + EndOfLine)
		    Case &H0B // Name contains adjacent punctuation characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains adjacent punctuations." + EndOfLine)
		    Case &H0C // Name contains too many punctuation characters.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains too many punctuations." + EndOfLine)
		    Case Else // Any other: Name already exists.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS create failure." + EndOfLine)
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
		      If Sock.BNLS.IsConnected = False Then Sock.BNLS.DoConnect()
		      Sock.BNLS.Send(Packets.CreateBNLS_LOGONPROOF(MidB(PktData, 5)))
		    Case &H01 // Account doesn't exist.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account is non-existant; ")
		      Sock.Config.AddChat(False, Colors.Yellow, "creating it..." + EndOfLine)
		    Case &H05 // Account requires upgrade.
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account requires upgrade. (NYI)" + EndOfLine)
		    Case Else // Unknown (failure).
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS logon failure." + EndOfLine)
		    End Select
		  End If
		  
		  If Status <> &H00 And Status <> &H01 Then
		    Sock.DoDisconnect(False)
		    Return False
		  ElseIf Status = &H01 Then
		    // Try to create the account...
		    If Sock.Config.BNLSEnabled = True Then
		      If Sock.BNLS <> Nil And Sock.BNLS.IsConnected = False And Sock.BNLS.IsConnecting = False Then Sock.BNLS.DoConnect()
		      Sock.BNLS.Send(Packets.CreateBNLS_CREATEACCOUNT(Sock.Config.Username, Sock.Config.Password))
		    Else
		      Sock.Config.AddChat(True, Colors.Red, "ERROR: Not yet implemented; please enable BNLS." + EndOfLine)
		    End If
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
		  
		  #pragma Unused ServerPasswordProof
		  
		  If Sock.Config <> Nil Then
		    Select Case Status
		    Case &H00, &H0E // Logon successful. (OR) An email address should be registered for this account.
		      
		      If Sock.BNLS <> Nil Then Sock.BNLS.Close()
		      
		      If Status = &H0E And LenB(Sock.Config.EmailAddress) > 0 Then
		        Sock.Send(Packets.CreateSID_SETEMAIL(Sock.Config.EmailAddress))
		        
		        If Sock.Config <> Nil Then
		          Sock.Config.AddChat(True, Colors.Cyan, "BNET: Binded ")
		          Sock.Config.AddChat(False, Colors.Teal, Sock.Config.EmailAddress)
		          Sock.Config.AddChat(False, Colors.Cyan, " to the account." + EndOfLine)
		        End If
		      End If
		      
		      Packets.SendAfterLogonSIDs(Sock)
		      
		    Case &H02 // Incorrect password.
		      
		      If Sock.Config <> Nil Then Sock.Config.AddChat(True, Colors.Red, "BNET: Your password is incorrect." + EndOfLine)
		      Sock.DoDisconnect(False)
		      Return False
		      
		    Case &H0F // Custom error. A string at the end of this message contains the error.
		      
		      Sock.Config.AddChat(True, Colors.Red, "BNET: " + MoreInfo + "." + EndOfLine)
		      
		    Case Else // Unknown (failure).
		      
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Unknown NLS logon proof failure." + EndOfLine)
		      
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
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Old game version." + EndOfLine)
		  Case &H101 // Invalid version
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Invalid game version." + EndOfLine)
		  Case &H102 // Game version must be downgraded
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Game version is too new." + EndOfLine)
		  Case Sock.VersionByte // Invalid version code
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Invalid version byte code." + EndOfLine)
		  Case &H200 // CD-Key is invalid
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is invalid." + EndOfLine)
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are probably now banned for 2 weeks." + EndOfLine)
		  Case &H201 // CD-Key is in use
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is in use." + EndOfLine) Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is in use by " + MoreInfo + "." + EndOfLine)
		  Case &H202 // CD-Key is banned
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is banned." + EndOfLine)
		  Case &H203 // CD-Key is for another game
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your CD-Key is for another game." + EndOfLine)
		  Case &H210 // Expansion-set CD-Key is invalid
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is invalid." + EndOfLine)
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are probably now banned for 2 weeks." + EndOfLine)
		  Case &H211 // Expansion-set CD-Key is in use
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is in use." + EndOfLine) Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is in use by " + MoreInfo + "." + EndOfLine)
		  Case &H212 // Expansion-set CD-Key is banned
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is banned." + EndOfLine)
		  Case &H213 // Expansion-set CD-Key is for another game
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your expansion-set CD-Key is for another game." + EndOfLine)
		  Case Else // Unknown result code
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown version/cd-key check result." + EndOfLine)
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
		    MemClass.HexPrefix(Sock.LogonType, "0x", 8) + EndOfLine)
		    Sock.DoDisconnect(False)
		    Return False
		  End If
		  
		  If Sock.Config.BNLSEnabled = True And Sock.LogonType <> 0 Then
		    If Sock.BNLS <> Nil And Sock.BNLS.IsConnected = False And Sock.BNLS.IsConnecting = False Then Sock.BNLS.DoConnect()
		    Sock.BNLS.Send(Packets.CreateBNLS_CHOOSENLSREVISION(Sock.LogonType))
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
		  
		  // A timer on the wMain delays the users list redraw a tiny bit so that it doesn't lag so much.
		  // The lag is caused by the code updating the list N*N times, therefore causing a small (<50ms) pause.
		  // Delaying it until "after everything is done" reverses this to just N*1 times.
		  // How much time to wait is determined by the lstUsersTimer's Period on wMain.
		  // A significant performance increase is seen when the Period is 100ms.
		  
		  If wMain.IsConfigSelected(Sock.Config) = False And EventID <> 9 Then
		    
		    Sock.Config.CacheChatUnread = True
		    wMain.lstUsersTimer.Reset()
		    
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
		        Sock.Config.AddChat(True, Colors.Lime, "-- ")
		        Sock.Config.AddChat(False, Colors.LightSeaGreen, Username)
		        Sock.Config.AddChat(False, Colors.Lime, " joined the channel using ")
		        Sock.Config.AddChat(False, Colors.LightSeaGreen, Globals.ProductName(MemClass.ReadDWORD(Text, 1, True), False))
		        Sock.Config.AddChat(False, Colors.Lime, "." + EndOfLine)
		      End If
		      
		    End If
		    
		    Dim OldFlags As UInt32 = dTmp.Value("FlagsOld").Int32Value
		    If Sock.Config.ShowUserUpdateMessages = True And Flags <> OldFlags Then
		      If wMain.IsConfigSelected(Sock.Config) = False And EventID = 9 Then
		        
		        Sock.Config.CacheChatUnread = True
		        wMain.lstUsersTimer.Reset()
		        
		      End If
		      If BitAnd(OldFlags, &H01) = 0 And BitAnd(Flags, &H01) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now a ")
		        Sock.Config.AddChat(False, Colors.LightSkyBlue, "Blizzard representative")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H02) = 0 And BitAnd(Flags, &H02) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now a ")
		        Sock.Config.AddChat(False, Colors.White, "channel operator")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H04) = 0 And BitAnd(Flags, &H04) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now a ")
		        Sock.Config.AddChat(False, Colors.Yellow, "channel speaker")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H08) = 0 And BitAnd(Flags, &H08) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now a ")
		        Sock.Config.AddChat(False, Colors.LightSeaGreen, "Battle.net administrator")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H10) = 0 And BitAnd(Flags, &H10) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " no longer has ")
		        Sock.Config.AddChat(False, Colors.Teal, "UDP support")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H20) = 0 And BitAnd(Flags, &H20) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now ")
		        Sock.Config.AddChat(False, Colors.Red, "squelched")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H40) = 0 And BitAnd(Flags, &H40) > 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is now a ")
		        Sock.Config.AddChat(False, Colors.Pink, "guest")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H01) > 0 And BitAnd(Flags, &H01) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer a ")
		        Sock.Config.AddChat(False, Colors.LightSkyBlue, "Blizzard representative")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H02) > 0 And BitAnd(Flags, &H02) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer a ")
		        Sock.Config.AddChat(False, Colors.White, "channel operator")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H04) > 0 And BitAnd(Flags, &H04) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer a ")
		        Sock.Config.AddChat(False, Colors.Yellow, "channel speaker")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H08) > 0 And BitAnd(Flags, &H08) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer a ")
		        Sock.Config.AddChat(False, Colors.LightSeaGreen, "Battle.net administrator")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H10) > 0 And BitAnd(Flags, &H10) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " now has ")
		        Sock.Config.AddChat(False, Colors.Teal, "UDP support")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H20) > 0 And BitAnd(Flags, &H20) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer ")
		        Sock.Config.AddChat(False, Colors.Red, "squelched")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		      If BitAnd(OldFlags, &H40) > 0 And BitAnd(Flags, &H40) = 0 Then
		        Sock.Config.AddChat(True, Colors.Cyan, "BNET: User ")
		        Sock.Config.AddChat(False, Colors.Teal, Username)
		        Sock.Config.AddChat(False, Colors.Cyan, " is no longer a ")
		        Sock.Config.AddChat(False, Colors.Pink, "guest")
		        Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		      End If
		    End If
		    
		    If wMain.IsConfigSelected(Sock.Config) = True Then wMain.lstUsersTimer.Reset()
		    
		  Case &H03
		    
		    If Sock.ChannelUsers.HasKey(Username) = True Then
		      Sock.ChannelUsers.Remove(Username)
		      
		      If Sock.Config.ShowJoinLeaveMessages = True Then
		        Sock.Config.AddChat(True, Colors.Red, "-- ")
		        Sock.Config.AddChat(False, Colors.Maroon, Username)
		        Sock.Config.AddChat(False, Colors.Red, " left the channel." + EndOfLine)
		      End If
		      
		      If wMain.IsConfigSelected(Sock.Config) = True Then wMain.lstUsersTimer.Reset()
		      
		    End If
		    
		  Case &H04
		    
		    dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    If BitAnd(Flags, &H20) <= 0 Then
		      Sock.Config.AddChat(True, Colors.Orange, "<")
		      Sock.Config.AddChat(False, Colors.Yellow, "From: " + Username)
		      Sock.Config.AddChat(False, Colors.Orange, "> ")
		      Sock.Config.AddChat(False, Colors.Gray, Text + EndOfLine)
		    End If
		    
		  Case &H05
		    
		    If Sock.Config.SpamPrevention = True Then dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    bTmp = (Sock.Config.SpamPrevention = True And dTmp <> Nil And dTmp.Value("TimeEntered").DoubleValue + 400000 > Microseconds())
		    
		    // If bTmp = True then they are talking at most 0.4 seconds after entering.
		    
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
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
		        colorA = Colors.Orange
		        colorB = Colors.Yellow
		        If BitAnd(Flags, &H04) > 0 Then colorC = Colors.Yellow Else colorC = Colors.White
		      End If
		      
		      Sock.Config.AddChat(True, colorA, "<")
		      Sock.Config.AddChat(False, colorB, Username)
		      Sock.Config.AddChat(False, colorA, "> ")
		      Sock.Config.AddChat(False, colorC, Text + EndOfLine)
		    End If
		    
		    If wMain.IsConfigSelected(Sock.Config) = True And _
		      wMain.lstUsers_View = wMain.lstUsers_View_Channel_Activity Then _
		      wMain.lstUsersTimer.Reset()
		      
		  Case &H06
		    
		    Sock.Config.AddChat(True, Colors.Cyan, "Server Broadcast")
		    If Username <> "Battle.net" And LenB(Username) > 0 Then _
		    Sock.Config.AddChat(False, Colors.Cyan, " from " + Username)
		    Sock.Config.AddChat(False, Colors.Cyan, ": ")
		    Sock.Config.AddChat(False, Colors.Silver, Text + EndOfLine)
		    
		  Case &H07
		    
		    Sock.ChannelFlags = Flags
		    Sock.ChannelName = Text
		    Sock.ChannelUsers.Clear()
		    
		    If wMain.IsConfigSelected(Sock.Config) = True Then wMain.lstUsers_View = wMain.lstUsers_View
		    
		    Sock.Config.AddChat(True, Colors.Cyan, "Joined Channel: ")
		    Sock.Config.AddChat(False, Colors.Teal, Sock.ChannelName)
		    Sock.Config.AddChat(False, Colors.Gray, " (" + Globals.SChannelFlags(Sock.ChannelFlags) + ")" + EndOfLine)
		    
		  Case &H0A
		    
		    dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    If BitAnd(Flags, &H20) <= 0 Then
		      Sock.Config.AddChat(True, Colors.Cyan, "<To: " + Username + "> ")
		      Sock.Config.AddChat(False, Colors.Gray, Text + EndOfLine)
		    End If
		    
		  Case &H0D // full
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: The channel ")
		    Sock.Config.AddChat(False, Colors.Maroon, Text)
		    Sock.Config.AddChat(False, Colors.Red, " is full." + EndOfLine)
		    
		  Case &H0E // empty
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: The channel ")
		    Sock.Config.AddChat(False, Colors.Maroon, Text)
		    Sock.Config.AddChat(False, Colors.Red, " is empty")
		    Sock.Config.AddChat(False, Colors.Yellow, "; forcing join..." + EndOfLine)
		    Sock.Send(Packets.CreateSID_JOINCHANNEL(&H2, Text))
		    
		  Case &H0F // restricted
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: The channel ")
		    Sock.Config.AddChat(False, Colors.Maroon, Text)
		    Sock.Config.AddChat(False, Colors.Red, " is restricted." + EndOfLine)
		    
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
		        Sock.Config.AddChat(True, Colors.Yellow, Line + EndOfLine)
		      Next
		    End If
		    
		    If Sock.Config.AutoRejoinWhenKicked = True And LenB(Sock.ChannelName) > 0 And _
		      Right(Text, Len("kicked you out of the channel!")) = "kicked you out of the channel!" Then _
		      Sock.Send(Packets.CreateSID_JOINCHANNEL(&H2, Sock.ChannelName))
		      
		  Case &H13
		    
		    For Each Line As String In Split(ReplaceLineEndings(Text, EndOfLine), EndOfLine)
		      Sock.Config.AddChat(True, Colors.Red, Line + EndOfLine)
		    Next
		    
		  Case &H17
		    
		    If Sock.Config.SpamPrevention = True Then dTmp = Sock.ChannelUsers.Lookup(Username, Nil)
		    bTmp = (Sock.Config.SpamPrevention = True And dTmp <> Nil And dTmp.Value("TimeEntered").DoubleValue + 400000 > Microseconds())
		    
		    // If bTmp = True then they are talking at most 0.4 seconds after entering.
		    
		    If dTmp <> Nil Then
		      dTmp.Value("LastMessageTime") = Microseconds()
		      dTmp.Value("LastMessageType") = EventID
		      dTmp.Value("LastMessage") = Text
		    End If
		    
		    If BitAnd(Flags, &H20) <= 0 And bTmp = False Then
		      If BitAnd(Flags, &H09) > 0 Then
		        colorA = Colors.Teal
		        colorB = Colors.Cyan
		        colorC = Colors.Cyan
		      ElseIf BitAnd(Flags, &H02) > 0 Then
		        colorA = Colors.Silver
		        colorB = Colors.White
		        colorC = Colors.White
		      ElseIf Username = Sock.UniqueName Then
		        colorA = Colors.Teal
		        colorB = Colors.Cyan
		        colorC = Colors.Yellow
		      Else
		        colorA = Colors.Orange
		        colorB = Colors.Yellow
		        colorC = Colors.Yellow
		      End If
		      
		      Sock.Config.AddChat(True, colorA, "<")
		      Sock.Config.AddChat(False, colorB, Username)
		      Sock.Config.AddChat(False, colorA, " ")
		      Sock.Config.AddChat(False, colorC, Text)
		      Sock.Config.AddChat(False, colorA, ">" + EndOfLine)
		    End If
		    
		    If wMain.IsConfigSelected(Sock.Config) = True And _
		      wMain.lstUsers_View = wMain.lstUsers_View_Channel_Activity Then _
		      wMain.lstUsersTimer.Reset()
		      
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown chat event." + EndOfLine)
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
		  
		  Dim w As New wClanCreationInvitation()
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
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: The clan was successfully disbanded." + EndOfLine)
		    
		  Case &H04 // Cannot quit clan, not one week old yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: The clan is too new for it to be disbanded." + EndOfLine)
		    
		  Case &H05 // Not authorized to disband the clan
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to disband the clan." + EndOfLine)
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to disband clan (")
		    Sock.Config.AddChat(False, Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2))
		    Sock.Config.AddChat(False, Colors.Red, ")." + EndOfLine)
		    
		  End Select
		  
		  If Result = &H00 Then
		    Sock.ClanMembers.Clear()
		    Sock.ClanRank = 0
		    Sock.ClanTag = 0
		    If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		    wMain.lstUsers_View = wMain.lstUsers_View
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
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: You are a ")
		    Sock.Config.AddChat(False, Colors.Teal, Globals.ClanRankName(Sock.ClanRank))
		    Sock.Config.AddChat(False, Colors.Cyan, " in ")
		    Sock.Config.AddChat(False, Colors.Teal, "Clan " + Globals.SClanTag(Sock.ClanTag))
		    Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		  End If
		  
		  Sock.Send(Packets.CreateSID_CLANMEMBERLIST(0))
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANINVITATION(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Data As String
		  Data = Globals.ClanCookies.Lookup(Cookie, "")
		  
		  If LenB(Data) < 1 Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan invitation reply." + EndOfLine)
		    Return True
		  End If
		  
		  Dim Username As String = MemClass.ReadCString(Data, 1)
		  
		  Select Case Result
		  Case &H00 // Invitation accepted
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Clan invitation to ")
		    Sock.Config.AddChat(False, Colors.Green, Username)
		    Sock.Config.AddChat(False, Colors.Lime, " accepted." + EndOfLine)
		    
		  Case &H04 // Invitation declined
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " rejected." + EndOfLine)
		    
		  Case &H05 // Failed to invite user
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " failed." + EndOfLine)
		    
		  Case &H09 // Clan is full
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " failed because the clan is full." + EndOfLine)
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan invitation to ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " failed (")
		    Sock.Config.AddChat(False, Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2))
		    Sock.Config.AddChat(False, Colors.Red, ")." + EndOfLine)
		    
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
		  
		  Dim w As New wClanInvitation()
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
		Protected Function ParseSID_CLANMEMBERLIST(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 5 Then Return False
		  
		  Dim Buffer As New MemClass(PktData, True)
		  Dim Cookie As UInt32 = Buffer.ReadDWORD()
		  Dim Count As Byte = Buffer.ReadBYTE()
		  
		  If Cookie <> 0 And Cookie <> 1 Then Return False
		  
		  If Sock.Config <> Nil And Cookie = 0 Then
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: There are ")
		    Sock.Config.AddChat(False, Colors.Teal, Str(Count) + " member")
		    If Count <> 1 Then Sock.Config.AddChat(False, Colors.Teal, "s")
		    Sock.Config.AddChat(False, Colors.Cyan, " in your clan." + EndOfLine)
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
		    
		    If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		    wMain.lstUsers_View = wMain.lstUsers_View
		    
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
		    If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		    wMain.lstUsers_View = wMain.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ")
		    Sock.Config.AddChat(False, Colors.Teal, Username)
		    Sock.Config.AddChat(False, Colors.Cyan, " has been ")
		    If NewRank > OldRank Then Sock.Config.AddChat(False, Colors.Cyan, "promoted") _
		  Else Sock.Config.AddChat(False, Colors.Cyan, "demoted")
		    Sock.Config.AddChat(False, Colors.Cyan, " from ")
		    Sock.Config.AddChat(False, Colors.Teal, Globals.ClanRankName(OldRank))
		    Sock.Config.AddChat(False, Colors.Cyan, " to ")
		    Sock.Config.AddChat(False, Colors.Teal, Globals.ClanRankName(NewRank))
		    Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
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
		    If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		    wMain.lstUsers_View = wMain.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ")
		    Sock.Config.AddChat(False, Colors.Teal, Username)
		    Sock.Config.AddChat(False, Colors.Cyan, " was removed from the clan." + EndOfLine)
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
		      If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		      wMain.lstUsers_View = wMain.lstUsers_View
		      Sock.Config.AddChat(True, Colors.Cyan, "BNET: Clan member ")
		      Sock.Config.AddChat(False, Colors.Teal, Username)
		      Sock.Config.AddChat(False, Colors.Cyan, " has been ")
		      If Rank > User.Value("OldRank") Then Sock.Config.AddChat(False, Colors.Cyan, "promoted") _
		    Else Sock.Config.AddChat(False, Colors.Cyan, "demoted")
		      Sock.Config.AddChat(False, Colors.Cyan, " from ")
		      Sock.Config.AddChat(False, Colors.Teal, Globals.ClanRankName(User.Value("OldRank")))
		      Sock.Config.AddChat(False, Colors.Cyan, " to ")
		      Sock.Config.AddChat(False, Colors.Teal, Globals.ClanRankName(Rank))
		      Sock.Config.AddChat(False, Colors.Cyan, "." + EndOfLine)
		    End If
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
		      If wMain.IsConfigSelected(Sock.Config) = True And wMain.lstUsers_Viewing_Clan() = True Then _
		      wMain.lstUsers_View = wMain.lstUsers_View
		      Sock.Config.AddChat(True, Colors.Cyan, "BNET: You are no longer in a clan." + EndOfLine)
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
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Data As String
		  Data = Globals.ClanCookies.Lookup(Cookie, "")
		  
		  If LenB(Data) < 1 Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan rank change reply." + EndOfLine)
		    Return True
		  End If
		  
		  Dim Username As String = MemClass.ReadCString(Data, 1)
		  
		  Select Case Result
		  Case &H00 // Successfully changed rank
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Successfully changed the rank of ")
		    Sock.Config.AddChat(False, Colors.Green, Username)
		    Sock.Config.AddChat(False, Colors.Lime, "." + EndOfLine)
		    
		  Case &H01 // Failed to change rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to change the rank of ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, "." + EndOfLine)
		    
		  Case &H02 // Cannot change user's rank yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Cannot change the rank of ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " yet." + EndOfLine)
		    
		  Case &H07 // Not authorized to change user rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to change the rank of ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, "." + EndOfLine)
		    
		  Case &H08 // Not allowed to change user rank
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not allowed to change the rank of ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, "." + EndOfLine)
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan rank change for ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " failed (")
		    Sock.Config.AddChat(False, Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2))
		    Sock.Config.AddChat(False, Colors.Red, ")." + EndOfLine)
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_CLANREMOVEMEMBER(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) <> 5 Then Return False
		  
		  Dim Cookie As UInt32 = MemClass.ReadDWORD(PktData, 1, True)
		  Dim Result As Byte = MemClass.ReadBYTE(PktData, 5)
		  
		  Dim Data As String
		  Data = Globals.ClanCookies.Lookup(Cookie, "")
		  
		  If LenB(Data) < 1 Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown clan member removal reply." + EndOfLine)
		    Return True
		  End If
		  
		  Dim Username As String = Data
		  
		  Select Case Result
		  Case &H00 // Removed
		    Sock.Config.AddChat(True, Colors.Lime, "BNET: Successfully removed ")
		    Sock.Config.AddChat(False, Colors.Green, Username)
		    Sock.Config.AddChat(False, Colors.Lime, " from the clan." + EndOfLine)
		    
		  Case &H01 // Removal failed
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to remove ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " from the clan." + EndOfLine)
		    
		  Case &H02 // Cannot be removed yet
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Cannot remove ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " from the clan yet." + EndOfLine)
		    
		  Case &H07 // Not authorized to remove
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not authorized to remove ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " from the clan." + EndOfLine)
		    
		  Case &H08 // Not allowed to remove
		    Sock.Config.AddChat(True, Colors.Red, "BNET: You are not allowed to remove ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " from the clan." + EndOfLine)
		    
		  Case Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Clan member removal for ")
		    Sock.Config.AddChat(False, Colors.Maroon, Username)
		    Sock.Config.AddChat(False, Colors.Red, " failed (")
		    Sock.Config.AddChat(False, Colors.Maroon, MemClass.HexPrefix(Result, "0x", 2))
		    Sock.Config.AddChat(False, Colors.Red, ")." + EndOfLine)
		    
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
		      Sock.Config.AddChat(True, Colors.Lime, "BNET: Account created successfully." + EndOfLine)
		    Case &H01
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name is too short." + EndOfLine)
		    Case &H02
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains invalid characters." + EndOfLine)
		    Case &H03
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name uses a banned word." + EndOfLine)
		    Case &H04
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account already exists." + EndOfLine)
		    Case &H05
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account is still being created." + EndOfLine)
		    Case &H06
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name doesn't have enough alphanumeric characters." + EndOfLine)
		    Case &H07
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains adjacent punctuations." + EndOfLine)
		    Case &H08
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Your account name contains too many punctuations." + EndOfLine)
		    Case Else
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown logon result." + EndOfLine)
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
		    If wMain.IsConfigSelected(Sock.Config) = True Then wMain.lstUsers_View = wMain.lstUsers_View
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Logged on as ")
		    Sock.Config.AddChat(False, Colors.Teal, Sock.UniqueName)
		    Sock.Config.AddChat(False, Colors.Cyan, "!" + EndOfLine)
		  End If
		  
		  Sock.Send(Packets.CreateSID_GETCHANNELLIST(Sock.Product))
		  Sock.Send(Packets.CreateSID_FRIENDSLIST())
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_FLOODDETECTED(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If Sock.Config = Nil Then Return False
		  If LenB(PktData) <> 0 Then Return False
		  
		  Sock.Config.AddChat(True, Colors.Red, "BNET: You have been disconnected for flooding." + EndOfLine)
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
		  
		  If wMain.IsConfigSelected(Sock.Config) = True Then _
		  wMain.lstUsers_View = wMain.lstUsers_View
		  
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
		  
		  If wMain.IsConfigSelected(Sock.Config) = True Then _
		  wMain.lstUsers_View = wMain.lstUsers_View
		  
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
		  
		  If wMain.IsConfigSelected(Sock.Config) = True Then _
		  wMain.lstUsers_View = wMain.lstUsers_View
		  
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
		  
		  If wMain.IsConfigSelected(Sock.Config) = True Then _
		  wMain.lstUsers_View = wMain.lstUsers_View
		  
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
		  
		  #If DebugBuild = True Then
		    If BitAnd(Status, &H01) > 0 Then
		      Select Case Location
		      Case &H00 // User went offline; Battle.net will send a whisper so no message needs to be displayed.
		      Case &H01 // Sent SID_LEAVECHAT to Battle.net.
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Your friend " + dTmp.Value("Username") + " left chat."_
		        + EndOfLine)
		      Case &H02 // Entered chat.
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Your friend " + dTmp.Value("Username") + " entered the channel " + LocationName + "."_
		        + EndOfLine)
		      Case &H03 // Joined a public game.
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Your friend " + dTmp.Value("Username") + " entered the game " + LocationName + "."_
		        + EndOfLine)
		      Case &H04 // Joined a private game, not on friends list.
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Your friend " + dTmp.Value("Username") + " entered a private game."_
		        + EndOfLine)
		      Case &H05 // Joined a private game, on friends list.
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Your friend " + dTmp.Value("Username") + " entered the private game " + LocationName + "."_
		        + EndOfLine)
		      Case Else // ???
		        Sock.Config.AddChat(True, Colors.Gray, _
		        "BNET: Received unknown friend location in an update! " + MemClass.HexPrefix(Location, "0x", 2) _
		        + EndOfLine)
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
		  If Sock.Config <> Nil And wMain.IsConfigSelected(Sock.Config) = True And _
		    wMain.lstUsers_Viewing_ChannelList() = True Then wMain.lstUsers_View = wMain.lstUsers_View
		    
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
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Account is non-existant; ")
		      Sock.Config.AddChat(False, Colors.Yellow, "creating it..." + EndOfLine)
		    End If
		    
		    // Try to create the account...
		    Sock.Send(Packets.CreateSID_CREATEACCOUNT2(Globals.EncryptOLSPW(Sock.Password), Sock.Username))
		    Return True
		    
		  Case &H02 // Invalid password
		    
		    If Sock.Config <> Nil Then Sock.Config.AddChat(True, Colors.Red, "BNET: Your password is incorrect." + EndOfLine)
		    Sock.DoDisconnect(False)
		    Return False
		    
		  Case &H06 // Account closed
		    
		    If LenB(MoreInfo) < 1 Then _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Your account has been closed." + EndOfLine) Else _
		    Sock.Config.AddChat(True, Colors.Red, "BNET: " + MoreInfo + EndOfLine)
		    Sock.DoDisconnect(False)
		    Return False
		    
		  Case Else // Unknown result code
		    
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Protocol error - unknown logon result." + EndOfLine)
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
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Message from Battle.net: " + Caption + EndOfLine)
		  Else
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Message from Battle.net:" + EndOfLine)
		  End If
		  
		  Dim Lines() As String = Split(ReplaceLineEndings(Text, Chr(13)), Chr(13))
		  For Each Line As String In Lines
		    Sock.Config.AddChat(True, Colors.Red, "BNET: " + Line + EndOfLine)
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
		  Dim Cookie As UInt32 = Buffer.ReadDWORD()
		  
		  Dim Game As String
		  Dim Account, Keys(), Values(), CookieData As String
		  
		  CookieData = Globals.ProfileCookies.Lookup(Cookie, "")
		  If LenB(CookieData) < 1 Then
		    Sock.Config.AddChat(True, Colors.Red, "BNET: Received unknown user data response." + EndOfLine)
		    Return True
		  Else
		    Globals.ProfileCookies.Remove(Cookie)
		  End If
		  
		  Game = MemClass.WriteDWORD(MemClass.ReadDWORD(CookieData, 1, True), False)
		  Account = MemClass.ReadCString(CookieData, 5)
		  
		  // Profile
		  Keys.Append("profile\age")
		  Keys.Append("profile\sex")
		  Keys.Append("profile\location")
		  Keys.Append("profile\description")
		  
		  // Normal Games
		  Keys.Append("record\" + Game + "\0\wins")
		  Keys.Append("record\" + Game + "\0\losses")
		  Keys.Append("record\" + Game + "\0\disconnects")
		  Keys.Append("record\" + Game + "\0\last game result")
		  Keys.Append("record\" + Game + "\0\last game")
		  
		  // Ladder Games
		  Keys.Append("record\" + Game + "\1\wins")
		  Keys.Append("record\" + Game + "\1\losses")
		  Keys.Append("record\" + Game + "\1\disconnects")
		  Keys.Append("record\" + Game + "\1\last game result")
		  Keys.Append("record\" + Game + "\1\last game")
		  Keys.Append("record\" + Game + "\1\rating")
		  Keys.Append("record\" + Game + "\1\high rating")
		  Keys.Append("DynKey\" + Game + "\1\rank")
		  Keys.Append("record\" + Game + "\1\high rank")
		  
		  While UBound(Values) + 1 < AccountCount * KeyCount
		    Values.Append(Buffer.ReadCString())
		  Wend
		  
		  Globals.AddProfileDialog(Sock.Config, Account, Keys, Values, Game)
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseSID_REQUIREDWORK(Sock As BNETSocket, PktData As String) As Boolean
		  
		  If Sock = Nil Then Return False
		  If Sock.IsConnected = False Then Return False
		  If LenB(PktData) < 1 Then Return False
		  
		  Sock.RequiredWorkMPQ = MemClass.ReadCString(PktData, 1)
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
		    Sock.Config.AddChat(True, Colors.Cyan, "BNET: Binded ")
		    Sock.Config.AddChat(False, Colors.Teal, Sock.Config.EmailAddress)
		    Sock.Config.AddChat(False, Colors.Cyan, " to the account." + EndOfLine)
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Receive(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  Sock.DataBuffer = Sock.DataBuffer + Sock.ReadAll()
		  
		  If Sock.Product = Packets.BNETProduct_CHAT Then
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
		Protected Sub Receive(Sock As CBNETSocket)
		  
		  If Sock = Nil Then Return
		  Sock.DataBuffer = Sock.DataBuffer + Sock.ReadAll()
		  
		  Dim PktID As Byte
		  Dim PktLen As UInt16
		  Dim PktData As String
		  
		  While LenB(Sock.DataBuffer) >= 3
		    
		    PktID = AscB(MidB(Sock.DataBuffer, 1, 1))
		    PktLen = MemClass.ReadWORD(Sock.DataBuffer, 2, True)
		    
		    If LenB(Sock.DataBuffer) < PktLen Then Exit While
		    
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
		Protected Sub ReceiveSID(Sock As BNETSocket)
		  
		  If Sock = Nil Then Return
		  
		  Dim PktID As Byte
		  Dim PktLen As UInt16
		  Dim PktData As String
		  Dim PktFull As String
		  
		  While LenB(Sock.DataBuffer) >= 4
		    
		    If AscB(MidB(Sock.DataBuffer, 1, 1)) <> &HFF Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Packet parse error -- invalid header checksum." + EndOfLine)
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
		  
		  If Sock.Product = Packets.BNETProduct_CHAT Then
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
		    
		    // TODO: Implement local NLS.
		    If Sock.BNLS.IsConnected = False Then Sock.BNLS.DoConnect()
		    
		    If Sock.Config.CreateAccountsFirst = False Or SkipAccountCreate = True Then
		      Sock.BNLS.Send(Packets.CreateBNLS_LOGONCHALLENGE(Sock.Username, Sock.Password))
		      Sock.LogonTimeoutTimer.Enabled = True
		    Else
		      Sock.BNLS.Send(Packets.CreateBNLS_CREATEACCOUNT(Sock.Username, Sock.Password))
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
		    If InStr(Settings.FileCheckResults, "CheckRevision") > 0 Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Error - it appears CheckRevision.dll is missing." + EndOfLine)
		      Sock.DoDisconnect()
		      Return False
		    End If
		    
		    CRevResult = Globals.CheckRevision(Sock.Product, Sock.ValueString, _
		    EXEVersion, EXEChecksum, EXEInfo, Sock.MPQFilename)
		    
		    If CRevResult = &H0 Then
		      // Invalid check revision
		      Sock.Config.AddChat(True, Colors.Red, "BNET: CheckRevision() failed." + EndOfLine)
		      Sock.DoDisconnect(False)
		      Return False
		    End If
		    
		    Sock.EXEChecksum = EXEChecksum
		    Sock.EXEInfo = EXEInfo
		    Sock.EXEVersion = EXEVersion
		  End If
		  
		  Dim CDKeys(), TempKey As String
		  
		  // CD-Key decrypting begins here.
		  // Exclude any products that don't use CD-Keys now.
		  If Sock.Product <> Packets.BNETProduct_W3DM And _  // Warcraft III Demo
		    Sock.Product <> Packets.BNETProduct_CHAT And _ // Telnet
		    Sock.Product <> Packets.BNETProduct_DRTL And _ // Diablo I
		    Sock.Product <> Packets.BNETProduct_DSHR And _ // Diablo I Shareware
		    Sock.Product <> Packets.BNETProduct_SSHR Then  // Starcraft Shareware
		    
		    If InStr(Settings.FileCheckResults, "BNCSutil") > 0 Then
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Error - it appears BNCSutil.dll is missing." + EndOfLine)
		      Sock.DoDisconnect()
		      Return False
		    End If
		    
		    // Decrypt original CD-Key
		    //
		    TempKey = Globals.DecryptCDKey(Sock.Config.CDKey, Sock.ClientToken, Sock.ServerToken)
		    If LenB(TempKey) < 1 Then
		      // Invalid CD-Key
		      Sock.Config.AddChat(True, Colors.Red, "BNET: Failed to validate your CD-Key." + EndOfLine)
		      Sock.DoDisconnect(False)
		      Return False
		    End If
		    CDKeys.Append(TempKey)
		    
		    // Decrypt expansion CD-Key, if necessary
		    //
		    If Sock.Product = Packets.BNETProduct_W3XP Or Sock.Product = Packets.BNETProduct_D2XP Then
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

	#tag Constant, Name = BNLS_CHOOSENLSREVISION, Type = Double, Dynamic = False, Default = \"&H0D", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_CREATEACCOUNT, Type = Double, Dynamic = False, Default = \"&H04", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_IPBAN, Type = Double, Dynamic = False, Default = \"&HFF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_LOGONCHALLENGE, Type = Double, Dynamic = False, Default = \"&H02", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BNLS_LOGONPROOF, Type = Double, Dynamic = False, Default = \"&H03", Scope = Protected
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
