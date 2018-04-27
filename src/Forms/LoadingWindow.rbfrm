#tag Window
Begin Window LoadingWindow
   BackColor       =   "&c2F3136"
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   96
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   96
   MinimizeButton  =   False
   MinWidth        =   360
   Placement       =   0
   Resizeable      =   False
   Title           =   "BNRBot"
   Visible         =   True
   Width           =   360
   Begin ProgressWheel ProgressWheel1
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
   Begin Label Label1
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
      Left            =   44
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Please Wait..."
      TextAlign       =   0
      TextColor       =   "&cF0F0F0"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
   Begin StyledProgressBar ProgressBar1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      BackColor       =   "&c000000"
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      ForeColor       =   "&c000000"
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   64
      UseFocusRing    =   ""
      Value           =   0
      Visible         =   True
      Width           =   328
   End
   Begin Timer Timer1
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      Period          =   2000
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   44
      Visible         =   True
      Width           =   32
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   44
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
      Text            =   ""
      TextAlign       =   0
      TextColor       =   "&cADBAC2"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   36
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub SetProgress(title As String, description As String = "", value As Integer, maximum As Integer)
		  
		  If Me.Label1       <> Nil Then Me.Label1.Text = title
		  If Me.Label2       <> Nil Then Me.Label2.Text = description
		  
		  If Me.ProgressBar1 <> Nil Then
		    Me.ProgressBar1.Maximum = maximum
		    Me.ProgressBar1.Value   = value
		  End If
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events ProgressBar1
	#tag Event
		Sub Open()
		  
		  Me.BackColor = &c42464D
		  Me.ForeColor = &cADBAC2
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  
		  If Self.ProgressBar1.Value = Self.ProgressBar1.Maximum And Self.ProgressBar1.Maximum > 0 Then
		    Self.Close()
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
