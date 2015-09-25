#tag Class
Protected Class SocketTimer
Inherits Timer
	#tag Event
		Sub Action()
		  
		  If Me.Parent = Nil Then
		    Me.Enabled = False
		  ElseIf Me.Parent IsA BNETSocket Then
		    Dim Sock As BNETSocket = BNETSocket(Me.Parent)
		    Sock.TimerAction(Me)
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(Parent As TCPSocket, Period As Integer, Mode As Integer, Enabled As Boolean)
		  
		  Me.Parent = Parent
		  Me.Period = Period
		  Me.Mode = Mode
		  Me.Enabled = Enabled
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Parent As TCPSocket
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
			InheritedFrom="Timer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
