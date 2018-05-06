#tag Class
Protected Class BNETClient
	#tag Method, Flags = &h0
		Sub AddChat(timestamp As Boolean, ParamArray values As Variant)
		  
		  Dim js As String = "", c As Color = App.config.colors.DefaultTextColor
		  
		  js = js + "var scrollAfterInsert = (window.innerHeight + window.scrollY >= document.body.offsetHeight);"
		  js = js + "var body = document.getElementsByTagName('body')[0];"
		  js = js + "var line = document.createElement('div');"
		  
		  If timestamp = True And Me.config.timestampMode <> 0 Then
		    
		    Dim oTimestamp As New Date()
		    Dim sTimestamp As String = "["
		    
		    If BitAnd( Me.config.timestampMode, Configuration.TimestampModeShortDate ) > 0 Then
		      sTimestamp = sTimestamp + oTimestamp.ShortDate + " "
		    End If
		    
		    If BitAnd( Me.config.timestampMode, Configuration.TimestampModeAbbrDate ) > 0 Then
		      sTimestamp = sTimestamp + oTimestamp.AbbreviatedDate + " "
		    End If
		    
		    If BitAnd( Me.config.timestampMode, Configuration.TimestampModeLongDate ) > 0 Then
		      sTimestamp = sTimestamp + oTimestamp.LongDate + " "
		    End If
		    
		    If BitAnd( Me.config.timestampMode, Configuration.TimestampModeShortTime ) > 0 Then
		      If BitAnd( Me.config.timestampMode, Configuration.TimestampModeMilitaryTime ) > 0 Then
		        sTimestamp = sTimestamp + Right( "0" + Format( oTimestamp.Hour, "-#" ), 2 ) + ":" _
		        + Right( "0" + Format( oTimestamp.Minute, "-#" ), 2 ) + " "
		      Else
		        sTimestamp = sTimestamp + oTimestamp.ShortTime + " "
		      End If
		    End If
		    
		    If BitAnd( Me.config.timestampMode, Configuration.TimestampModeLongTime ) > 0 Then
		      If BitAnd( Me.config.timestampMode, Configuration.TimestampModeMilitaryTime ) > 0 Then
		        sTimestamp = sTimestamp + Right( "0" + Format( oTimestamp.Hour, "-#" ), 2 ) + ":" _
		        + Right( "0" + Format( oTimestamp.Minute, "-#" ), 2 ) + ":" _
		        + Right( "0" + Format( oTimestamp.Second, "-#" ), 2 ) + " "
		      Else
		        sTimestamp = sTimestamp + oTimestamp.LongTime + " "
		      End If
		    End If
		    
		    If Right( sTimestamp, 1 ) = " " Then
		      sTimestamp = Left( sTimestamp, Len( sTimestamp ) - 1 )
		    End If
		    
		    sTimestamp = sTimestamp + "] "
		    
		    js = js + "var chat = document.createElement('span');"
		    js = js + "chat.style.color = 'rgb(" _
		    + Format( App.config.colors.ChatTimestamp.Red, "-#") + "," _
		    + Format( App.config.colors.ChatTimestamp.Green, "-#") + "," _
		    + Format( App.config.colors.ChatTimestamp.Blue, "-#") + ")';"
		    
		    js = js + "chat.innerText = " + StringToJSON( sTimestamp ) + ";"
		    js = js + "line.appendChild(chat);"
		    
		  End If
		  
		  Dim p As Pair
		  For Each value As Variant In values
		    If value.Type = Variant.TypeColor Then
		      c = value.ColorValue
		    ElseIf value.Type = Variant.TypeString Then
		      js = js + "var chat = document.createElement('span');"
		      js = js + "chat.style.color = 'rgb(" _
		      + Format(c.Red, "-#") + "," _
		      + Format(c.Green, "-#") + "," _
		      + Format(c.Blue, "-#") + ")';"
		      js = js + "chat.innerText = " + StringToJSON(value.StringValue) + ";"
		      js = js + "chat.innerHTML = urlify(chat.innerHTML);"
		      js = js + "line.appendChild(chat);"
		    ElseIf value.Type = Variant.TypeObject And value.ObjectValue IsA Pair Then
		      p = Pair(value.ObjectValue)
		      Select Case p.Left
		      Case "HTML"
		        js = js + "var chat = document.createElement('span');"
		        js = js + "chat.style.color = 'rgb(" _
		        + Format(c.Red, "-#") + "," _
		        + Format(c.Green, "-#") + "," _
		        + Format(c.Blue, "-#") + ")';"
		        js = js + "chat.innerHTML = " + StringToJSON(p.Right) + ";"
		        js = js + "line.appendChild(chat);"
		      Case "Monospace"
		        js = js + "var chat = document.createElement('span');"
		        js = js + "chat.style.color = 'rgb(" _
		        + Format(c.Red, "-#") + "," _
		        + Format(c.Green, "-#") + "," _
		        + Format(c.Blue, "-#") + ")';"
		        js = js + "chat.innerText = " + StringToJSON(p.Right) + ";"
		        js = js + "chat.style['font-family'] = 'monospace';"
		        js = js + "chat.innerHTML = urlify(chat.innerHTML);"
		        js = js + "line.appendChild(chat);"
		      Case Else
		        Dim e As New RuntimeException()
		        e.Message = "Unknown string pattern"
		        Raise e
		      End Select
		    End If
		  Next
		  
		  js = js + "body.appendChild(line);"
		  
		  Me.chatOutput = Me.chatOutput + js
		  
		  If Me.chatWindow = Nil Then Return
		  If Me.chatWindow.ChatContainerList.ListIndex = -1 Then Return
		  If Me.chatWindow.ChatContainerList.RowTag( Me.chatWindow.ChatContainerList.ListIndex ) <> Me Then Return
		  
		  js = js + "if (scrollAfterInsert) chat.scrollIntoView({block:""end"",behavior:""auto""});"
		  
		  Me.chatWindow.ChatOutput.ExecuteJavaScript( js )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect()
		  
		  Me.socBNLS.Disconnect()
		  Me.socBNET.Disconnect()
		  
		  Me.socBNLS.Address = Me.config.bnlsHost
		  Me.socBNLS.Port    = Me.config.bnlsPort
		  
		  Me.socBNET.Address = Me.config.bnetHost
		  Me.socBNET.Port    = Me.config.bnetPort
		  
		  MessengerThread.Messenger.Messages.Insert( 0, New InternalMessage( Me, _
		  InternalMessage.FlagInfo + InternalMessage.FlagNetwork, _
		  "BNLS: Connecting to " + Me.socBNLS.Address + ":" + Format( Me.socBNLS.Port, "-#" ) + "..." ))
		  
		  Me.socBNLS.Connect()
		  
		  MessengerThread.Messenger.Messages.Insert( 0, New InternalMessage( Me, _
		  InternalMessage.FlagInfo + InternalMessage.FlagNetwork, _
		  "BNET: Connecting to " + Me.socBNET.Address + ":" + Format( Me.socBNET.Port, "-#" ) + "..." ))
		  
		  Me.socBNET.Connect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.chatOutput   = ""
		  Me.chatParser   = New ChatParseThread()
		  Me.chatWindow   = Nil
		  Me.config       = New Configuration()
		  Me.packetParser = New PacketParseThread()
		  Me.socBNET      = New BNETSocket()
		  Me.socBNLS      = New BNLSSocket()
		  Me.state        = Nil
		  
		  Me.chatParser.client   = Me
		  Me.packetParser.client = Me
		  
		  Me.socBNET.client = Me
		  Me.socBNLS.client = Me
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  Me.chatParser.Kill()
		  Me.chatParser = Nil
		  
		  If Me.chatWindow <> Nil Then
		    Me.chatWindow.RemoveClient( Me )
		  End If
		  
		  Me.socBNET.Disconnect()
		  Me.socBNET = Nil
		  
		  Me.socBNLS.Disconnect()
		  Me.socBNLS = Nil
		  
		  Me.packetParser.Kill()
		  Me.packetParser = Nil
		  
		  Me.config = Nil
		  
		  Me.state = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		  MessengerThread.Messenger.Messages.Insert( 0, New InternalMessage( Me, _
		  InternalMessage.FlagInfo + InternalMessage.FlagNetwork, _
		  "BNET: Disconnecting..." ))
		  
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

	#tag Method, Flags = &h0
		 Shared Function StringToJSON(value As String) As String
		  
		  Dim i, a, valueLen As Integer, c, json As String
		  
		  i = 1
		  valueLen = Len(value)
		  
		  While i <= valueLen
		    c = Mid(value, i, 1)
		    a = Asc(c)
		    If a = 9 Then
		      json = json + "\t"
		    ElseIf a = 10 Then
		      json = json + "\n"
		    ElseIf a = 13 Then
		      json = json + "\r"
		    ElseIf a >= 0 And a <= 31 Then
		      json = json + "\u" + Lowercase(Right("0000" + Hex(a), 4))
		    ElseIf a = 34 Then
		      json = json + "\"""
		    ElseIf a = 92 Then
		      json = json + "\\"
		    Else
		      json = json + c
		    End If
		    i = i + 1
		  Wend
		  
		  Return """" + json + """"
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		acl() As UserAccess
	#tag EndProperty

	#tag Property, Flags = &h0
		chatOutput As String
	#tag EndProperty

	#tag Property, Flags = &h0
		chatParser As ChatParseThread
	#tag EndProperty

	#tag Property, Flags = &h0
		chatWindow As ChatWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		config As Configuration
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
			Name="chatOutput"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
