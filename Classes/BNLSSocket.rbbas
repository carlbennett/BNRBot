#tag Class
Protected Class BNLSSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  Me.mIsConnecting = False
		  
		  If Me.BNET <> Nil And Me.BNET.Config <> Nil Then _
		  Me.BNET.Config.AddChat(True, Colors.Lime, "BNLS: Connected to " + Me.RemoteAddress + "." + EndOfLine)
		  
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
		  
		  If Me.BNET <> Nil And Me.BNET.Config = Nil Then Return
		  
		  If Me.LastErrorCode = Me.LostConnection Then _
		  Me.BNET.Config.AddChat(True, Colors.Red, "BNLS: Disconnected." + EndOfLine) Else _
		  Me.BNET.Config.AddChat(True, Colors.Red, "BNLS: Disconnected. Socket error #" + Str(Me.LastErrorCode) + "." + EndOfLine)
		  
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
		  
		  Me.mIsConnecting = False
		  
		  If Me.IsConnected = True Then
		    
		    If Me.BNET <> Nil And Me.BNET.Config <> Nil Then Me.BNET.Config.AddChat(True, Colors.Cyan, "Disconnecting..." + EndOfLine)
		    Me.DisconnectAlreadyHandled = True
		    Me.Disconnect()
		    
		  Else
		    
		    Me.Close()
		    
		  End If
		  
		  If Errored = True And Me.BNET <> Nil Then Me.BNET.DoDisconnect(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoReconnect()
		  
		  If Me.IsConnected = True Then
		    
		    If Me.BNET <> Nil And Me.BNET.Config <> Nil Then Me.BNET.Config.AddChat(True, Colors.Cyan, "Reconnecting..." + EndOfLine)
		    Me.Disconnect()
		    
		  End If
		  
		  If Me.BNET <> Nil And Me.BNET.Config <> Nil Then
		    Globals.AssignSocketDetails(Me, Me.BNET.Config.BNLSHost, 9367)
		    Me.BNET.Config.AddChat(True, Colors.Yellow, "BNLS: Connecting to " + Me.Address + "..." + EndOfLine)
		  End If
		  
		  Me.mIsConnecting = True
		  Me.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Initialize()
		  
		  Me.DataBuffer = ""
		  Me.DisconnectAlreadyHandled = False
		  Me.LastNullReceive = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(ParamArray Bytes As Byte)
		  
		  Dim Buffer As String
		  For Each sByte As Byte In Bytes
		    Buffer = Buffer + ChrB(sByte)
		  Next
		  Me.Send(Buffer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(Data As String)
		  
		  If Me.IsConnected = False Then Return
		  Me.Write(Data)
		  If Not (Me.BNET <> Nil And Me.BNET.Config <> Nil And Me.BNET.Config.VerbosePackets = True) Then Return
		  
		  Dim PktID As String = "0x" + Right("00" + Hex(AscB(MidB(Data, 3, 1))), 2)
		  Me.BNET.Config.AddChat(True, Colors.Yellow, "SEND BNLS_" + PktID + " (Bytes: " + Str(LenB(Data)) + ")" + EndOfLine)
		  
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mIsConnecting
			  
			End Get
		#tag EndGetter
		IsConnecting As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LastNullReceive As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIsConnecting As Boolean
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
			InheritedFrom="TCPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsConnecting"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastNullReceive"
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
