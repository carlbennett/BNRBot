#tag Class
Protected Class GUIUpdateThread
Inherits Thread
	#tag Event
		Sub Run()
		  
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
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		events() As GUIUpdateEventDep
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
