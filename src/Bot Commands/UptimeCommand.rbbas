#tag Class
Protected Class UptimeCommand
Inherits BotCommand
	#tag Event
		Function Action(client As BNETClient, message As ChatMessage, suggestedResponseType As Integer, args As String) As ChatResponse
		  
		  #pragma Unused message
		  #pragma Unused args
		  
		  Dim execConst As Double = Microseconds()
		  
		  Dim systemUptime As Double = Ceil(App.SystemUptime())
		  Dim botUptime As Double = Ceil((execConst - App.uptimeConstant) / 1000000)
		  Dim connectionUptime As Double = 0
		  
		  If client <> Nil And client.state <> Nil And client.socBNET.IsConnected = True Then
		    connectionUptime = Ceil((execConst - client.state.connectedTime) / 1000000)
		  Else
		    connectionUptime = 0
		  End If
		  
		  Dim uptime As String = "System [" + _
		  App.TimeString(systemUptime, False, True) + "] Bot [" + _
		  App.TimeString(botUptime, False, True) + "]"
		  
		  If connectionUptime <> 0 Then
		    uptime = uptime + "Connection [" + _
		    App.TimeString(connectionUptime, False, True) + "]"
		  End If
		  
		  Return New ChatResponse(suggestedResponseType, uptime)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Match(value As String, trigger As String) As Boolean
		  
		  #pragma Unused trigger
		  
		  Return (value = "uptime")
		  
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
