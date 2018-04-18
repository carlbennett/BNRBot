#tag Window
Begin Window ChoiceWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   156
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   156
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   2
   Resizeable      =   False
   Title           =   "Choice"
   Visible         =   True
   Width           =   400
   Begin Canvas IconCanvas
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   32
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
      UseFocusRing    =   True
      Visible         =   True
      Width           =   32
   End
   Begin Label DetailsLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   48
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   60
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
      Text            =   "There are no other details."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   324
   End
   Begin Label TitleLabel
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
      Left            =   60
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
      Text            =   "Pick an option below to continue"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   324
   End
   Begin Separator Separators
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   0
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
      Top             =   96
      Visible         =   True
      Width           =   368
   End
   Begin PushButton CancelButtonCtl
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
      Left            =   212
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
      Top             =   116
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton ActionButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "&OK"
      Default         =   True
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   304
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
      Top             =   116
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label ExpiresLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   16
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Expires In:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   116
      Transparent     =   False
      Underline       =   ""
      Visible         =   False
      Width           =   64
   End
   Begin Label ExpiresValueLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   80
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "60 seconds"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   116
      Transparent     =   False
      Underline       =   ""
      Visible         =   False
      Width           =   120
   End
   Begin Timer ExpireTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   16
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   52
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ExpireAfter(intervalInSeconds As Integer)
		  
		  Self.ExpireSeconds = intervalInSeconds
		  
		  Self.ExpiresValueLabel.Text = Format( intervalInSeconds, "-#" ) + " second"
		  
		  If intervalInSeconds <> 1 Then Self.ExpiresValueLabel.Text = Self.ExpiresValueLabel.Text + "s"
		  
		  Self.ExpiresLabel.Visible = True
		  Self.ExpiresValueLabel.Visible = True
		  
		  Self.ExpireTimer.Mode = Self.ExpireTimer.ModeMultiple
		  Self.ExpireTimer.Enabled = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ExpireSeconds As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		UserChoseButton As PushButton
	#tag EndProperty


#tag EndWindowCode

#tag Events IconCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  g.DrawNoteIcon(0, 0)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButtonCtl
	#tag Event
		Sub Action()
		  
		  Self.UserChoseButton = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActionButtonCtl
	#tag Event
		Sub Action()
		  
		  Self.UserChoseButton = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExpireTimer
	#tag Event
		Sub Action()
		  
		  Self.ExpireSeconds = Self.ExpireSeconds - ( Me.Period / 1000 )
		  
		  If Self.ExpireSeconds <= 0 Then
		    
		    Self.ExpireSeconds = 0
		    
		    Self.ExpiresValueLabel.Text = "Expired"
		    Self.ExpiresValueLabel.TextColor = &cD3000
		    
		    Me.Enabled = False
		    
		  Else
		    
		    Self.ExpiresValueLabel.Text = Format( Self.ExpireSeconds, "-#.0#" ) + " second"
		    
		    If Self.ExpireSeconds <> 1 Then Self.ExpiresValueLabel.Text = Self.ExpiresValueLabel.Text + "s"
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
