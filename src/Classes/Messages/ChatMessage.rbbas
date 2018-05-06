#tag Class
Protected Class ChatMessage
Inherits BaseMessage
	#tag Method, Flags = &h0
		Sub Constructor(Client As BNETClient, Internal As Boolean)
		  
		  If Internal Then
		    Super.Constructor( Client, Int32( Super.Ids.ChatEventSend ))
		  Else
		    Super.Constructor( Client, Int32( Super.Ids.ChatEventReceive ))
		  End If
		  
		  Me.accountNumber         = 0
		  Me.eventId               = 0
		  Me.flags                 = 0
		  Me.ipAddress             = 0
		  Me.ping                  = 0
		  Me.registrationAuthority = 0
		  Me.text                  = ""
		  Me.username              = ""
		  Me._internal             = Internal
		  
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
		_internal As Boolean
	#tag EndProperty


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
		#tag ViewProperty
			Name="_origin"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
