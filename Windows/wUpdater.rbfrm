#tag Window
Begin Window wUpdater
   BackColor       =   48
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   204
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   204
   MinimizeButton  =   False
   MinWidth        =   304
   Placement       =   1
   Resizeable      =   False
   Title           =   "Updater - BNRBot"
   Visible         =   True
   Width           =   304
   Begin PushButton btnClose
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Close"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   118
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Verdana"
      TextSize        =   11
      TextUnit        =   0
      Top             =   162
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label txtStatus
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      TabStop         =   True
      Text            =   "Checking for updates..."
      TextAlign       =   1
      TextColor       =   "#Colors.White"
      TextFont        =   "Verdana"
      TextSize        =   11
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   264
   End
   Begin Label txtDetails
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
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
      TabStop         =   True
      Text            =   "Connecting to update server..."
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Verdana"
      TextSize        =   11
      TextUnit        =   0
      Top             =   41
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   264
   End
   Begin PushButton btnUpdate
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Update Now"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   102
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   ""
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Verdana"
      TextSize        =   11
      TextUnit        =   0
      Top             =   138
      Underline       =   ""
      Visible         =   False
      Width           =   100
   End
   Begin Timer GUITimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   32
   End
   Begin HTTPSecureSocket HTTP
      CertificateFile =   ""
      CertificatePassword=   ""
      CertificateRejectionFile=   ""
      ConnectionType  =   2
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Secure          =   True
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   172
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Maximize()
		  
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  txtStatus.Text = ""
		  txtDetails.Text = ""
		  
		  Self.CheckForUpdate()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused g
		  
		  Self.DrawBorders()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckForUpdate()
		  
		  Dim vars As New Dictionary()
		  
		  vars.Value("product") = "bnrbotv" + Format(App.MajorVersion, "#")
		  vars.Value("build") = Format(App.NonReleaseVersion, "#0000")
		  
		  HTTP.Yield = True
		  
		  SetStatus("Checking for update.", "Connecting to clan-warp.net...")
		  HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString())
		  HTTP.Get("http://clan-warp.net/Web/updater.php?" + HTTP.EncodeFormData(vars))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawBorders()
		  
		  Dim RC As RectControl
		  Dim g As Graphics = Self.Graphics
		  Dim X, Y, W, H As Integer
		  
		  Dim i As Integer = 0
		  While i < Me.ControlCount
		    If Me.Control(i) IsA RectControl Then
		      
		      RC = RectControl(Me.Control(i))
		      X = RC.Left
		      Y = RC.Top
		      W = RC.Width
		      H = RC.Height
		      
		      If (RC IsA TextArea Or RC IsA TextField Or RC IsA ListBox) And RC.Visible = True Then
		        g.ForeColor = Colors.UI.ControlBorderColor
		        
		        g.DrawLine(X + W, Y - 1, X + W, Y + H) // Right
		        g.DrawLine(X - 1, Y - 1, X - 1, Y + H) // Left
		        g.DrawLine(X - 1, Y - 1, X + W, Y - 1) // Top
		        g.DrawLine(X - 1, Y + H, X + W, Y + H) // Bottom
		        
		      End If
		    End If
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod

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
		Sub SetStatus(sDetail As String)
		  
		  Dim details() As String = Split(ReplaceLineEndings(txtDetails.Text, EndOfLine), EndOfLine)
		  Static lineCount As Integer = 6
		  
		  If UBound(details) + 1 >= lineCount  Then details.Remove(0)
		  details.Append(sDetail)
		  
		  txtDetails.Text = Join(details, EndOfLine)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStatus(sProgressStep As String, sDetail As String)
		  
		  txtStatus.Text = sProgressStep
		  SetStatus(sDetail)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		UpdateURL As String
	#tag EndProperty

	#tag Property, Flags = &h0
		WasAutomatic As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events btnClose
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnUpdate
	#tag Event
		Sub Action()
		  
		  ShowURL(Self.UpdateURL)
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GUITimer
	#tag Event
		Sub Action()
		  
		  If Right(txtStatus.Text, 3) = "..." Then
		    
		    txtStatus.Text = Left(txtStatus.Text, Len(txtStatus.Text) - 2)
		    
		  ElseIf Right(txtStatus.Text, 2) = ".." Then
		    
		    txtStatus.Text = txtStatus.Text + "."
		    
		  ElseIf Right(txtStatus.Text, 1) = "." Then
		    
		    txtStatus.Text = txtStatus.Text + "."
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTP
	#tag Event
		Sub Connected()
		  
		  SetStatus("Connected to " + Me.RemoteAddress + ".")
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function AuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  
		  #pragma Unused Headers
		  
		  SetStatus("Authentication required!")
		  
		  Dim w As New wHTTPAuthentication()
		  w.Title = "Server Authentication Required"
		  w.fldRealm.Text = Realm
		  w.ShowModalWithin(Self)
		  
		  If w.Result = w.btnProceed Then
		    
		    Name = w.fldUsername.Text
		    Password = w.fldPassword.Text
		    w.Close()
		    Return True
		    
		  Else
		    
		    Return False
		    
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Error(code as integer)
		  
		  SetStatus("Error! Code: " + Format(code, "#"))
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ProxyAuthenticationRequired(Realm As String, Headers As InternetHeaders, ByRef Name As String, ByRef Password As String) As Boolean
		  
		  #pragma Unused Headers
		  
		  SetStatus("Proxy authentication required!")
		  
		  Dim w As New wHTTPAuthentication()
		  w.Title = "Proxy Authentication Required"
		  w.fldRealm.Text = Realm
		  w.ShowModalWithin(Self)
		  
		  If w.Result = w.btnProceed Then
		    
		    Name = w.fldUsername.Text
		    Password = w.fldPassword.Text
		    w.Close()
		    Return True
		    
		  Else
		    
		    Return False
		    
		  End If
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub PageReceived(url as string, httpStatus as integer, headers as internetHeaders, content as string)
		  
		  #pragma Unused url
		  #pragma Unused content
		  
		  Select Case httpStatus
		  Case 301, 302, 307 // Redirect
		    
		    SetStatus("Redirecting to another URL...")
		    HTTP.requestHeaders.SetHeader("User-Agent", App.VersionString())
		    Me.Get(Self.GetHeaderValue(headers, "Location"))
		    
		  Case 303 // See Other
		    
		    SetStatus("An update is available!", "Found an update, click " + btnUpdate.Caption + " to download.")
		    Self.UpdateURL = Self.GetHeaderValue(headers, "Location")
		    btnClose.Default = False
		    btnUpdate.Default = True
		    btnUpdate.Visible = True
		    
		  Case 304 // Not Modified
		    
		    SetStatus("No update available!", "You're running the latest revision.")
		    If Self.WasAutomatic = True Then Self.Close()
		    
		  Case 401 // Not authorized
		    
		    SetStatus("Authentication cancelled!", "Authentication was cancelled by user.")
		    
		  Case 404 // Not Found
		    
		    SetStatus("Unknown or invalid product!", "We're running an unknown or invalid application.")
		    
		  Case Else
		    
		    SetStatus("Unknown result received!", "HTTP status code " + Format(httpStatus, "#") + " went unhandled!")
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
