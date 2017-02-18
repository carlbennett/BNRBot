#tag Class
Protected Class BotCommand
	#tag Method, Flags = &h0
		Sub Constructor(aclAdmin As Boolean)
		  
		  Me.aclAdmin = aclAdmin
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function execute(client As BNETClient, message As ChatMessage, suggestedResponseType As Integer, args As String) As ChatResponse
		  
		  Return Action(client, message, suggestedResponseType, args)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function handleCommand(client As BNETClient, acl As UserAccess, message As ChatMessage) As ChatResponse()
		  
		  If acl = Nil Then Return Nil
		  
		  Dim i, j, suggestedResponseType As Integer
		  Dim text, triggers(), trigger, cmds(), cmd, args As String
		  Dim responses(), response As ChatResponse
		  
		  triggers.Append(client.config.trigger)
		  triggers.Append(App.trigger)
		  triggers.Append("?")
		  
		  Do Until UBound(triggers) < 0
		    trigger = triggers.Pop()
		    If StrComp(Left(message.text, Len(trigger)), trigger, 0) = 0 Then
		      text = Mid(message.text, Len(trigger) + 1)
		      Exit Do
		    End If
		  Loop
		  
		  If UBound(triggers) < 0 And text = "" Then Return Nil
		  
		  Select Case message.eventId
		  Case Packets.EID_TALK
		    suggestedResponseType = ChatResponse.TYPE_TALK
		  Case Packets.EID_EMOTE
		    suggestedResponseType = ChatResponse.TYPE_EMOTE
		  Case Packets.EID_WHISPER
		    suggestedResponseType = ChatResponse.TYPE_WHISPER
		  Case Else
		    Raise New BNRBotException("Unable to handle command based on chat event id '" + Format(message.eventId, "-#") + "'")
		  End Select
		  
		  cmds = Split(text, ";")
		  i    = 0
		  j    = UBound(cmds)
		  
		  While i <= j
		    cmd      = NthField(cmds(i), " ", 1)
		    args     = Mid(cmds(i), Len(cmd) + 2)
		    response = Nil
		    
		    For Each oCmd As BotCommand In BotCommand.registered
		      If oCmd.matchCheck(cmd, trigger) Then
		        If oCmd.aclAdmin And Not acl.aclAdmin Then Continue For
		        client.state.lastCommand = oCmd
		        response = oCmd.execute(client, message, suggestedResponseType, args)
		        Exit For
		      End If
		    Next
		    
		    If response <> Nil Then responses.Append(response)
		    i = i + 1
		  Wend
		  
		  Return responses
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function matchCheck(value As String, trigger As String) As Boolean
		  
		  Return Match(value, trigger)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub registerAll()
		  
		  BotCommand.registered.Append(New BanCommand())
		  BotCommand.registered.Append(New HomeCommand())
		  BotCommand.registered.Append(New JoinCommand())
		  BotCommand.registered.Append(New KickCommand())
		  BotCommand.registered.Append(New OSCommand())
		  BotCommand.registered.Append(New PingCommand())
		  BotCommand.registered.Append(New PingMeCommand())
		  BotCommand.registered.Append(New QuitCommand())
		  BotCommand.registered.Append(New ReconnectCommand())
		  BotCommand.registered.Append(New SayCommand())
		  BotCommand.registered.Append(New TimeCommand())
		  BotCommand.registered.Append(New TriggerCommand())
		  BotCommand.registered.Append(New UnbanCommand())
		  BotCommand.registered.Append(New UptimeCommand())
		  BotCommand.registered.Append(New VersionCommand())
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action(client As BNETClient, message As ChatMessage, suggestedResponseType As Integer, args As String) As ChatResponse
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Match(value As String, trigger As String) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		aclAdmin As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared registered() As BotCommand
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="aclAdmin"
			Group="Behavior"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
