#tag Class
Protected Class ChannelUser
	#tag Method, Flags = &h0
		Sub Constructor(username As String, metadata As String, ping As Int32, flags As UInt32)
		  
		  Me.flags    = flags
		  Me.metadata = metadata
		  Me.ping     = ping
		  Me.username = username
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		metadata As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ping As Int32
	#tag EndProperty

	#tag Property, Flags = &h0
		username As String
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
			Name="metadata"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
