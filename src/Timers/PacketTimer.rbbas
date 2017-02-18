#tag Class
Protected Class PacketTimer
Inherits Timer
	#tag Event
		Sub Action()
		  
		  If Me.socBNET <> Nil And Me.socBNET.IsConnected = True Then
		    Me.socBNET.Write(Packets.CreateBNET_SID_NULL())
		  End If
		  
		  If Me.socBNLS <> Nil And Me.socBNLS.IsConnected = True Then
		    Me.socBNLS.Write(Packets.CreateBNLS_NULL())
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		socBNET As BNETSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		socBNLS As BNLSSocket
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="Timer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Timer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Timer"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Timer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
			InheritedFrom="Timer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Timer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Timer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
