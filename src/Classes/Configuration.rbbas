#tag Class
Protected Class Configuration
Implements Serializable
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

	#tag Method, Flags = &h0
		Function Serialize() As String
		  // Part of the Serializable interface.
		  
		  Dim mb As New MemoryBlock( 34 + 14 + LenB( _
		  Me.alias + Me.bnetHost + Me.bnlsHost + Me.email + Me.gameKey1 + _
		  Me.gameKey2 + Me.gameKeyOwner + Me.greetMessage + Me.homeChannel + _
		  Me.password + Me.passwordNew + Me.proxyHost + Me.trigger + _
		  Me.username _
		  ) )
		  Dim pos As UInt32 = 0
		  Dim flags As UInt64 = 0
		  
		  mb.LittleEndian = True
		  
		  If Me.autoRejoinOnKick Then flags = BitOr( flags, &H00000001 )
		  If Me.bnlsEnabled Then flags = BitOr( flags, &H00000002 )
		  If Me.confirmClanMemberRemoval Then flags = BitOr( flags, &H00000004 )
		  If Me.createAccountBeforeLogon Then flags = BitOr( flags, &H00000008 )
		  If Me.gameKeySpawn Then flags = BitOr( flags, &H00000010 )
		  If Me.greetAclExclusive Then flags = BitOr( flags, &H00000020 )
		  If Me.greetEnabled Then flags = BitOr( flags, &H00000040 )
		  If Me.init6Protocol Then flags = BitOr( flags, &H00000080 )
		  If Me.logJoinLeave Then flags = BitOr( flags, &H00000100 )
		  If Me.logNetwork Then flags = BitOr( flags, &H00000200 )
		  If Me.muteBanKickUnban Then flags = BitOr( flags, &H00000400 )
		  If Me.muteUserInChannelUpdates Then flags = BitOr( flags, &H00000800 )
		  If Me.preventDuplicateMessages Then flags = BitOr( flags, &H00001000 )
		  If Me.udpEnabled Then flags = BitOr( flags, &H00002000 )
		  If Me.utf8Messages Then flags = BitOr( flags, &H00004000 )
		  
		  mb.UInt64Value( pos ) = flags
		  pos = pos + 8
		  
		  mb.UInt16Value( pos ) = Me.bnetPort
		  pos = pos + 2
		  
		  mb.UInt16Value( pos ) = Me.bnlsPort
		  pos = pos + 2
		  
		  mb.UInt32Value( pos ) = Me.pingSpoof
		  pos = pos + 4
		  
		  mb.UInt32Value( pos ) = Me.platform
		  pos = pos + 4
		  
		  mb.UInt32Value( pos ) = Me.product
		  pos = pos + 4
		  
		  mb.UInt32Value( pos ) = Me.productVersionCode
		  pos = pos + 4
		  
		  mb.UInt8Value( pos ) = Me.proxyMode
		  pos = pos + 1
		  
		  mb.UInt32Value( pos ) = Me.reconnectInterval
		  pos = pos + 4
		  
		  mb.UInt8Value( pos ) = Me.timestampMode
		  pos = pos + 1
		  
		  mb.CString( pos ) = Me.alias
		  pos = pos + 1 + LenB( Me.alias )
		  
		  mb.CString( pos ) = Me.bnetHost
		  pos = pos + 1 + LenB( Me.bnetHost )
		  
		  mb.CString( pos ) = Me.bnlsHost
		  pos = pos + 1 + LenB( Me.bnlsHost )
		  
		  mb.CString( pos ) = Me.email
		  pos = pos + 1 + LenB( Me.email )
		  
		  mb.CString( pos ) = Me.gameKey1
		  pos = pos + 1 + LenB( Me.gameKey1 )
		  
		  mb.CString( pos ) = Me.gameKey2
		  pos = pos + 1 + LenB( Me.gameKey2 )
		  
		  mb.CString( pos ) = Me.gameKeyOwner
		  pos = pos + 1 + LenB( Me.gameKeyOwner )
		  
		  mb.CString( pos ) = Me.greetMessage
		  pos = pos + 1 + LenB( Me.greetMessage )
		  
		  mb.CString( pos ) = Me.homeChannel
		  pos = pos + 1 + LenB( Me.homeChannel )
		  
		  mb.CString( pos ) = Me.password
		  pos = pos + 1 + LenB( Me.password )
		  
		  mb.CString( pos ) = Me.passwordNew
		  pos = pos + 1 + LenB( Me.passwordNew )
		  
		  mb.CString( pos ) = Me.proxyHost
		  pos = pos + 1 + LenB( Me.proxyHost )
		  
		  mb.CString( pos ) = Me.trigger
		  pos = pos + 1 + LenB( Me.trigger )
		  
		  mb.CString( pos ) = Me.username
		  pos = pos + 1 + LenB( Me.username )
		  
		  mb.Size = pos
		  
		  Return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unserialize(value As String)
		  // Part of the Serializable interface.
		  
		  Dim mb As MemoryBlock = value
		  Dim pos As UInt32 = 0
		  Dim flags As UInt64
		  
		  mb.LittleEndian = True
		  
		  flags = mb.UInt64Value( pos )
		  pos = pos + 8
		  
		  Me.autoRejoinOnKick         = ( BitAnd( flags, &H00000001 ) > 0 )
		  Me.bnlsEnabled              = ( BitAnd( flags, &H00000002 ) > 0 )
		  Me.confirmClanMemberRemoval = ( BitAnd( flags, &H00000004 ) > 0 )
		  Me.createAccountBeforeLogon = ( BitAnd( flags, &H00000008 ) > 0 )
		  Me.gameKeySpawn             = ( BitAnd( flags, &H00000010 ) > 0 )
		  Me.greetAclExclusive        = ( BitAnd( flags, &H00000020 ) > 0 )
		  Me.greetEnabled             = ( BitAnd( flags, &H00000040 ) > 0 )
		  Me.init6Protocol            = ( BitAnd( flags, &H00000080 ) > 0 )
		  Me.logJoinLeave             = ( BitAnd( flags, &H00000100 ) > 0 )
		  Me.logNetwork               = ( BitAnd( flags, &H00000200 ) > 0 )
		  Me.muteBanKickUnban         = ( BitAnd( flags, &H00000400 ) > 0 )
		  Me.muteUserInChannelUpdates = ( BitAnd( flags, &H00000800 ) > 0 )
		  Me.preventDuplicateMessages = ( BitAnd( flags, &H00001000 ) > 0 )
		  Me.udpEnabled               = ( BitAnd( flags, &H00002000 ) > 0 )
		  Me.utf8Messages             = ( BitAnd( flags, &H00004000 ) > 0 )
		  
		  Me.bnetPort = mb.UInt16Value( pos )
		  pos = pos + 2
		  
		  Me.bnlsPort = mb.UInt16Value( pos )
		  pos = pos + 2
		  
		  Me.pingSpoof = mb.UInt32Value( pos )
		  pos = pos + 4
		  
		  Me.platform = mb.UInt32Value( pos )
		  pos = pos + 4
		  
		  Me.product = mb.UInt32Value( pos )
		  pos = pos + 4
		  
		  Me.productVersionCode = mb.UInt32Value( pos )
		  pos = pos + 4
		  
		  Me.proxyMode = mb.UInt8Value( pos )
		  pos = pos + 1
		  
		  Me.reconnectInterval = mb.UInt32Value( pos )
		  pos = pos + 4
		  
		  Me.timestampMode = mb.UInt8Value( pos )
		  pos = pos + 1
		  
		  Me.alias = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.alias )
		  
		  Me.bnetHost = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.bnetHost )
		  
		  Me.bnlsHost = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.bnlsHost )
		  
		  Me.email = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.email )
		  
		  Me.gameKey1 = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.gameKey1 )
		  
		  Me.gameKey2 = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.gameKey2 )
		  
		  Me.gameKeyOwner = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.gameKeyOwner )
		  
		  Me.greetMessage = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.greetMessage )
		  
		  Me.homeChannel = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.homeChannel )
		  
		  Me.password = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.password )
		  
		  Me.passwordNew = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.passwordNew )
		  
		  Me.proxyHost = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.proxyHost )
		  
		  Me.trigger = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.trigger )
		  
		  Me.username = mb.CString( pos )
		  pos = pos + 1 + LenB( Me.username )
		  
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
			Name="alias"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoRejoinOnKick"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bnetHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bnlsEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="bnlsHost"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="confirmClanMemberRemoval"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="createAccountBeforeLogon"
			Group="Behavior"
			Type="Boolean"
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
			Name="gameKeySpawn"
			Group="Behavior"
			Type="Boolean"
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
			Name="init6Protocol"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="logJoinLeave"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="logNetwork"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="muteBanKickUnban"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="muteUserInChannelUpdates"
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
			Name="preventDuplicateMessages"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="proxyHost"
			Group="Behavior"
			Type="String"
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
			Name="udpEnabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="utf8Messages"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
