#tag Class
Protected Class BNETState
	#tag Method, Flags = &h0
		Sub Constructor(client As BNETClient)
		  
		  Me.accountName           = ""
		  Me.bnetReadBuffer        = Nil
		  Me.bnlsReadBuffer        = Nil
		  Me.channel               = ""
		  Me.channelUsers          = New Dictionary()
		  Me.client                = client
		  Me.clientToken           = Battlenet.getClientToken()
		  Me.connectedTime         = 0
		  Me.email                 = client.config.email
		  Me.gameKey1              = client.config.gameKey1
		  Me.gameKey2              = client.config.gameKey2
		  Me.gameKeyOwner          = client.config.gameKeyOwner
		  Me.joinCommandState      = Nil
		  Me.lastCommand           = Nil
		  Me.localIP               = Battlenet.getLocalIP()
		  Me.logonType             = 0
		  Me.nls                   = new NLS( client.config.username, client.config.password )
		  Me.nullTimer             = new PacketTimer()
		  Me.password              = client.config.password
		  Me.passwordNew           = client.config.passwordNew
		  Me.platform              = client.config.platform
		  Me.product               = client.config.product
		  Me.reconnecting          = False
		  Me.serverSignature       = ""
		  Me.serverToken           = 0
		  Me.statstring            = ""
		  Me.timezoneBias          = Battlenet.getTimezoneBias()
		  Me.udpToken              = 0
		  Me.uniqueName            = ""
		  Me.username              = client.config.username
		  Me.versionAndKeyPassed   = False
		  Me.versionByte           = 0
		  Me.versionCheckFileName  = ""
		  Me.versionCheckFileTime  = 0
		  Me.versionCheckSignature = ""
		  Me.versionChecksum       = 0
		  Me.versionNumber         = 0
		  Me.versionSignature      = ""
		  
		  ReDim Me.channelList(-1)
		  
		  Me.nullTimer.socBNET = Me.client.socBNET
		  Me.nullTimer.socBNLS = Me.client.socBNLS
		  Me.nullTimer.Period  = 60000
		  Me.nullTimer.Mode    = Me.nullTimer.ModeMultiple
		  Me.nullTimer.Enabled = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  Me.bnetReadBuffer = Nil
		  Me.bnlsReadBuffer = Nil
		  
		  Me.channelUsers = Nil
		  
		  Me.nls.Close()
		  Me.nls = Nil
		  
		  Me.nullTimer.Enabled = False
		  Me.nullTimer = Nil
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		accountName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bnetReadBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsReadBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		channel As String
	#tag EndProperty

	#tag Property, Flags = &h0
		channelList() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		channelUsers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty

	#tag Property, Flags = &h0
		clientToken As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		connectedTime As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		email As String
	#tag EndProperty

	#tag Property, Flags = &h0
		friendsList() As Friend
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
		joinCommandState As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		lastCommand As BotCommand
	#tag EndProperty

	#tag Property, Flags = &h0
		localIP As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		logonType As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		nls As NLS
	#tag EndProperty

	#tag Property, Flags = &h0
		nullTimer As PacketTimer
	#tag EndProperty

	#tag Property, Flags = &h0
		password As String
	#tag EndProperty

	#tag Property, Flags = &h0
		passwordNew As String
	#tag EndProperty

	#tag Property, Flags = &h0
		platform As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		product As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		reconnecting As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		serverSignature As String
	#tag EndProperty

	#tag Property, Flags = &h0
		serverToken As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		statstring As String
	#tag EndProperty

	#tag Property, Flags = &h0
		timezoneBias As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		udpToken As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		uniqueName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		username As String
	#tag EndProperty

	#tag Property, Flags = &h0
		versionAndKeyPassed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		versionByte As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		versionCheckFileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		versionCheckFileTime As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		versionCheckSignature As String
	#tag EndProperty

	#tag Property, Flags = &h0
		versionChecksum As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		versionNumber As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		versionSignature As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="accountName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="channel"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="connectedTime"
			Group="Behavior"
			Type="Double"
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
			Name="reconnecting"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="serverSignature"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="statstring"
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
			Name="uniqueName"
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
		#tag ViewProperty
			Name="versionAndKeyPassed"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="versionCheckFileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="versionCheckSignature"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="versionSignature"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
