#tag Class
Protected Class StyledChat
Inherits HTMLViewer
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  
		  If CancelLoad( URL ) = True Then Return True
		  
		  If URL = "about:blank" Then Return False
		  
		  // Styled chats don't navigate away.
		  // Open the url in their browser instead.
		  
		  REALbasic.ShowURL(URL)
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DocumentBegin(URL as String)
		  
		  If DocumentBegin( URL ) Then Return
		  
		  If URL <> "about:blank" Then
		    Dim err As New BotException( "Something happened that caused us to lose control of the chat box." )
		    Raise err
		  End If
		  
		  Dim source As String = ""
		  
		  source = source + "<!DOCTYPE html>" + EndOfLine.UNIX
		  
		  source = source + "<html><head>" + EndOfLine.UNIX
		  source = source + "<meta http-equiv=""Content-Type"" content=""text/html;charset=utf-8""/>" + EndOfLine.UNIX
		  source = source + "<style type=""text/css"">"
		  source = source + Me.GetInternalCSS() + EndOfLine.UNIX
		  source = source + "</style>" + EndOfLine.UNIX
		  
		  source = source + "<script type=""text/javascript"">" + EndOfLine.UNIX
		  source = source + "function urlify(text) {" + EndOfLine.UNIX
		  source = source + "  var urlRegex = /(https?:\/\/[^\s]+)/g;" + EndOfLine.UNIX
		  source = source + "  return text.replace(urlRegex, function(url) {" + EndOfLine.UNIX
		  source = source + "    return '<a href=""' + url + '"">' + url + '</a>';" + EndOfLine.UNIX
		  source = source + "  })" + EndOfLine.UNIX
		  source = source + "  // or alternatively" + EndOfLine.UNIX
		  source = source + "  // return text.replace(urlRegex, '<a href=""$1"">$1</a>')" + EndOfLine.UNIX
		  source = source + "};" + EndOfLine.UNIX
		  source = source + "</script>" + EndOfLine.UNIX
		  
		  source = source + "</head><body>" + EndOfLine.UNIX
		  
		  source = source + "</body></html>" + EndOfLine.UNIX
		  
		  Me.ExecuteJavaScript( "document.write(" + BNETClient.StringToJSON( source ) + ");" )
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.LoadURL( "about:blank" )
		  
		  Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GetInternalCSS() As String
		  
		  Dim source As String = ""
		  
		  source = source + "body{background:#" + App.config.colors.ChatBackColor.Hex() + ";"
		  source = source + "color:#" + App.config.colors.DefaultTextColor.Hex() + ";"
		  source = source + "margin:2px 4px 12px 4px;padding:0px 1em 0px 0px;"
		  source = source + "font-family:Arial;"
		  source = source + "font-size:12px;"
		  source = source + "font-weight:normal;"
		  source = source + "font-style:normal;"
		  source = source + "text-decoration:none;"
		  source = source + "text-indent:-1em;"
		  source = source + "word-wrap:break-word;"
		  source = source + "}"
		  
		  source = source + "span{white-space:pre-wrap;}"
		  
		  source = source + "a{color:#" + App.config.colors.DefaultHighlightBackColor.Hex() + ";text-decoration:none;}"
		  source = source + "a:hover{text-decoration:underline;}"
		  
		  Return source
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CancelLoad(URL As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DocumentBegin(URL As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Renderer"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="HTMLViewer"
			#tag EnumValues
				"0 - Native"
				"1 - WebKit"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="200"
			Type="Integer"
			InheritedFrom="HTMLViewer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
