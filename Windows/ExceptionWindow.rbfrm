#tag Window
Begin Window ExceptionWindow
   BackColor       =   "#Colors.UI.WindowBackColor"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   160
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   160
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   3
   Resizeable      =   True
   Title           =   "Unhandled Exception"
   Visible         =   True
   Width           =   4.0e+2
   Begin Label oTitle
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
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
      Selectable      =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Title"
      TextAlign       =   0
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   360
   End
   Begin Label oDescription
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   60
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
      Selectable      =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Description"
      TextAlign       =   0
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   360
   End
   Begin PushButton oContinueButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Continue"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   310
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   118
      Underline       =   ""
      Visible         =   True
      Width           =   70
   End
   Begin PushButton oExitButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Exit"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   228
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   118
      Underline       =   ""
      Visible         =   True
      Width           =   70
   End
   Begin PushButton oReportButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Report"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   118
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Process()
		  
		  Me.oTitle.Text = "An unhandled " + Introspection.GetType(Me.oException).Name + " occurred."
		  
		  If Me.oException.ErrorNumber = 0 And Len(Me.oException.Message) > 0 Then
		    Me.oDescription.Text = Me.oException.Message
		  ElseIf Me.oException.ErrorNumber <> 0 And Len(Me.oException.Message) = 0 Then
		    Me.oDescription.Text = "Error #" + Format(Me.oException.ErrorNumber, "-#")
		  ElseIf Me.oException.ErrorNumber <> 0 And Len(Me.oException.Message) > 0 Then
		    Me.oDescription.Text = "Error #" + Format(Me.oException.ErrorNumber, "-#") + ": " + Me.oException.Message
		  Else
		    Me.oDescription.Text = "no other details were provided."
		    Me.oDescription.Italic = True
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		oException As RuntimeException
	#tag EndProperty


#tag EndWindowCode

#tag Events oContinueButton
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events oExitButton
	#tag Event
		Sub Action()
		  
		  // We close all current Battle.net connections so that way the MainWindow doesn't
		  // prompt the user if they wish to disconnect these first.
		  
		  Dim i As Integer = UBound(Settings.Configurations)
		  While i >= 0
		    If Settings.Configurations(i) <> Nil And Settings.Configurations(i).BNET <> Nil And _
		      Settings.Configurations(i).BNET.IsConnected = True Then _
		      Settings.Configurations(i).BNET.DoDisconnect(False)
		      i = i - 1
		  Wend
		  
		  // Return a non-successful exit status to the system.
		  Quit(1)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events oReportButton
	#tag Event
		Sub Action()
		  
		  Dim o As New HTTPSocket()
		  Dim d As New Dictionary()
		  
		  d.Value("title") = Self.oTitle.Text
		  d.Value("body") = Self.oDescription.Text + EndOfLine + EndOfLine + _
		  "```" + EndOfLine + Join(Self.oException.Stack(), EndOfLine) + EndOfLine + "```" + EndOfLine
		  
		  REALbasic.ShowURL("https://github.com/carlbennett/BNRBot/issues/new?" + o.EncodeFormData(d))
		  
		End Sub
	#tag EndEvent
#tag EndEvents
