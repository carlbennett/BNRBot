#tag Class
Protected Class ChatParseThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  Dim msg As ChatMessage
		  Dim acl As UserAccess
		  Dim res As ChatResponse
		  
		  Dim localResponses() As ChatResponse
		  
		  Dim collectUserJoin As Dictionary
		  Dim collectUserLeave As Dictionary
		  Dim collectUserUpdate As Dictionary
		  
		  Do Until UBound( Me.messages ) < 0
		    
		    msg = Me.messages.Pop()
		    acl = Nil
		    res = Nil
		    
		    Select Case msg.eventId
		    Case Packets.EID_USERSHOW, Packets.EID_USERJOIN, Packets.EID_USERUPDATE
		      
		      Dim username As String = Battlenet.onlineNameToAccountName( msg.username, Me.client.state.product, True, "" )
		      Dim chlUser As New ChannelUser( msg.username, msg.text, msg.ping, msg.flags )
		      
		      If Not Me.client.state.channelUsers.HasKey( username ) Then
		        If collectUserJoin = Nil Then collectUserJoin = New Dictionary()
		        collectUserJoin.Value( username ) = chlUser
		      Else
		        If collectUserUpdate = Nil Then collectUserUpdate = New Dictionary()
		        collectUserUpdate.Value( username ) = chlUser
		      End If
		      
		      Me.client.state.channelUsers.Value( username ) = chlUser
		      
		      If msg.eventId = Packets.EID_USERJOIN And Me.client.config.greetEnabled = True Then
		        Dim greetMsg As ChatResponse = Battlenet.GreetBot(Me.client, msg, username)
		        If greetMsg <> Nil Then Me.responses.Append(greetMsg)
		      End If
		      
		    Case Packets.EID_USERLEAVE
		      
		      Dim username As String = Battlenet.onlineNameToAccountName( msg.username, Me.client.state.product, True, "" )
		      Dim chlUser As New ChannelUser( msg.username, msg.text, msg.ping, msg.flags )
		      
		      If collectUserLeave = Nil Then collectUserLeave = New Dictionary()
		      collectUserLeave.Value( username ) = chlUser
		      
		      If Me.client.state.channelUsers.HasKey( username ) Then
		        Me.client.state.channelUsers.Remove( username )
		      End If
		      
		    Case Packets.EID_WHISPER, Packets.EID_TALK, Packets.EID_EMOTE
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		      acl            = Me.client.getAcl(msg.username)
		      localResponses = BotCommand.handleCommand(Me.client, acl, msg)
		      
		    Case Packets.EID_BROADCAST
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		    Case Packets.EID_CHANNEL
		      
		      Me.client.state.channel      = msg.text
		      Me.client.state.channelUsers = New Dictionary()
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		    Case Packets.EID_CHANNEL_EMPTY
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		      Me.client.socBNET.Write(Packets.CreateBNET_SID_JOINCHANNEL(Packets.FLAG_FORCEJOIN, msg.text))
		      
		    Case Packets.EID_CHANNEL_FULL
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		      If Me.client.state.joinCommandState <> Nil And _
		        Me.client.state.joinCommandState.Right = msg.text Then
		        localResponses.Append(New ChatResponse(ChatResponse.TYPE_TALK, _
		        "/w " + Me.client.state.joinCommandState.Left + " " + msg.text + " is full"))
		      End If
		      
		    Case Packets.EID_CHANNEL_RESTRICTED
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		      If Me.client.state.joinCommandState <> Nil And _
		        Me.client.state.joinCommandState.Right = msg.text Then
		        localResponses.Append(New ChatResponse(ChatResponse.TYPE_TALK, _
		        "/w " + Me.client.state.joinCommandState.Left + " " + msg.text + " is restricted"))
		      End If
		      
		    Case Else
		      
		      MessengerThread.Messenger.Messages.Insert( 0, msg )
		      
		    End Select
		    
		  Loop
		  
		  If localResponses <> Nil Then
		    For Each res In localResponses
		      Me.responses.Insert(0, res)
		    Next
		    ReDim localResponses(-1)
		  End If
		  
		  If Me.client = Nil Or Me.client.socBNET = Nil Or Me.client.socBNET.IsConnected = False Then Return
		  
		  Do Until UBound(Me.responses) < 0
		    
		    res = Me.responses.Pop()
		    
		    Select Case res.type
		      
		    Case res.TYPE_PACKET
		      If LenB( res.text ) > 0 Then
		        Me.client.socBNET.Write( res.text )
		      End If
		      
		    Case res.TYPE_TALK
		      If LenB(res.text) > 0 Then
		        Me.client.socBNET.Write( Packets.CreateBNET_SID_CHATCOMMAND( res.text ))
		        
		        msg          = New ChatMessage( Me.client, True )
		        msg.username = Me.client.state.uniqueName
		        msg.text     = res.text
		        
		        MessengerThread.Messenger.Messages.Insert( 0, msg )
		      End If
		      
		    Case res.TYPE_EMOTE
		      Me.client.socBNET.Write( Packets.CreateBNET_SID_CHATCOMMAND( "/me " + res.text ))
		      
		    Case res.TYPE_WHISPER
		      Me.client.socBNET.Write( Packets.CreateBNET_SID_CHATCOMMAND( "/w " + msg.username + " " + res.text ))
		      
		    End Select
		    
		  Loop
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty

	#tag Property, Flags = &h0
		messages() As ChatMessage
	#tag EndProperty

	#tag Property, Flags = &h0
		responses() As ChatResponse
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
