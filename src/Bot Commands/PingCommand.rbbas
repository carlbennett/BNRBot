#tag Class
Protected Class PingCommand
Inherits BotCommand
	#tag Event
		Function Action(client As BNETClient, message As ChatMessage, suggestedResponseType As Integer, args As String) As ChatResponse
		  
		  #pragma Unused message
		  
		  Dim username As String = NthField(args, " ", 1)
		  Dim obj As ChannelUser = client.state.channelUsers.Lookup(username, Nil)
		  
		  If obj = Nil Then
		    
		    Return New ChatResponse(suggestedResponseType, "Unable to find " + username + " in channel")
		    
		  Else
		    
		    Dim udpSupport As Boolean
		    Dim udpSupportString As String
		    
		    username   = Battlenet.onlineNameToAccountName(obj.username, client.state.product, True, "")
		    udpSupport = (BitAnd(obj.flags, &H10) = 0)
		    
		    If udpSupport = False Then udpSupportString = " with no UDP support" Else udpSupportString = ""
		    
		    Return New ChatResponse(suggestedResponseType, username + "'s ping is " + Format(obj.ping, "-#") + "ms" + udpSupportString)
		    
		  End If
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Match(value As String, trigger As String) As Boolean
		  
		  #pragma Unused trigger
		  
		  Return (value = "ping")
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  Super.Constructor(False)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="aclAdmin"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="BotCommand"
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
