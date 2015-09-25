#tag Class
Protected Class CBNETSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  If Me.BNET <> Nil And Me.BNET.Config <> Nil Then _
		  Me.BNET.Config.AddChat(True, Colors.Lime, "CBNET: Connected to " + Me.RemoteAddress + "." + EndOfLine)
		  
		  Me.Initialize()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		  Packets.Receive(Me)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  
		  If Me.BNET <> Nil And Me.BNET.Config <> Nil Then
		    
		    If Me.LastErrorCode = Me.LostConnection Then _
		    Me.BNET.Config.AddChat(True, Colors.Red, "CBNET: Disconnected." + EndOfLine) Else _
		    Me.BNET.Config.AddChat(True, Colors.Red, "CBNET: Disconnected. Socket error #" + Str(Me.LastErrorCode) + "." + EndOfLine)
		    
		  End If
		  
		  If Me.DisconnectAlreadyHandled = False Then Me.DoDisconnect(True)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DoConnect()
		  
		  If Me.IsConnected = True Then Return
		  Me.DoReconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoDisconnect(Errored As Boolean = False)
		  
		  #pragma Unused Errored
		  
		  If Me.IsConnected = True Then
		    
		    If Me.BNET <> Nil And Me.BNET.Config <> Nil Then Me.BNET.Config.AddChat(True, Colors.Cyan, "CBNET: Disconnecting..." + EndOfLine)
		    Me.DisconnectAlreadyHandled = True
		    Me.Disconnect()
		    
		  Else
		    
		    Me.Close()
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoReconnect()
		  
		  If Me.IsConnected = True Then
		    
		    If Me.BNET <> Nil And Me.BNET.Config <> Nil Then Me.BNET.Config.AddChat(True, Colors.Cyan, "CBNET: Reconnecting..." + EndOfLine)
		    Me.Disconnect()
		    
		  End If
		  
		  If Me.BNET <> Nil And Me.BNET.Config <> Nil Then
		    Globals.AssignSocketDetails(Me, "clan-warp.net", 9300)
		    Me.BNET.Config.AddChat(True, Colors.Yellow, "CBNET: Connecting to " + Me.Address + "..." + EndOfLine)
		  End If
		  
		  Me.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize()
		  
		  Me.DataBuffer = ""
		  Me.DisconnectAlreadyHandled = False
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BNET As BNETSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		DataBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		DisconnectAlreadyHandled As Boolean
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
			Name="DataBuffer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisconnectAlreadyHandled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
