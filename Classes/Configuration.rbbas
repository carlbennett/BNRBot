#tag Class
Protected Class Configuration
	#tag Method, Flags = &h0
		Sub AddChat(Timestamp As Boolean, ChatColor As Color, ChatText As String)
		  
		  If Me.RTFData = Nil Then Me.RTFData = New StyledText()
		  Dim SR As StyleRun
		  Dim SRFont As String = "Arial"
		  Dim SRSize As Integer = 12
		  
		  If Me.RTFField <> Nil Then
		    Me.RTFField.SelStart = Len(Me.RTFField.Text)
		    SRFont = Me.RTFField.TextFont
		    SRSize = Me.RTFField.TextSize
		  End If
		  
		  If CountFields(ReplaceLineEndings(Me.RTFData.Text(), EndOfLine), EndOfLine) > 100 Then
		    Me.RTFData.RTFData = ""
		    If Me.RTFField <> Nil Then Me.RTFField.Text = ""
		  End If
		  
		  If Timestamp = True Then Me.AddChatTimestamp()
		  
		  SR = New StyleRun()
		  SR.Font = SRFont
		  SR.Size = SRSize
		  SR.TextColor = ChatColor
		  SR.Text = ChatText
		  Me.RTFData.AppendStyleRun(SR)
		  
		  If Me.RTFField <> Nil Then
		    Me.RTFField.SelStart = Len(Me.RTFField.Text)
		    Me.RTFField.SelTextFont = SRFont
		    Me.RTFField.SelTextSize = SRSize
		    Me.RTFField.SelTextColor = ChatColor
		    Me.RTFField.SelText = ChatText
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddChat(ChatColor As Color, ChatText As String)
		  
		  Me.AddChat(False, ChatColor, ChatText)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddChatHexDump(Prefix As String, RawData As String, Width As Byte = 0)
		  
		  Dim rtfColors() As Color
		  Me.AddChatHexDump(Prefix, RawData, Width, rtfColors)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddChatHexDump(Prefix As String, RawData As String, Width As Byte = 0, rtfColors() As Color)
		  
		  If UBound(rtfColors) < 0 Then rtfColors.Insert(0, Colors.Yellow)
		  If UBound(rtfColors) < 1 Then rtfColors.Insert(1, Colors.Gray)
		  If Width < 1 Then Width = 16
		  
		  Dim i, j As Integer = 1
		  Dim Line, sTmp1, sTmp2 As String = ""
		  Dim SR As StyleRun
		  Dim SRFont As String = "Courier New"
		  Dim SRSize As Integer = 12
		  
		  While i <= LenB(RawData)
		    Line = MidB(RawData, i, Width)
		    
		    sTmp1 = ""
		    sTmp2 = ""
		    j = 1
		    While j <= LenB(Line)
		      If Len(sTmp1) > 0 Then sTmp1 = sTmp1 + " "
		      sTmp1 = sTmp1 + Right("00" + Hex(AscB(MidB(Line, j, 1))), 2)
		      If AscB(MidB(Line, j, 1)) >= 32 And AscB(MidB(Line, j, 1)) <= 126 Then _
		      sTmp2 = sTmp2 + MidB(Line, j, 1) Else sTmp2 = sTmp2 + "."
		      j = j + 1
		    Wend
		    While Len(sTmp1) < (Width * 3) - 1
		      sTmp1 = sTmp1 + " "
		    Wend
		    
		    If Len(Prefix) > 0 Then
		      SR = New StyleRun()
		      SR.Font = SRFont
		      SR.Size = SRSize
		      SR.TextColor = rtfColors(0)
		      SR.Text = "[" + Prefix + "] "
		      Me.RTFData.AppendStyleRun(SR)
		      If Me.RTFField <> Nil Then
		        Me.RTFField.SelTextFont = SR.Font
		        Me.RTFField.SelTextSize = SR.Size
		        Me.RTFField.SelTextColor = SR.TextColor
		        Me.RTFField.SelText = SR.Text
		      End If
		    End If
		    
		    SR = New StyleRun()
		    SR.Font = SRFont
		    SR.Size = SRSize
		    SR.TextColor = rtfColors(1)
		    SR.Text = MemClass.HexPrefix(i - 1, "", Len(Hex(LenB(RawData))) _
		    + (Len(Hex(LenB(RawData))) Mod 2)) + ": " + sTmp1 + " " + sTmp2 + EndOfLine
		    Me.RTFData.AppendStyleRun(SR)
		    If Me.RTFField <> Nil Then
		      Me.RTFField.SelTextFont = SR.Font
		      Me.RTFField.SelTextSize = SR.Size
		      Me.RTFField.SelTextColor = SR.TextColor
		      Me.RTFField.SelText = SR.Text
		    End If
		    
		    i = i + Width
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddChatTimestamp()
		  
		  // First, check to see if we should run in the first place:
		  //   Are we set to off, or are we set to military time without a short/long time?
		  If Me.Timestamp = Me.TimestampOff Or Me.Timestamp = Me.TimestampMilitaryTime Then Return
		  
		  If Me.RTFData = Nil Then Me.RTFData = New StyledText()
		  Dim objTimestamp As New Date(), intTimestamps As Integer = 0
		  Dim SR As StyleRun
		  Dim SRFont As String = "Arial"
		  Dim SRSize As Integer = 12
		  
		  If Me.RTFField <> Nil Then
		    Me.RTFField.SelStart = Len(Me.RTFField.Text)
		    SRFont = Me.RTFField.TextFont
		    SRSize = Me.RTFField.TextSize
		  End If
		  
		  If Me.Timestamp <> Me.TimestampOff And Me.Timestamp <> Me.TimestampMilitaryTime Then
		    SR = New StyleRun()
		    SR.Font = SRFont
		    SR.Size = SRSize
		    SR.TextColor = Colors.White
		    SR.Text = "["
		    Me.RTFData.AppendStyleRun(SR)
		    If Me.RTFField <> Nil Then
		      Me.RTFField.SelTextFont = SR.Font
		      Me.RTFField.SelTextSize = SR.Size
		      Me.RTFField.SelTextColor = SR.TextColor
		      Me.RTFField.SelText = SR.Text
		    End If
		    SR = New StyleRun()
		    SR.Font = SRFont
		    SR.Size = SRSize
		    SR.TextColor = Colors.Gray
		  End If
		  
		  If BitAnd(Me.Timestamp, Me.TimestampShortDate) > 0 Then
		    intTimestamps = intTimestamps + 1
		    SR.Text = SR.Text + objTimestamp.ShortDate
		    If intTimestamps > 1 Then SR.Text = " " + SR.Text
		  End If
		  
		  If BitAnd(Me.Timestamp, Me.TimestampAbbreviatedDate) > 0 Then
		    intTimestamps = intTimestamps + 1
		    SR.Text = SR.Text + objTimestamp.AbbreviatedDate
		    If intTimestamps > 1 Then SR.Text = " " + SR.Text
		  End If
		  
		  If BitAnd(Me.Timestamp, Me.TimestampLongDate) > 0 Then
		    intTimestamps = intTimestamps + 1
		    SR.Text = SR.Text + objTimestamp.LongDate
		    If intTimestamps > 1 Then SR.Text = " " + SR.Text
		  End If
		  
		  If BitAnd(Me.Timestamp, Me.TimestampShortTime) > 0 Then
		    intTimestamps = intTimestamps + 1
		    If BitAnd(Me.Timestamp, Me.TimestampMilitaryTime) <= 0 Then
		      SR.Text = SR.Text + objTimestamp.ShortTime
		    Else
		      SR.Text = SR.Text + Right("00" + Str(objTimestamp.Hour), 2) + ":" + _
		      Right("00" + Str(objTimestamp.Minute), 2)
		    End If
		    If intTimestamps > 1 Then SR.Text = " " + SR.Text
		  End If
		  
		  If BitAnd(Me.Timestamp, Me.TimestampLongTime) > 0 Then
		    intTimestamps = intTimestamps + 1
		    If BitAnd(Me.Timestamp, Me.TimestampMilitaryTime) <= 0 Then
		      SR.Text = SR.Text + objTimestamp.LongTime
		    Else
		      SR.Text = SR.Text + Right("00" + Str(objTimestamp.Hour), 2) + ":" + _
		      Right("00" + Str(objTimestamp.Minute), 2) + ":" + _
		      Right("00" + Str(objTimestamp.Second), 2)
		    End If
		    If intTimestamps > 1 Then SR.Text = " " + SR.Text
		  End If
		  
		  If Me.Timestamp <> Me.TimestampOff And Me.Timestamp <> Me.TimestampMilitaryTime Then
		    If LenB(SR.Text) > 0 Then
		      If LeftB(SR.Text, 1) = ChrB(32) Then SR.Text = MidB(SR.Text, 2) // Skip first space.
		      Me.RTFData.AppendStyleRun(SR)
		      If Me.RTFField <> Nil Then
		        Me.RTFField.SelTextFont = SR.Font
		        Me.RTFField.SelTextSize = SR.Size
		        Me.RTFField.SelTextColor = SR.TextColor
		        Me.RTFField.SelText = SR.Text
		      End If
		    End If
		    SR = New StyleRun()
		    SR.Font = SRFont
		    SR.Size = SRSize
		    SR.TextColor = Colors.White
		    SR.Text = "] "
		    Me.RTFData.AppendStyleRun(SR)
		    If Me.RTFField <> Nil Then
		      Me.RTFField.SelTextFont = SR.Font
		      Me.RTFField.SelTextSize = SR.Size
		      Me.RTFField.SelTextColor = SR.TextColor
		      Me.RTFField.SelText = SR.Text
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearChat(Silently As Boolean)
		  
		  If Me.RTFData = Nil Then Me.RTFData = New StyledText()
		  Me.RTFData.Text = "" // Clears EVERYTHING including StyleRuns.
		  
		  If Silently = True Then Return
		  
		  Me.AddChat(True, Colors.SkyBlue, "Chat screen cleared." + EndOfLine)
		  
		  If Me.RTFField <> Nil Then Me.RTFField.StyledText = Me.RTFData
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.BNET = New BNETSocket()
		  Me.BNET.Config = Me
		  Me.RTFData = New StyledText()
		  
		  Me.CacheChatUnread = False
		  
		  Me.CachelstUsers_View_Channel     = wMain.lstUsers_View_Channel_Flags
		  Me.CachelstUsers_View_Friends     = wMain.lstUsers_View_Friends_Entry
		  Me.CachelstUsers_View_Clan        = wMain.lstUsers_View_Clan_Rank
		  Me.CachelstUsers_View_ChannelList = wMain.lstUsers_View_ChannelList_Entry
		  Me.CachelstUsers_View             = Me.CachelstUsers_View_Channel
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AutoRejoinWhenKicked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BNET As BNETSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		BNETHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BNLSEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BNLSHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BNLSVersionCheck As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CacheChatUnread As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CacheInputMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_LastView As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_View As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_View_Channel As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_View_ChannelList As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_View_Clan As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CachelstUsers_View_Friends As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CDKey As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CDKeyExpansion As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CDKeyOwner As String
	#tag EndProperty

	#tag Property, Flags = &h0
		CDKeySpawn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ConfirmRemovingClanMembers As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CreateAccountsFirst As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EmailAddress As String
	#tag EndProperty

	#tag Property, Flags = &h0
		EnableUDP As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EnableUTF8 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		HomeChannel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreBanKickUnban As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PingSpoof As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Product As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ProxyHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProxyType As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		ReconnectInterval As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		RTFData As StyledText
	#tag EndProperty

	#tag Property, Flags = &h0
		RTFField As TextArea
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowJoinLeaveMessages As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowUserUpdateMessages As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SpamPrevention As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Timestamp As Byte
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String
	#tag EndProperty

	#tag Property, Flags = &h0
		VerbosePackets As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionByte As UInt32
	#tag EndProperty


	#tag Constant, Name = PingSpoofNegative, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PingSpoofOff, Type = Double, Dynamic = False, Default = \"-2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PingSpoofZero, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxyHTTP, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxyOff, Type = Double, Dynamic = False, Default = \"&H00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxySOCKS4, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxySOCKS5, Type = Double, Dynamic = False, Default = \"&H03", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampAbbreviatedDate, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampLongDate, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampLongTime, Type = Double, Dynamic = False, Default = \"&H10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampMilitaryTime, Type = Double, Dynamic = False, Default = \"&H20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampOff, Type = Double, Dynamic = False, Default = \"&H00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampShortDate, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampShortTime, Type = Double, Dynamic = False, Default = \"&H08", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoRejoinWhenKicked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BNETHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BNLSEnabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BNLSHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BNLSVersionCheck"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CacheChatUnread"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CacheInputMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_LastView"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_View"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_View_Channel"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_View_ChannelList"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_View_Clan"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CachelstUsers_View_Friends"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CDKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CDKeyExpansion"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CDKeyOwner"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CDKeySpawn"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConfirmRemovingClanMembers"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CreateAccountsFirst"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EmailAddress"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableUDP"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableUTF8"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HomeChannel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoreBanKickUnban"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PingSpoof"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProxyHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowJoinLeaveMessages"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowUserUpdateMessages"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SpamPrevention"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VerbosePackets"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
