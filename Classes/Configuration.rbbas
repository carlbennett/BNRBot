#tag Class
Protected Class Configuration
	#tag Method, Flags = &h0
		Sub AddChat(timestamp As Boolean, ParamArray values As Variant)
		  
		  Dim js As String = "", c As Color = Colors.UI.ControlTextColor
		  
		  js = js + "var scrollAfterInsert = (window.innerHeight + window.scrollY >= document.body.offsetHeight);"
		  js = js + "var body = document.getElementsByTagName('body')[0];"
		  js = js + "var line = document.createElement('div');"
		  
		  If timestamp = True Then
		    // TODO: Use Me.Timestamp setting and constants
		    Dim oTimestamp As New Date()
		    js = js + "var chat = document.createElement('span');"
		    js = js + "chat.style.color = 'rgb(" _
		    + Format(Colors.Gray.Red, "-#") + "," _
		    + Format(Colors.Gray.Green, "-#") + "," _
		    + Format(Colors.Gray.Blue, "-#") + ")';"
		    js = js + "chat.innerText = " + StringToJSON("[" + oTimestamp.LongTime + "] ") + ";"
		    js = js + "line.appendChild(chat);"
		  End If
		  
		  For Each value As Variant In values
		    If value.Type = Variant.TypeColor Then
		      c = value.ColorValue
		    ElseIf value.Type = Variant.TypeString Then
		      js = js + "var chat = document.createElement('span');"
		      js = js + "chat.style.color = 'rgb(" _
		      + Format(c.Red, "-#") + "," _
		      + Format(c.Green, "-#") + "," _
		      + Format(c.Blue, "-#") + ")';"
		      js = js + "chat.innerText = " + StringToJSON(value.StringValue) + ";"
		      js = js + "line.appendChild(chat);"
		    End If
		  Next
		  
		  js = js + "body.appendChild(line);"
		  js = js + "if (scrollAfterInsert) chat.scrollIntoView({block:""end"",behavior:""auto""});"
		  
		  Me.Container.oChatOutput.ExecuteJavaScript(js)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearChat(Silently As Boolean)
		  
		  Me.Container.oChatOutput.LoadURL("about:blank")
		  
		  If Silently = False Then
		    Me.AddChat(True, Colors.SkyBlue, "Chat screen cleared.")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.BNET = New BNETSocket()
		  Me.BNET.Config = Me
		  
		  Me.Container = New ConfigurationContainer()
		  Me.Container.Config = Me
		  
		  Me.CacheChatUnread = False
		  
		  Me.CachelstUsers_View_Channel     = ConfigurationContainer.lstUsers_View_Channel_Flags
		  Me.CachelstUsers_View_Friends     = ConfigurationContainer.lstUsers_View_Friends_Entry
		  Me.CachelstUsers_View_Clan        = ConfigurationContainer.lstUsers_View_Clan_Rank
		  Me.CachelstUsers_View_ChannelList = ConfigurationContainer.lstUsers_View_ChannelList_Entry
		  Me.CachelstUsers_View             = Me.CachelstUsers_View_Channel
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  Me.BNET.Disconnect()
		  Me.BNET = Nil
		  Me.Container = Nil
		  
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
		Container As ConfigurationContainer
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
