#tag Class
Protected Class Configuration
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.bnetHost          = "useast.battle.net"
		  Me.bnetPort          = 6112
		  Me.bnlsHost          = "bnls.bnetdocs.org"
		  Me.bnlsPort          = 9367
		  Me.email             = ""
		  Me.gameKey1          = ""
		  Me.gameKey2          = ""
		  Me.gameKeyOwner      = App.ProjectName() + "v" + Format(App.MajorVersion, "-#")
		  Me.greetAclExclusive = False
		  Me.greetEnabled      = False
		  Me.greetMessage      = ""
		  Me.homeChannel       = ""
		  Me.logNetwork        = False
		  Me.password          = ""
		  Me.passwordNew       = ""
		  Me.platform          = Battlenet.Platform_IX86
		  Me.product           = 0
		  Me.trigger           = "!"
		  Me.username          = ""
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bnetHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bnetPort As UInt16
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsHost As String
	#tag EndProperty

	#tag Property, Flags = &h0
		bnlsPort As UInt16
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
		logNetwork As Boolean
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
		trigger As String
	#tag EndProperty

	#tag Property, Flags = &h0
		username As String
	#tag EndProperty


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
