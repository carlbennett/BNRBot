#tag Class
Protected Class WebViewer
Inherits HTMLViewer
	#tag Event
		Function CancelLoad(URL as String) As Boolean
		  
		  Select Case URL
		  Case "about:blank"
		    
		    Return False
		    
		  Case "chrome://settings"
		    
		    ConfigWindow.ShowWithin(Me.Window)
		    Return True
		    
		  Case Else
		    
		    REALbasic.ShowURL(URL)
		    Return True
		    
		  End Select
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DocumentComplete(URL as String)
		  
		  If URL <> "about:blank" Then
		    Call MsgBox("Something happened that caused us to lose control of the chat box.", 48, "Control Loss")
		    Return
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
		  
		  If Config = Nil Then
		    
		    source = source + "<header class=""main-page"">BNRBot</header><main>"
		    
		    source = source + "<article><header>Getting Started</header><section><p>" _
		    + "Right click the list on the left and choose &quot;Configure&quot;, or <a href=""" _
		    + "chrome://settings"">click here</a>.</p></section></article>"
		    
		    If Settings.FileCheckBNCSUtilDLL = False Or _
		      Settings.FileCheckCheckRevisionDLL = False Or _
		      Settings.FileCheckLockdownDLLs = False Or _
		      Settings.FileCheckVerIX86DLLs = False Then
		      
		      source = source + "<article><header class=""red"">Integrity Check Failed</header><section class=""red"">" _
		      + "<p>Some required files are missing from the bot. Please locate:</p><p><ul>"
		      
		      If Settings.FileCheckBNCSUtilDLL = False Then source = source + "<li>BNCSUtil.dll</li>"
		      If Settings.FileCheckCheckRevisionDLL = False Then source = source + "<li>CheckRevision.dll</li>"
		      If Settings.FileCheckLockdownDLLs = False Then source = source + "<li>lockdown-IX86-##.dll (one or more are missing)</li>"
		      If Settings.FileCheckVerIX86DLLs = False Then source = source + "<li>ver-IX86-#.dll (one or more are missing)</li>"
		      
		      source = source + "</ul></p></section></article>"
		      
		    End If
		    
		    source = source + "</main>"
		    
		  End If
		  
		  source = source + "</body></html>" + EndOfLine.UNIX
		  
		  Me.ExecuteJavaScript("document.write(" + StringToJSON(source) + ");")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.LoadURL("about:blank")
		  
		  Open()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function GetInternalCSS() As String
		  
		  Dim source As String = ""
		  
		  If Me.Config <> Nil Then
		    
		    source = source + "body{background:#000;color:#fff;margin:2px 4px 12px 4px;padding:0px;"
		    source = source + "font-family:Arial;"
		    source = source + "font-size:12px;"
		    source = source + "font-weight:normal;"
		    source = source + "font-style:normal;"
		    source = source + "text-decoration:none;"
		    source = source + "text-indent:-1em;"
		    source = source + "padding-left:1em;"
		    source = source + "word-wrap:break-word;"
		    source = source + "}"
		    
		    source = source + "span{white-space:pre-wrap;}"
		    
		    source = source + "a{color:#" + Globals.ColorToHex(Colors.UI.ListSelectionColor) + ";text-decoration:none;}"
		    source = source + "a:hover{text-decoration:underline;}"
		    
		  Else
		    
		    source = source + "@font-face{font-family:'Source Sans Pro';font-style:normal;font-weight:400;" _
		    + "src:local('Source Sans Pro'),local('SourceSansPro-Regular')," _
		    + "url('https://bnetdocs.org/a/font/SourceSansPro-Regular-201508251844.ttf') " _
		    + "format('truetype');unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02C6,U+02DA," _
		    + "U+02DC,U+2000-206F,U+2074,U+20AC,U+2212,U+2215,U+E0FF,U+EFFD,U+F000;}"
		    
		    source = source + "@font-face{font-family:'Source Code Pro';font-style:normal;font-weight:400;" _
		    + "src:local('Source Code Pro'),local('SourceCodePro-Regular')," _
		    + "url('https://bnetdocs.org/a/font/SourceCodePro-Regular-201508251844.ttf') " _
		    + "format('truetype');unicode-range:U+0000-00FF,U+0131,U+0152-0153,U+02C6,U+02DA," _
		    + "U+02DC,U+2000-206F,U+2074,U+20AC,U+2212,U+2215,U+E0FF,U+EFFD,U+F000;}"
		    
		    source = source + "body{background:#272727 url(""https://bnetdocs.org/a/main_bg.png"") repeat fixed center;" _
		    + "color:#ddd;font:11pt source sans pro,verdana,arial,sans-serif;margin:44px 0px;padding:0px;}"
		    
		    source = source + "a,a:focus{outline:none;}"
		    source = source + "a:hover{text-decoration:underline;}"
		    source = source + "a:link{color:#00c0ff;text-decoration:none;}"
		    source = source + "a:visited{color:#00c0ff;}"
		    
		    source = source + "header.main-page{background-color:rgba(64,64,64,0.8);" _
		    + "-moz-box-sizing:border-box;box-sizing:border-box;" _
		    + "cursor:default;color:rgba(0,222,180,0.9);" _
		    + "font:20pt source sans pro,verdana,arial,sans-serif;" _
		    + "left:0px;line-height:28px;padding:8px 12px;position:fixed;" _
		    + "right:0px;top:0px;-webkit-touch-callout:none;-webkit-user-select:none;" _
		    + "user-select:none;}"
		    
		    source = source + "main{margin:0px;overflow:hidden;width:100%;}"
		    source = source + "main>article{margin:0px;overflow:hidden;padding-top:10px;width:100%;}"
		    source = source + "main>article>header{background-color:rgba(64,64,64,0.6);display:block;" _
		    + "font:14pt source sans pro;line-height:14pt;padding:10px;}"
		    source = source + "main>article>header.no-select{cursor:default;-webkit-touch-callout:none;" _
		    + "-webkit-user-select:none;user-select:none;}"
		    source = source + "main>article header.green{background-color:rgba(64,128,64,0.6);}"
		    source = source + "main>article header.red{background-color:rgba(128,64,64,0.6);}"
		    source = source + "main>article section{background-color:rgba(64,64,64,0.4);padding:10px;}"
		    source = source + "main>article section.green{background-color:rgba(64,128,64,0.4);}"
		    source = source + "main>article section.red{background-color:rgba(128,64,64,0.4);}"
		    source = source + "main>article section.fixed-width-text{font-family:source code pro,courier new,monospace;" _
		    + "font-size:85%;white-space:pre-wrap;}"
		    source = source + "main>article section>p:first-of-type{margin-top:0px;}"
		    source = source + "main>article section>p:last-of-type{margin-bottom:0px;}"
		    source = source + "main>article section img{max-width:100%;}"
		    
		  End If
		  
		  Return source
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		Config As Configuration
	#tag EndProperty


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
