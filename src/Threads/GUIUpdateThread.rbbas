#tag Class
Protected Class GUIUpdateThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  Dim e As GUIUpdateEvent
		  Dim i As Integer
		  
		  While UBound(Me.events) >= 0
		    e = Me.events(0)
		    Me.events.Remove(0)
		    If e = Nil Then Continue While
		    If e.client = Nil Then Continue While
		    If e.client.gui = Nil Then Continue While
		    
		    If e.type = GUIUpdateEvent.TypeChatOutput And e.data IsA ChatMessage Then
		      Dim msg As ChatMessage = ChatMessage(e.data)
		      
		      Select Case msg._origin
		      Case ChatMessage.OriginInternal
		        
		        If BitAnd(msg.flags, BitOr(ChatMessage.InternalFlagDebug, ChatMessage.InternalFlagNetwork)) _
		          = BitOr(ChatMessage.InternalFlagDebug, ChatMessage.InternalFlagNetwork) Then
		          Me.AddChat(e.client, App.colors.InternalNetworkDebug, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, BitOr(ChatMessage.InternalFlagInfo, ChatMessage.InternalFlagNetwork)) _
		          = BitOr(ChatMessage.InternalFlagInfo, ChatMessage.InternalFlagNetwork) Then
		          Me.AddChat(e.client, App.colors.InternalNetworkInfo, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, BitOr(ChatMessage.InternalFlagError, ChatMessage.InternalFlagNetwork)) _
		          = BitOr(ChatMessage.InternalFlagError, ChatMessage.InternalFlagNetwork) Then
		          Me.AddChat(e.client, App.colors.InternalNetworkError, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, BitOr(ChatMessage.InternalFlagSuccess, ChatMessage.InternalFlagNetwork)) _
		          = BitOr(ChatMessage.InternalFlagSuccess, ChatMessage.InternalFlagNetwork) Then
		          Me.AddChat(e.client, App.colors.InternalNetworkSuccess, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, ChatMessage.InternalFlagDebug) = ChatMessage.InternalFlagDebug Then
		          Me.AddChat(e.client, App.colors.InternalDebug, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, ChatMessage.InternalFlagInfo) = ChatMessage.InternalFlagInfo Then
		          Me.AddChat(e.client, App.colors.InternalInfo, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, ChatMessage.InternalFlagError) = ChatMessage.InternalFlagError Then
		          Me.AddChat(e.client, App.colors.InternalError, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, ChatMessage.InternalFlagSuccess) = ChatMessage.InternalFlagSuccess Then
		          Me.AddChat(e.client, App.colors.InternalSuccess, msg.text + EndOfLine)
		        ElseIf BitAnd(msg.flags, ChatMessage.InternalFlagChatSent) = ChatMessage.InternalFlagChatSent Then
		          If Left(msg.text, 1) = "/" Then
		            Me.AddChat(e.client, App.colors.InternalDebug, msg.text + EndOfLine)
		          Else
		            Me.AddChat(e.client, App.colors.ChatEventUserTalkName, "<" + msg.username + "> ", _
		            App.colors.ChatEventUserTalkMessage, msg.text + EndOfLine)
		          End If
		        Else
		          Me.AddChat(e.client, App.colors.DefaultTextColor, msg.text + EndOfLine)
		        End If
		        
		      Case ChatMessage.OriginBattlenet
		        
		        Select Case msg.eventId
		        Case Packets.EID_USERSHOW
		          Me.events.Append(New GUIUpdateEvent(e.client, GUIUpdateEvent.TypeUserJoin, msg.username))
		          
		        Case Packets.EID_USERJOIN
		          Me.events.Append(New GUIUpdateEvent(e.client, GUIUpdateEvent.TypeUserJoin, msg.username))
		          Me.AddChat(e.client, App.colors.ChatEventUserJoin, "-- " + msg.username + " joined the channel" + EndOfLine)
		          
		        Case Packets.EID_USERLEAVE
		          Me.events.Append(New GUIUpdateEvent(e.client, GUIUpdateEvent.TypeUserLeave, msg.username))
		          Me.AddChat(e.client, App.colors.ChatEventUserLeave, "-- " + msg.username + " left the channel" + EndOfLine)
		          
		        Case Packets.EID_WHISPER
		          Me.AddChat(e.client, App.colors.ChatEventUserWhisperName, "<From: " + msg.username + "> ", _
		          App.colors.ChatEventUserWhisperMessage, msg.text + EndOfLine)
		          
		        Case Packets.EID_TALK
		          Me.AddChat(e.client, App.colors.ChatEventUserTalkName, "<" + msg.username + "> ", _
		          App.colors.ChatEventUserTalkMessage, msg.text + EndOfLine)
		          
		        Case Packets.EID_BROADCAST
		          If msg.username = "Battle.net" Or Len(msg.username) = 0 Then
		            Me.AddChat(e.client, App.colors.ChatEventBroadcastName, "Server Broadcast: ", _
		            App.colors.ChatEventBroadcastMessage, msg.text + EndOfLine)
		          Else
		            Me.AddChat(e.client, App.colors.ChatEventBroadcastName, "Server Broadcast from " + msg.username + ": ", _
		            App.colors.ChatEventBroadcastMessage, msg.text + EndOfLine)
		          End If
		          
		        Case Packets.EID_CHANNEL
		          Me.events.Append(New GUIUpdateEvent(e.client, GUIUpdateEvent.TypeChannelJoin, msg.text))
		          Me.AddChat(e.client, App.colors.ChatEventChannelJoin, "-- Joined Channel: " + msg.text + EndOfLine)
		          
		        Case Packets.EID_USERUPDATE
		          Me.AddChat(e.client, App.colors.InternalDebug, "-- User updated: " + msg.username + EndOfLine)
		          
		        Case Packets.EID_WHISPERSENT
		          Me.AddChat(e.client, App.colors.ChatEventUserWhisperName, "<To: " + msg.username + "> ", _
		          App.colors.ChatEventUserWhisperMessage, msg.text + EndOfLine)
		          
		        Case Packets.EID_CHANNEL_FULL
		          Me.AddChat(e.client, App.colors.ChatEventError, "-- Channel " + msg.text + " is full" + EndOfLine)
		          
		        Case Packets.EID_CHANNEL_EMPTY
		          Me.AddChat(e.client, App.colors.ChatEventError, "-- Channel " + msg.text + " is empty" + EndOfLine)
		          
		        Case Packets.EID_CHANNEL_RESTRICTED
		          Me.AddChat(e.client, App.colors.ChatEventError, "-- Channel " + msg.text + " is restricted" + EndOfLine)
		          
		        Case Packets.EID_INFO
		          Me.AddChat(e.client, App.colors.ChatEventInfo, msg.text + EndOfLine)
		          
		        Case Packets.EID_ERROR
		          Me.AddChat(e.client, App.colors.ChatEventError, msg.text + EndOfLine)
		          
		        Case Packets.EID_EMOTE
		          Me.AddChat(e.client, App.colors.ChatEventUserEmoteName, "<" + msg.username + " ", _
		          App.colors.ChatEventUserEmoteMessage, msg.text + ">" + EndOfLine)
		          
		        End Select
		        
		      Case Else
		        Dim err As New BotException("Unable to handle chat message origin", 0, Nil)
		        Raise err
		      End Select
		      
		    ElseIf e.type = GUIUpdateEvent.TypeUserJoin Then
		      
		      e.client.gui.UserView.AddRow(e.data.StringValue)
		      
		    ElseIf e.type = GUIUpdateEvent.TypeUserLeave Then
		      
		      i = e.client.gui.UserView.ListCount - 1
		      While i >= 0
		        If e.client.gui.UserView.Cell(i, 0) = e.data.StringValue Then
		          e.client.gui.UserView.RemoveRow(i)
		          Exit While
		        End If
		        i = i - 1
		      Wend
		      
		    ElseIf e.type = GUIUpdateEvent.TypeChannelJoin Then
		      
		      e.client.gui.UserView.DeleteAllRows()
		      
		    Else
		      Dim err As New BotException("Unable to handle GUI update event", 0, Nil)
		      Raise err
		    End If
		  Wend
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		 Shared Sub AddChat(client As BNETClient, ParamArray values As Variant)
		  
		  For Each v As Variant In values
		    Select Case VarType(v)
		    Case Variant.TypeColor
		      client.gui.ChatOutput.SelStart     = Len(client.gui.ChatOutput.Text)
		      client.gui.ChatOutput.SelTextColor = v.ColorValue
		    Case Variant.TypeString
		      client.gui.ChatOutput.SelStart = Len(client.gui.ChatOutput.Text)
		      client.gui.ChatOutput.SelText  = v.StringValue
		    Case Else
		      Dim err As New BotException("Unable to handle addchat parameter", 0, Nil)
		      Raise err
		    End Select
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		events() As GUIUpdateEvent
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
