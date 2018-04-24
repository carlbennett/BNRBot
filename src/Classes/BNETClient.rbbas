#tag Class
Protected Class BNETClient
	#tag Method, Flags = &h0
		Sub Connect()
		  
		  Me.socBNLS.Disconnect()
		  Me.socBNET.Disconnect()
		  
		  Me.socBNLS.Address = Me.config.bnlsHost
		  Me.socBNLS.Port    = Me.config.bnlsPort
		  
		  Me.socBNET.Address = Me.config.bnetHost
		  Me.socBNET.Port    = Me.config.bnetPort
		  
		  GUIUpdateEvent.InternalMessage("BNLS: Connecting to " + _
		  Me.socBNLS.Address + ":" + Format(Me.socBNLS.Port, "-#") + _
		  "...", BitOr(ChatMessage.InternalFlagInfo, ChatMessage.InternalFlagNetwork), Me)
		  
		  Me.socBNLS.Connect()
		  
		  GUIUpdateEvent.InternalMessage("BNET: Connecting to " + _
		  Me.socBNET.Address + ":" + Format(Me.socBNET.Port, "-#") + _
		  "...", BitOr(ChatMessage.InternalFlagInfo, ChatMessage.InternalFlagNetwork), Me)
		  
		  Me.socBNET.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.chatParser   = New ChatParseThread()
		  Me.config       = New Configuration()
		  Me.gui          = New ChatContainer()
		  Me.packetParser = New PacketParseThread()
		  Me.socBNET      = New BNETSocket()
		  Me.socBNLS      = New BNLSSocket()
		  Me.state        = Nil
		  
		  Me.chatParser.client   = Me
		  Me.packetParser.client = Me
		  
		  Me.gui.client = Me
		  
		  Me.socBNET.client = Me
		  Me.socBNLS.client = Me
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  Me.chatParser.Kill()
		  Me.chatParser = Nil
		  
		  Me.config = Nil
		  
		  Me.gui.Close()
		  Me.gui = Nil
		  
		  Me.packetParser.Kill()
		  Me.packetParser = Nil
		  
		  Me.socBNET.Disconnect()
		  Me.socBNET = Nil
		  
		  Me.socBNLS.Disconnect()
		  Me.socBNLS = Nil
		  
		  Me.state = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		  GUIUpdateEvent.InternalMessage( "BNET: Disconnecting...", BitOr( ChatMessage.InternalFlagInfo, ChatMessage.InternalFlagNetwork ), Me )
		  
		  Me.socBNLS.Disconnect()
		  Me.socBNET.Disconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAcl(onlineName As String) As UserAccess
		  
		  Dim accountNameRealm   As String = Battlenet.onlineNameToAccountName(onlineName, Me.state.product, True, "")
		  
		  For Each acl As UserAccess In Me.acl
		    If acl.ignoreRealm = True Then
		      If acl.accountName = Battlenet.onlineNameToAccountName(onlineName, Me.state.product, False, acl.supplementalRealms) Then
		        Return acl
		      End If
		    Else
		      If acl.accountName = accountNameRealm Then
		        Return acl
		      End If
		    End If
		  Next
		  
		  Return Nil
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		acl() As UserAccess
	#tag EndProperty

	#tag Property, Flags = &h0
		chatParser As ChatParseThread
	#tag EndProperty

	#tag Property, Flags = &h0
		config As Configuration
	#tag EndProperty

	#tag Property, Flags = &h0
		gui As ChatContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		packetParser As PacketParseThread
	#tag EndProperty

	#tag Property, Flags = &h0
		socBNET As BNETSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		socBNLS As BNLSSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		state As BNETState
	#tag EndProperty


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
