#tag Window
Begin Window LoadingWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   4
   FullScreen      =   False
   HasBackColor    =   False
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
      Text            =   "Please Wait..."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   300
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
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
      TabPanelIndex   =   0
      Top             =   64
      Value           =   0
      Visible         =   True
      Width           =   328
   End
   Begin Timer Timer1
      Height          =   32
      Index           =   -2147483648
      Left            =   0
      LockedInPosition=   False
      Mode            =   2
      Period          =   2000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   44
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
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &h000000
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
		  
		  Me.Label1.Text          = title
		  Me.Label2.Text          = description
		  Me.ProgressBar1.Value   = value
		  Me.ProgressBar1.Maximum = maximum
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  
		  If Self.ProgressBar1.Value = Self.ProgressBar1.Maximum And Self.ProgressBar1.Maximum > 0 Then
		    Self.Close()
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
