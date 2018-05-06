#tag Class
Protected Class InterfaceMessage
Inherits BaseMessage
	#tag Method, Flags = &h1000
		Sub Constructor(Client As BNETClient, Id As BaseMessage.Ids)
		  
		  Select Case Id
		    
		  Case BaseMessage.Ids.ClanViewList
		  Case BaseMessage.Ids.ClanViewReset
		  Case BaseMessage.Ids.ClanViewUpdate
		    
		  Case BaseMessage.Ids.FriendViewList
		  Case BaseMessage.Ids.FriendViewReset
		  Case BaseMessage.Ids.FriendViewUpdate
		    
		  Case BaseMessage.Ids.FriendViewList
		  Case BaseMessage.Ids.FriendViewReset
		  Case BaseMessage.Ids.FriendViewUpdate
		    
		  Case BaseMessage.Ids.SocketConnected
		    
		  Case BaseMessage.Ids.UserViewList
		  Case BaseMessage.Ids.UserViewReset
		  Case BaseMessage.Ids.UserViewUpdate
		    
		  Case Else
		    
		    Dim err As New BotException( "Invalid interface message id" )
		    Raise err
		    
		  End Select
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor( Client, Int32( Id ))
		  
		End Sub
	#tag EndMethod


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
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
