#tag Window
Begin Window ConnectWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   92
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   92
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   92
   MinimizeButton  =   False
   MinWidth        =   400
   Placement       =   2
   Resizeable      =   False
   Title           =   "Connect Profile"
   Visible         =   True
   Width           =   4.0e+2
   Begin Label ProfileLabel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   16
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Select Profile:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   90
   End
   Begin PopupMenu ProfileMenu
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   114
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Underline       =   ""
      Visible         =   True
      Width           =   270
   End
   Begin PushButton ConnectButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Co&nnect"
      Default         =   True
      Enabled         =   False
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   52
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton CancelButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "&Cancel"
      Default         =   False
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   52
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		UserChoice As PushButton
	#tag EndProperty


#tag EndWindowCode

#tag Events ProfileMenu
	#tag Event
		Sub Change()
		  
		  Self.ConnectButton.Enabled = (Me.ListIndex <> -1)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  
		  Self.UserChoice = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Action()
		  
		  Self.UserChoice = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
