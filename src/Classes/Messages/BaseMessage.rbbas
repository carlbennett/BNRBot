#tag Class
Protected Class BaseMessage
	#tag Method, Flags = &h1
		Protected Sub Constructor(Client As BNETClient, Id As Integer)
		  
		  Me.Client = Client
		  Me.Id = Id
		  Me.State = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetClient() As BNETClient
		  
		  Return Me.Client
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetId() As Integer
		  
		  Return Me.Id
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Client As BNETClient
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Id As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected State As MemoryBlock
	#tag EndProperty


	#tag Enum, Name = Ids, Type = Integer, Flags = &h0
		InternalEvent
		  SocketConnected
		  ChatEventReceive
		  ChatEventSend
		  ClanViewReset
		  ClanViewList
		  ClanViewUpdate
		  FriendViewReset
		  FriendViewList
		  FriendViewUpdate
		  UserViewReset
		  UserViewList
		UserViewUpdate
	#tag EndEnum


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
	#tag EndViewBehavior
End Class
#tag EndClass
