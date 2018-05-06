#tag Class
Protected Class BNLSSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  MessengerThread.Messenger.Messages.Insert( 0, New InternalMessage( Me.client, InternalMessage.FlagNetwork + _
		  InternalMessage.FlagInfo + InternalMessage.FlagSuccess, "BNLS: Connected to " + Me.RemoteAddress + "!" ))
		  
		  If Me.client.state = Nil Then
		    Me.client.state = New BNETState(Me.client)
		  End If
		  
		  Me.Write(Packets.CreateBNLS_REQUESTVERSIONBYTE(Battlenet.productToBNLS(Me.client.state.product)))
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		  If Me.client.state = Nil Then
		    // We were most likely disconnected already since its null.
		    Return
		  End If
		  
		  If Me.client.state.bnlsReadBuffer = Nil Then
		    Me.client.state.bnlsReadBuffer = Me.ReadAll()
		  Else
		    Me.client.state.bnlsReadBuffer = Me.client.state.bnlsReadBuffer + Me.ReadAll()
		  End If
		  
		  If Me.client.state.bnlsReadBuffer.LittleEndian <> True Then
		    Me.client.state.bnlsReadBuffer.LittleEndian = True
		  End If
		  
		  If Me.client.packetParser.State = Me.client.packetParser.NotRunning Then
		    Me.client.packetParser.Run()
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  
		  Dim message As String
		  
		  If Me.client = Nil Or Me.client.state = Nil Or Me.client.state.versionAndKeyPassed = False Then
		    message = "BNLS: Socket error #" + Format(Me.LastErrorCode, "-#") + "!"
		  Else
		    message = "BNLS: Socket error #" + Format(Me.LastErrorCode, "-#") + ", service no longer required."
		  End If
		  
		  MessengerThread.Messenger.Messages.Insert( 0, New InternalMessage( Me.client, InternalMessage.FlagError + InternalMessage.FlagNetwork, message ))
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
