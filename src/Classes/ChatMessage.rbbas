#tag Class
Protected Class ChatMessage
	#tag Method, Flags = &h0
		Sub Constructor(origin As Integer)
		  
		  Me.accountNumber         = 0
		  Me.eventId               = 0
		  Me.flags                 = 0
		  Me.ipAddress             = 0
		  Me.ping                  = 0
		  Me.registrationAuthority = 0
		  Me.text                  = ""
		  Me.username              = ""
		  Me._origin               = origin
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		accountNumber As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		eventId As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ipAddress As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		ping As Int32
	#tag EndProperty

	#tag Property, Flags = &h0
		registrationAuthority As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		text As String
	#tag EndProperty

	#tag Property, Flags = &h0
		username As String
	#tag EndProperty

	#tag Property, Flags = &h0
		_origin As Integer
	#tag EndProperty


	#tag Constant, Name = InternalFlagDebug, Type = Double, Dynamic = False, Default = \"&H03", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InternalFlagError, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InternalFlagInfo, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InternalFlagNetwork, Type = Double, Dynamic = False, Default = \"&H08", Scope = Public
	#tag EndConstant

	#tag Constant, Name = InternalFlagSuccess, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OriginBattlenet, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OriginInternal, Type = Double, Dynamic = False, Default = \"0", Scope = Public
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
			Name="text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
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
