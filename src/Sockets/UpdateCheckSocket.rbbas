#tag Class
Protected Class UpdateCheckSocket
Inherits HTTPSecureSocket
	#tag Event
		Sub Error(code as integer)
		  
		  If Me.LoadWindow = Nil Then Return
		  
		  Me.LoadWindow.SetProgress("Update check failure", "Socket Error #" + Format(code, "-#"), 1, 1)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  
		  #pragma Unused url
		  
		  If Me.LoadWindow = Nil Then Return
		  
		  Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Processing query result...", 1, 2)
		  
		  Dim i As Integer = headers.Count() - 1
		  While i >= 0
		    If headers.Name(i) = "Location" Then
		      Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Redirecting...", 0, 0)
		      Me.SendRequest("GET", headers.Value(i))
		      Return
		    End If
		    i = i - 1
		  Wend
		  
		  If httpStatus <> 200 Then
		    Me.LoadWindow.SetProgress("Update check failure", "HTTP " + Format(httpStatus, "-#"), 2, 2)
		    Return
		  End If
		  
		  Dim contentType As String = ""
		  i = headers.Count() - 1
		  While i >= 0
		    If headers.Name(i) = "Content-Type" Then
		      contentType = headers.Value(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		  contentType = Trim(NthField(Trim(contentType), ";", 1)) // Remove whitespace, charset, etc.
		  
		  If Not (contentType = "application/json" Or contentType = "text/json") Then
		    Me.LoadWindow.SetProgress("Update check failure", "Unknown format: " + contentType, 2, 2)
		    Return
		  End If
		  
		  Dim jsonRoot, jsonResult, jsonStatus, jsonUpdate As JSONItem
		  
		  Try
		    jsonRoot   = New JSONItem(content)
		    jsonResult = jsonRoot.Lookup("result", Nil)
		    jsonStatus = jsonResult.Lookup("status", Nil)
		    jsonUpdate = jsonResult.Lookup("update", Nil)
		    
		    If jsonUpdate = Nil Then
		      Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Software is up to date", 2, 2)
		      Return
		    End If
		    
		    Dim swUrl   As Variant = jsonUpdate.Lookup("url", Nil)
		    Dim version As Variant = jsonUpdate.Lookup("version", Nil)
		    
		    Me.LoadWindow.Hide()
		    
		    If MsgBox("A software update is available, do you want to download it?" + EndOfLine + EndOfLine + _
		      App.ProjectName() + " v" + App.VersionString() + " will be updated to v" + version.StringValue, _
		      36, "Software Update") = 6 Then
		      REALbasic.ShowURL(swUrl.StringValue)
		      Me.UserChoseToUpdate = True
		    End If
		    
		  Catch error As JSONException
		    Me.LoadWindow.SetProgress("Update check failure", "JSONException", 2, 2)
		    
		  Catch error As NilObjectException
		    Me.LoadWindow.SetProgress("Update check failure", "NilObjectException", 2, 2)
		    
		  Catch error As TypeMismatchException
		    Me.LoadWindow.SetProgress("Update check failure", "TypeMismatchException", 2, 2)
		    
		  End Try
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  
		  Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Please Wait...", bytesReceived, totalBytes)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SendProgress(BytesSent As Integer, BytesLeft As Integer) As Boolean
		  
		  Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Please Wait...", BytesSent, BytesSent + BytesLeft)
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Check()
		  
		  Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Setting up...", 0, 0)
		  If Not Me.LoadWindow.Visible Then Me.LoadWindow.Show()
		  
		  Me.SetRequestHeader("User-Agent", App.ProjectName() + "/" + App.VersionString())
		  
		  Dim query As New Dictionary()
		  query.Value("product") = App.ProjectName()
		  query.Value("version") = App.VersionString()
		  
		  Me.LoadWindow.SetProgress(UpdateCheckSocket.ProgressTitle, "Please Wait...", 0, 0)
		  Me.SendRequest("GET", UpdateCheckSocket.UpdateUrl + "?" + Me.EncodeFormData(query))
		  
		  Me.LoadWindow.ShowModal()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(LoadWindow As LoadingWindow)
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From HTTPSecureSocket
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor()
		  
		  Me.ConnectionType    = HTTPSecureSocket.TLSv1
		  Me.LoadWindow        = LoadWindow
		  Me.Secure            = True
		  Me.UserChoseToUpdate = False
		  Me.Yield             = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected LoadWindow As LoadingWindow
	#tag EndProperty

	#tag Property, Flags = &h0
		UserChoseToUpdate As Boolean
	#tag EndProperty


	#tag Constant, Name = ProgressTitle, Type = String, Dynamic = False, Default = \"Checking for updates...", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UpdateUrl, Type = String, Dynamic = False, Default = \"https://api.carlbennett.me/software/update", Scope = Public
	#tag EndConstant


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
