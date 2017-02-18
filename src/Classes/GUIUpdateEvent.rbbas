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


	#tag Constant, Name = TypeChatOutput, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
