#tag Window
Begin Window wUpdater
   BackColor       =   "#Colors.White"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   96
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   100
   MaximizeButton  =   False
   MaxWidth        =   400
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   100
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   3
   Resizeable      =   False
   Title           =   "BNRBot Update Check"
   Visible         =   True
   Width           =   4.0e+2
   Begin Label uiStatus
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "%status%"
      TextAlign       =   0
      TextColor       =   "#Colors.Black"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   372
   End
   Begin ProgressBar uiProgress
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   38
      Value           =   0
      Visible         =   True
      Width           =   372
   End
   Begin PushButton uiCurrentAction
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "%action%"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   306
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   58
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label uiSubstatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   14
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "%substatus%"
      TextAlign       =   0
      TextColor       =   "#Colors.Black"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   58
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   288
   End
   Begin HTTPSecureSocket HTTP
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   3
      Height          =   32
      Index           =   -2147483648
      Left            =   368
      LockedInPosition=   False
      Scope           =   0
      Secure          =   True
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin Timer TransitionTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   336
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin PushButton uiCancelAction
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   306
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   32
      Underline       =   ""
      Visible         =   False
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  TransitionTimer.Enabled = False
		  HTTP.Close()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  HTTP.ConnectionType = HTTP.TLSv1
		  HTTP.Yield = True
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetHeaderValue(headers As InternetHeaders, key As String) As String
		  
		  If headers = Nil Then Return ""
		  
		  Dim i As Integer = headers.Count() - 1
		  While i >= 0
		    If headers.Name(i) = key Then Return headers.Value(i)
		    i = i - 1
		  Wend
		  
		  Return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitiateRequest(newUrl As String = "")
		  
		  Dim url As String = newUrl
		  If Len(url) = 0 Then
		    
		    url = "https://api.carlbennett.me/software/update"
		    
		    Dim vars As New Dictionary()
		    vars.Value("product") = "BNRBot"
		    vars.Value("version") = _
		    Str(App.MajorVersion) + "." + _
		    Str(App.MinorVersion) + "." + _
		    Str(App.BugVersion) + "." + _
		    Str(App.NonReleaseVersion)
		    
		    HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString())
		    HTTP.Get(url + "?" + HTTP.EncodeFormData(vars))
		    
		  Else
		    
		    HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString())
		    HTTP.requestHeaders.SetHeader("Referer", Self.lastUrl)
		    HTTP.Get(url)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseResponse(content As String)
		  
		  Const UPDATE_STATUS_BAD_REQUEST = 0
		  Const UPDATE_STATUS_PRODUCT_UNKNOWN = 1
		  Const UPDATE_STATUS_PRODUCT_DEPRECATED = 2
		  Const UPDATE_STATUS_VERSION_UNKNOWN = 3
		  Const UPDATE_STATUS_VERSION_OLD = 4
		  Const UPDATE_STATUS_VERSION_CURRENT = 5
		  
		  Try
		    Dim json As JSONItem = New JSONItem(content)
		    Dim result As JSONItem = json.Lookup("result", Nil)
		    Dim status As JSONItem = result.Lookup("status", Nil)
		    Dim update As JSONItem = result.Lookup("update", Nil)
		    
		    Dim status_code As Integer = status.Lookup("code", -1)
		    // Unused: Dim status_message As String = status.Lookup("message", "")
		    
		    Select Case status_code
		    Case UPDATE_STATUS_BAD_REQUEST
		      Self.StepTransition(Self.STEP_UPDATE_FAILURE, "The update server cannot handle our request.")
		    Case UPDATE_STATUS_PRODUCT_UNKNOWN
		      Self.StepTransition(Self.STEP_UPDATE_FAILURE, "The update server does not recognize our application id.")
		    Case UPDATE_STATUS_PRODUCT_DEPRECATED
		      Self.StepTransition(Self.STEP_UPDATE_FAILURE, "Our version has been deprecated and " _
		      + "it is recommended to discontinue use.")
		    Case UPDATE_STATUS_VERSION_UNKNOWN
		      Self.StepTransition(Self.STEP_UPDATE_FAILURE, "The update server does not recognize our version.")
		    Case UPDATE_STATUS_VERSION_OLD
		      Self.updateUrl = update.Lookup("url", "")
		      Self.StepTransition(Self.STEP_UPDATE_AVAILABLE)
		    Case UPDATE_STATUS_VERSION_CURRENT
		      Self.StepTransition(Self.STEP_UPDATE_LATEST)
		    Case Else
		      Self.StepTransition(Self.STEP_UPDATE_FAILURE, "Unknown status code received from the update server.")
		    End Select
		    
		  Catch err
		    
		    Self.StepTransition(Self.STEP_HTTP_FAILURE, "Invalid JSON content received from the update server.")
		    
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepTransition(stepId As Integer, errorDetail As String = "")
		  
		  Select Case stepId
		  Case Self.STEP_CHECK
		    
		    uiStatus.Text = "Checking for updates..."
		    uiSubstatus.Text = "(User initiated)"
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "Cancel"
		    Self.stateAuto = False
		    
		    TransitionTimer.Mode = TransitionTimer.ModeSingle
		    TransitionTimer.Period = 250
		    TransitionTimer.Enabled = True
		    
		  Case Self.STEP_CHECK_AUTO
		    
		    uiStatus.Text = "Checking for updates..."
		    uiSubstatus.Text = "(Automatically initiated)"
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "Cancel"
		    Self.stateAuto = True
		    
		    TransitionTimer.Mode = TransitionTimer.ModeSingle
		    TransitionTimer.Period = 250
		    TransitionTimer.Enabled = True
		    
		  Case Self.STEP_HTTP_SENDING
		    
		    uiStatus.Text = "Checking for updates..."
		    uiSubstatus.Text = "Sending request..."
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "Cancel"
		    
		  Case Self.STEP_HTTP_RECEIVING
		    
		    uiStatus.Text = "Checking for updates..."
		    uiSubstatus.Text = "Receiving response..."
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "Cancel"
		    
		  Case Self.STEP_HTTP_FAILURE
		    
		    Dim err As String = errorDetail
		    If Len(err) > 0 Then err = EndOfLine + EndOfLine + err
		    
		    Self.Hide()
		    #If DebugBuild = True Then Break
		    Call MsgBox("An error occurred while checking for updates." + err, 48, Self.Title)
		    Self.Close()
		    
		  Case Self.STEP_UPDATE_FAILURE
		    
		    Dim err As String = errorDetail
		    If Len(err) > 0 Then err = EndOfLine + EndOfLine + err
		    
		    Self.Hide()
		    #If DebugBuild = True Then Break
		    Call MsgBox("An error occurred while checking for updates." + err, 48, Self.Title)
		    Self.Close()
		    
		  Case Self.STEP_UPDATE_AVAILABLE
		    
		    uiCurrentAction.Caption = "Continue"
		    uiStatus.Text = "Update found!"
		    uiSubstatus.Text = "Click " + uiCurrentAction.Caption + " to download in your web browser."
		    uiProgress.Visible = False
		    uiCancelAction.Visible = True
		    
		  Case Self.STEP_UPDATE_LATEST
		    
		    If Self.stateAuto = False Then
		      Self.Hide()
		      Call MsgBox("You are running the latest version of BNRBot.", 64, Self.Title)
		    End If
		    Self.Close()
		    
		  Case Else
		    
		    Dim err As New RuntimeException()
		    err.Message = "Unknown step id given in update check"
		    Raise err
		    
		  End Select
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected lastUrl As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected stateAuto As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected updateUrl As String
	#tag EndProperty


	#tag Constant, Name = STEP_CHECK, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_CHECK_AUTO, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_HTTP_FAILURE, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_HTTP_RECEIVING, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_HTTP_SENDING, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_UPDATE_AVAILABLE, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_UPDATE_FAILURE, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STEP_UPDATE_LATEST, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events uiCurrentAction
	#tag Event
		Sub Action()
		  
		  Select Case Replace(Me.Caption, "&", "")
		  Case "Cancel"
		    
		    Self.Close()
		    
		  Case "Continue"
		    
		    ShowURL(Self.updateUrl)
		    Self.Close()
		    
		  Case Else
		    
		    Dim err As New RuntimeException()
		    err.Message = "Unknown action in update check"
		    Raise err
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTP
	#tag Event
		Function SendProgress(BytesSent As Integer, BytesLeft As Integer) As Boolean
		  
		  #pragma Unused BytesSent
		  #pragma Unused BytesLeft
		  
		  Self.StepTransition(Self.STEP_HTTP_SENDING)
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub ReceiveProgress(bytesReceived as integer, totalBytes as integer, newData as string)
		  
		  #pragma Unused bytesReceived
		  #pragma Unused totalBytes
		  #pragma Unused newData
		  
		  Self.StepTransition(Self.STEP_HTTP_RECEIVING)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  
		  #pragma Unused code
		  
		  Self.StepTransition(Self.STEP_HTTP_FAILURE)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  
		  #pragma Unused Realm
		  #pragma Unused Headers
		  #pragma Unused Name
		  #pragma Unused Password
		  
		  // HTTP authentication shouldn't be required to update
		  
		  Self.StepTransition(Self.STEP_HTTP_FAILURE, "HTTP authentication was requested but is unsupported.")
		  
		  Return False
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ProxyAuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  
		  #pragma Unused Realm
		  #pragma Unused Headers
		  #pragma Unused Name
		  #pragma Unused Password
		  
		  // HTTP authentication shouldn't be required to update
		  
		  Self.StepTransition(Self.STEP_HTTP_FAILURE, "HTTP authentication was requested but is unsupported.")
		  
		  Return False
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  
		  Select Case httpStatus
		  Case 200 // OK
		    
		    If InStr(Self.GetHeaderValue(headers, "Content-Type"), "json") = 0 Then
		      Self.StepTransition(Self.STEP_HTTP_FAILURE)
		      Return
		    End If
		    
		    Self.ParseResponse(content)
		    
		  Case 301, 302, 303, 307 // Redirect
		    
		    Self.lastUrl = url
		    Self.InitiateRequest(Self.GetHeaderValue(headers, "Location"))
		    
		  Case Else
		    
		    Self.StepTransition(Self.STEP_HTTP_FAILURE)
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TransitionTimer
	#tag Event
		Sub Action()
		  
		  Self.InitiateRequest()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events uiCancelAction
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
