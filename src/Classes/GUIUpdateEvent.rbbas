#tag Class
Protected Class GUIUpdateEvent
	#tag Method, Flags = &h0
		 Shared Sub BattlenetMessage(message As ChatMessage, client As BNETClient)
		  
		  Dim e As New GUIUpdateEvent(client, GUIUpdateEvent.TypeChatOutput, message)
		  
		  e.Render()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(client As BNETClient, type As Integer, data As Variant)
		  
		  Me.client = client
		  Me.type   = type
		  Me.data   = data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub InternalMessage(messageText As String, messageFlags As UInt32, client As BNETClient)
		  
		  Dim m As New ChatMessage(ChatMessage.OriginInternal)
		  Dim e As New GUIUpdateEvent(client, GUIUpdateEvent.TypeChatOutput, m)
		  
		  m.flags = messageFlags
		  m.text  = messageText
		  
		  e.Render()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Render()
		  
		  If Me.GUIUpdateThread = Nil Then
		    Me.GUIUpdateThread = New GUIUpdateThread()
		  End If
		  
		  Me.GUIUpdateThread.events.Append(Me)
		  
		  If Me.GUIUpdateThread.State = Me.GUIUpdateThread.NotRunning Then
		    Me.GUIUpdateThread.Run()
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty

	#tag Property, Flags = &h0
		data As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared GUIUpdateThread As GUIUpdateThread
	#tag EndProperty

	#tag Property, Flags = &h0
		type As Integer
	#tag EndProperty


	#tag Constant, Name = TypeChannelJoin, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeChatOutput, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeUserJoin, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeUserLeave, Type = Double, Dynamic = False, Default = \"2", Scope = Public
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
