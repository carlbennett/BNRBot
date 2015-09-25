#tag Class
Protected Class BNUDPSocket
Inherits UDPSocket
	#tag Event
		Sub DataAvailable()
		  
		  Dim Pkt As Datagram
		  Dim Buffer As Datagram
		  Dim sTmp As String
		  
		  Dim PktID As UInt32
		  
		  While Me.PacketsAvailable > 0
		    
		    Pkt = Me.Read()
		    Buffer = New Datagram()
		    Buffer.Address = Pkt.Address
		    Buffer.Port = Pkt.Port
		    sTmp = Buffer.Data
		    
		    If Me.BNET = Nil Then Continue While
		    PktID = MemClass.ReadDWORD(Pkt.Data, 1, True)
		    
		    Select Case PktID
		    Case Packets.PKT_SERVERPING
		      If Me.BNET.IsConnected = True And Me.BNET.WaitingForUDP = True Then
		        Me.BNET.Send(Packets.CreateSID_UDPPINGRESPONSE(MemClass.ReadDWORD(Pkt.Data, 5, True)))
		        Me.BNET.WaitingForUDP = False
		        
		      ElseIf Me.BNET.IsConnected = True And Me.BNET.WaitingForUDP = False Then
		        Me.BNET.UDPCode = MemClass.ReadDWORD(Pkt.Data, 5, True)
		        Me.BNET.UDPCodeSet = True
		        
		      ElseIf Me.BNET.Config <> Nil Then
		        Me.BNET.Config.AddChat(True, Colors.Red, "BNUDP: Received UDP response code too late!" + EndOfLine)
		        
		      End If
		      
		    Case Else
		      If Me.BNET.Config <> Nil Then Me.BNET.Config.AddChat(True, Colors.Red, _
		      MemClass.HexPrefix(PktID, "BNUDP: Unknown packet received. (0x", 2) + ")" + EndOfLine)
		      
		    End Select
		    
		    If LenB(sTmp) > 0 Then Me.Write(Buffer)
		    
		  Wend
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		BNET As BNETSocket
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RouterHops"
			Visible=true
			Group="Behavior"
			InitialValue="32"
			Type="Integer"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendToSelf"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="UDPSocket"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
