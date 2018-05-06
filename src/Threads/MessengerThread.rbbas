#tag Class
Protected Class MessengerThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  Dim message As BaseMessage
		  
		  Do
		    While UBound( Me.Messages ) >= 0
		      
		      message = Me.messages.Pop()
		      
		      Select Case BaseMessage.Ids( message.GetId() )
		        
		      Case BaseMessage.Ids.ChatEventReceive
		        Me.HandleChatReceive( ChatMessage( message ))
		        
		      Case BaseMessage.Ids.ChatEventSend
		        Me.HandleChatSend( ChatMessage( message ))
		        
		      Case BaseMessage.Ids.InternalEvent
		        Me.HandleInternal( InternalMessage( message ))
		        
		      Case BaseMessage.Ids.SocketConnected
		        Me.HandleSocketConnected( message )
		        
		      Case Else
		        Dim err As New BotException( "Unknown message" )
		        Raise err
		        
		      End Select
		      
		    Wend
		    
		    Me.Sleep( 10 )
		  Loop
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub HandleChatReceive(message As ChatMessage)
		  
		  Select Case message.eventId
		    
		  Case Packets.EID_USERSHOW
		    
		  Case Packets.EID_USERJOIN
		    message.Client.AddChat( True, App.config.colors.ChatEventUserJoin, "-- " + message.username + " joined the channel" + EndOfLine )
		    
		  Case Packets.EID_USERLEAVE
		    message.Client.AddChat( True, App.config.colors.ChatEventUserLeave, "-- " + message.username + " left the channel" + EndOfLine )
		    
		  Case Packets.EID_WHISPER
		    message.Client.AddChat( True, App.config.colors.ChatEventUserWhisperName, "<From: " + message.username + "> ", _
		    App.config.colors.ChatEventUserWhisperMessage, message.text + EndOfLine)
		    
		  Case Packets.EID_TALK
		    message.Client.AddChat( True, App.config.colors.ChatEventUserTalkName, "<" + message.username + "> ", _
		    App.config.colors.ChatEventUserTalkMessage, message.text + EndOfLine )
		    
		  Case Packets.EID_BROADCAST
		    
		    Dim broadcastStr As String = "Server Broadcast"
		    
		    If Len( message.username ) > 0 And message.username <> "Battle.net" Then
		      broadcastStr = broadcastStr + " from " + message.username
		    End If
		    
		    broadcastStr = broadcastStr + ": "
		    
		    message.Client.AddChat( True, App.config.colors.ChatEventBroadcastName, broadcastStr, _
		    App.config.colors.ChatEventBroadcastMessage, message.text + EndOfLine )
		    
		  Case Packets.EID_CHANNEL
		    message.Client.AddChat(True, App.config.colors.ChatEventChannelJoin, "-- Joined Channel: " + message.text + EndOfLine)
		    
		  Case Packets.EID_USERUPDATE
		    
		  Case Packets.EID_WHISPERSENT
		    message.Client.AddChat( True, App.config.colors.ChatEventUserWhisperName, "<To: " + message.username + "> ", _
		    App.config.colors.ChatEventUserWhisperMessage, message.text + EndOfLine )
		    
		  Case Packets.EID_CHANNEL_FULL
		    message.Client.AddChat( True, App.config.colors.ChatEventError, "-- Channel " + message.text + " is full" + EndOfLine )
		    
		  Case Packets.EID_CHANNEL_EMPTY
		    message.Client.AddChat( True, App.config.colors.ChatEventError, "-- Channel " + message.text + " is empty" + EndOfLine )
		    
		  Case Packets.EID_CHANNEL_RESTRICTED
		    message.Client.AddChat( True, App.config.colors.ChatEventError, "-- Channel " + message.text + " is restricted" + EndOfLine )
		    
		  Case Packets.EID_INFO
		    message.Client.AddChat( True, App.config.colors.ChatEventInfo, message.text + EndOfLine )
		    
		  Case Packets.EID_ERROR
		    message.Client.AddChat( True, App.config.colors.ChatEventError, message.text + EndOfLine )
		    
		  Case Packets.EID_EMOTE
		    message.Client.AddChat( True, App.config.colors.ChatEventUserEmoteName, "<" + message.username + " ", _
		    App.config.colors.ChatEventUserEmoteMessage, message.text + ">" + EndOfLine )
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleChatSend(message As ChatMessage)
		  
		  If Left( message.Text, 1 ) = "/" Then
		    
		    message.Client.AddChat( True, App.config.colors.InternalDebug, message.Text + EndOfLine )
		    
		  Else
		    
		    message.Client.AddChat( True, App.config.colors.ChatEventUserTalkName, "<" + message.username + "> ", _
		    App.config.colors.ChatEventUserTalkMessage, message.text + EndOfLine )
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleInternal(message As InternalMessage)
		  
		  Dim flagDebug   As Boolean = False
		  Dim flagError   As Boolean = False
		  Dim flagInfo    As Boolean = False
		  Dim flagSuccess As Boolean = False
		  Dim flagNetwork As Boolean = False
		  
		  Dim loggerLine As String = ""
		  
		  Dim chatColor As Color
		  
		  If BitAnd( message.Flags, InternalMessage.FlagDebug ) = InternalMessage.FlagDebug Then
		    
		    loggerLine = loggerLine + "Debug, "
		    flagDebug = True
		    
		  ElseIf BitAnd( message.Flags, InternalMessage.FlagInfo ) = InternalMessage.FlagInfo Then
		    
		    loggerLine = loggerLine + "Info, "
		    flagInfo = True
		    
		  ElseIf BitAnd( message.Flags, InternalMessage.FlagError ) = InternalMessage.FlagError Then
		    
		    loggerLine = loggerLine + "Error, "
		    flagError = True
		    
		  End If
		  
		  If BitAnd( message.Flags, InternalMessage.FlagSuccess ) = InternalMessage.FlagSuccess Then
		    
		    loggerLine = loggerLine + "Success, "
		    flagSuccess = True
		    
		  End If
		  
		  If BitAnd( message.Flags, InternalMessage.FlagNetwork ) = InternalMessage.FlagNetwork Then
		    
		    loggerLine = loggerLine + "Network, "
		    flagNetwork = True
		    
		  End If
		  
		  loggerLine = "[" + Left( loggerLine, Len( loggerLine ) - 2 ) + "] " + message.Text
		  
		  Logger.WriteLine( True, loggerLine )
		  
		  // --
		  
		  If flagNetwork And flagDebug Then
		    chatColor = App.config.colors.InternalNetworkDebug
		  ElseIf flagNetwork And flagError Then
		    chatColor = App.config.colors.InternalNetworkError
		  ElseIf flagNetwork And flagInfo Then
		    chatColor = App.config.colors.InternalNetworkInfo
		  ElseIf flagNetwork And flagSuccess Then
		    chatColor = App.config.colors.InternalNetworkSuccess
		  ElseIf Not flagNetwork And flagDebug Then
		    chatColor = App.config.colors.InternalDebug
		  ElseIf Not flagNetwork And flagError Then
		    chatColor = App.config.colors.InternalError
		  ElseIf Not flagNetwork And flagInfo Then
		    chatColor = App.config.colors.InternalInfo
		  ElseIf Not flagNetwork And flagSuccess Then
		    chatColor = App.config.colors.InternalSuccess
		  Else
		    chatColor = App.config.colors.DefaultTextColor
		  End If
		  
		  message.Client.AddChat( True, chatColor, message.Text + EndOfLine )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HandleSocketConnected(message As BaseMessage)
		  
		  If message.Client.chatWindow <> Nil And message.Client.chatWindow.SelectedClient() = message.Client Then
		    
		    message.Client.chatWindow.UserView.DeleteAllRows()
		    message.Client.chatWindow.StatusCtl.Text = "Please Wait"
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = GUIUpdateThread.Run
		  
		  Dim e As GUIUpdateEventDep
		  Dim i As Integer
		  Dim msg As ChatMessage
		  
		  While UBound(Me.events) >= 0
		    e = Me.events(0)
		    Me.events.Remove(0)
		    If e = Nil Then Continue While
		    If e.client = Nil Then Continue While
		    
		    If e.type = GUIUpdateEvent.TypeUserJoin Then
		      
		      msg = ChatMessage( e.data )
		      
		      If e.client.chatWindow <> Nil And e.client.chatWindow.SelectedClient() = e.client Then
		        
		        e.client.chatWindow.UserView.AddRow( LeftB( msg.text, 4 ))
		        e.client.chatWindow.UserView.Cell( e.client.chatWindow.UserView.LastIndex, 1 ) = _
		        Battlenet.onlineNameToAccountName( msg.username, e.client.state.product, True, "" )
		        
		      End If
		      
		    ElseIf e.type = GUIUpdateEvent.TypeUserLeave Then
		      
		      msg = ChatMessage( e.data )
		      
		      If e.client.chatWindow <> Nil And e.client.chatWindow.SelectedClient() = e.client Then
		        
		        i = e.client.chatWindow.UserView.ListCount - 1
		        While i >= 0
		          If e.client.chatWindow.UserView.Cell( i, 1 ) = _
		            Battlenet.onlineNameToAccountName( msg.username, e.client.state.product, True, "" ) Then
		            e.client.chatWindow.UserView.RemoveRow( i )
		            Exit While
		          End If
		          i = i - 1
		        Wend
		        
		      End If
		      
		    ElseIf e.type = GUIUpdateEvent.TypeUserUpdate Then
		      
		      msg = ChatMessage( e.data )
		      
		      If e.client.chatWindow <> Nil And e.client.chatWindow.SelectedClient() = e.client Then
		        
		        i = e.client.chatWindow.UserView.ListCount - 1
		        While i >= 0
		          If e.client.chatWindow.UserView.Cell( i, 1 ) = _
		            Battlenet.onlineNameToAccountName( msg.username, e.client.state.product, True, "" ) Then
		            e.client.chatWindow.UserView.Cell( i, 0 ) = LeftB( msg.text, 4 )
		            Exit While
		          End If
		          i = i - 1
		        Wend
		        
		        If i < 0 Then
		          e.client.chatWindow.UserView.AddRow( LeftB( msg.text, 4 ))
		          e.client.chatWindow.UserView.Cell( e.client.chatWindow.UserView.LastIndex, 1 ) = _
		          Battlenet.onlineNameToAccountName( msg.username, e.client.state.product, True, "" )
		        End If
		        
		      End If
		      
		    ElseIf e.type = GUIUpdateEvent.TypeChannelJoin Then
		      
		      If e.client.chatWindow <> Nil And e.client.chatWindow.SelectedClient() = e.client Then
		        
		        e.client.chatWindow.UserView.DeleteAllRows()
		        e.client.chatWindow.StatusCtl.Text = Replace( e.data, "&", "&&" )
		        
		      End If
		      
		    Else
		      Dim err As New BotException("Unable to handle GUI update event", 0, Nil)
		      Raise err
		    End If
		  Wend
		  
	#tag EndNote


	#tag Property, Flags = &h0
		Messages() As BaseMessage
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared Messenger As MessengerThread
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
