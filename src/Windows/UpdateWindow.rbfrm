#tag Window
Begin Window UpdateWindow
   BackColor       =   "#Colors.White"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   170
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   170
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   3
   Resizeable      =   False
   Title           =   "BNRBot Update Check"
   Visible         =   True
   Width           =   400
   Begin Label uiStatus
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
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
      Top             =   16
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   344
   End
   Begin ProgressBar uiProgress
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   40
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   80
      Value           =   0
      Visible         =   True
      Width           =   344
   End
   Begin PushButton uiCurrentAction
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "%action%"
      Default         =   True
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   294
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   130
      Underline       =   ""
      Visible         =   True
      Width           =   90
   End
   Begin Label uiSubstatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
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
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   344
   End
   Begin HTTPSecureSocket HTTP
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   3
      Height          =   32
      Index           =   -2147483648
      Left            =   214
      LockedInPosition=   False
      Scope           =   0
      Secure          =   True
      TabPanelIndex   =   0
      Top             =   -28
      Width           =   32
   End
   Begin Timer TransitionTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   183
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   -28
      Width           =   32
   End
   Begin PushButton uiCancelAction
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "&Cancel"
      Default         =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   192
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   130
      Underline       =   ""
      Visible         =   False
      Width           =   90
   End
   Begin ProgressWheel uiProgressWheel
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   16
      Visible         =   True
      Width           =   16
   End
   Begin Separator uiSeparator
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   114
      Visible         =   True
      Width           =   368
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
		    vars.Value("product") = App.GetProjectName()
		    vars.Value("version") = _
		    Format(App.MajorVersion, "-#") + "." + _
		    Format(App.MinorVersion, "-#") + "." + _
		    Format(App.BugVersion, "-#") + "." + _
		    Format(App.NonReleaseVersion, "-#")
		    
		    HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString(True))
		    HTTP.Get(url + "?" + HTTP.EncodeFormData(vars))
		    
		  Else
		    
		    HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString(True))
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
		    
		    uiStatus.Text = "BNRBot: Checking for updates..."
		    uiSubstatus.Text = "(User initiated)"
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiProgressWheel.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "&Cancel"
		    Self.stateAuto = False
		    
		    TransitionTimer.Mode = TransitionTimer.ModeSingle
		    TransitionTimer.Period = 250
		    TransitionTimer.Enabled = True
		    
		  Case Self.STEP_CHECK_AUTO
		    
		    uiStatus.Text = "BNRBot: Checking for updates..."
		    uiSubstatus.Text = "(Automatically initiated)"
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiProgressWheel.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "&Cancel"
		    Self.stateAuto = True
		    
		    TransitionTimer.Mode = TransitionTimer.ModeSingle
		    TransitionTimer.Period = 250
		    TransitionTimer.Enabled = True
		    
		  Case Self.STEP_HTTP_SENDING
		    
		    uiStatus.Text = "BNRBot: Checking for updates..."
		    uiSubstatus.Text = "Sending request..."
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiProgressWheel.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "&Cancel"
		    
		  Case Self.STEP_HTTP_RECEIVING
		    
		    uiStatus.Text = "BNRBot: Checking for updates..."
		    uiSubstatus.Text = "Receiving response..."
		    uiProgress.Maximum = 0
		    uiProgress.Value = 0
		    uiProgress.Visible = True
		    uiProgressWheel.Visible = True
		    uiCancelAction.Visible = False
		    uiCurrentAction.Caption = "&Cancel"
		    
		  Case Self.STEP_HTTP_FAILURE
		    
		    Dim err As String = errorDetail
		    If Len(err) > 0 Then err = EndOfLine + EndOfLine + err
		    
		    Self.Hide()
		    Call MsgBox("An error occurred while checking for updates." + err, 48, Self.Title)
		    Self.Close()
		    
		  Case Self.STEP_UPDATE_FAILURE
		    
		    Dim err As String = errorDetail
		    If Len(err) > 0 Then err = EndOfLine + EndOfLine + err
		    
		    Self.Hide()
		    Call MsgBox("An error occurred while checking for updates." + err, 48, Self.Title)
		    Self.Close()
		    
		  Case Self.STEP_UPDATE_AVAILABLE
		    
		    uiCurrentAction.Caption = "Co&ntinue"
		    uiStatus.Text = "BNRBot: Update found!"
		    uiSubstatus.Text = "Click " + uiCurrentAction.Caption + " to download in your web browser."
		    uiProgress.Visible = False
		    uiProgressWheel.Visible = False
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
