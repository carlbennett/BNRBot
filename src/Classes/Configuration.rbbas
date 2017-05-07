#tag Class
Protected Class Configuration
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.alias                    = ""
		  Me.autoRejoinOnKick         = False
		  Me.bnetHost                 = "useast.battle.net"
		  Me.bnetPort                 = 6112
		  Me.bnlsEnabled              = True
		  Me.bnlsHost                 = "bnls.bnetdocs.org"
		  Me.bnlsPort                 = 9367
		  Me.confirmClanMemberRemoval = True
		  Me.createAccountBeforeLogon = False
		  Me.email                    = ""
		  Me.gameKey1                 = ""
		  Me.gameKey2                 = ""
		  Me.gameKeyOwner             = App.ProjectName() + "v" + Format(App.MajorVersion, "-#")
		  Me.gameKeySpawn             = False
		  Me.greetAclExclusive        = False
		  Me.greetEnabled             = False
		  Me.greetMessage             = ""
		  Me.homeChannel              = ""
		  Me.init6Protocol            = False
		  Me.logJoinLeave             = True
		  Me.logNetwork               = False
		  Me.muteBanKickUnban         = False
		  Me.muteUserInChannelUpdates = False
		  Me.password                 = ""
		  Me.passwordNew              = ""
		  Me.pingSpoof                = 0
		  Me.platform                 = Battlenet.Platform_IX86
		  Me.preventDuplicateMessages = True
		  Me.product                  = 0
		  Me.productVersionCode       = 0
		  Me.proxyHost                = ""
		  Me.proxyMode                = Me.ProxyModeDisabled
		  Me.reconnectInterval        = 300000
		  Me.timestampMode            = BitOr(Me.TimestampModeShortDate, Me.TimestampModeLongTime)
		  Me.trigger                  = "!"
		  Me.udpEnabled               = True
		  Me.username                 = ""
		  Me.utf8Messages             = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		alias As String
	#tag EndProperty

	#tag Property, Flags = &h0
		autoRejoinOnKick As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bnetHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bnetPort As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsPort As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		confirmClanMemberRemoval As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		createAccountBeforeLogon As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		email As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gameKey1 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gameKey2 As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gameKeyOwner As String
	#tag EndProperty

	#tag Property, Flags = &h0
		gameKeySpawn As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		greetAclExclusive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		greetEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		greetMessage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		homeChannel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		init6Protocol As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		logJoinLeave As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		logNetwork As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		muteBanKickUnban As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		muteUserInChannelUpdates As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		passwordNew As String
	#tag EndProperty

	#tag Property, Flags = &h0
		pingSpoof As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		platform As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		preventDuplicateMessages As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		product As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		productVersionCode As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		proxyHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		proxyMode As UInt8
	#tag EndProperty

	#tag Property, Flags = &h0
		reconnectInterval As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		timestampMode As UInt8
	#tag EndProperty

	#tag Property, Flags = &h0
		trigger As String
	#tag EndProperty

	#tag Property, Flags = &h0
		udpEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		username As String
	#tag EndProperty

	#tag Property, Flags = &h0
		utf8Messages As Boolean
	#tag EndProperty


	#tag Constant, Name = ProxyModeDisabled, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxyModeHTTP, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxyModeSocksV4, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ProxyModeSocksV5, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeAbbrDate, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeLongDate, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeLongTime, Type = Double, Dynamic = False, Default = \"&H10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeMilitaryTime, Type = Double, Dynamic = False, Default = \"&H20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeShortDate, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TimestampModeShortTime, Type = Double, Dynamic = False, Default = \"&H08", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="bnetHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bnlsHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="email"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gameKey1"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gameKey2"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="gameKeyOwner"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="greetAclExclusive"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="greetEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="greetMessage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="homeChannel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="logNetwork"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="passwordNew"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="trigger"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
