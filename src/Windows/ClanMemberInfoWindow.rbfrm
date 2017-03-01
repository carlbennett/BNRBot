#tag Window
Begin BotWindow ClanMemberInfoWindow
   BackColor       =   "#Colors.UI.WindowBackColor"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   162
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   162
   MinimizeButton  =   True
   MinWidth        =   240
   Placement       =   3
   Resizeable      =   True
   Title           =   "%username% - Clan Info"
   Visible         =   True
   Width           =   350
   Begin TextArea fldUsername
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   90
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%username%"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   10
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
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
      Text            =   "Username:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Clan Tag:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   33
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextArea fldClanTag
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   90
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%clan.tag%"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   33
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
   End
   Begin TextArea fldClanName
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   90
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%clan.name%"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   57
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Clan Name:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
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
      Left            =   272
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   ""
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   130
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin TextArea fldClanRank
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   90
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%clan.rank%"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   81
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Clan Rank:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   81
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextArea fldClanDateJoined
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   90
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%clan.joindate%"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   105
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "Date Joined:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   105
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events fldUsername
	#tag Event
		Sub GotFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fldClanTag
	#tag Event
		Sub GotFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fldClanName
	#tag Event
		Sub GotFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClose
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  If Me.Default = True Then Me.SetFocus()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fldClanRank
	#tag Event
		Sub GotFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fldClanDateJoined
	#tag Event
		Sub GotFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
