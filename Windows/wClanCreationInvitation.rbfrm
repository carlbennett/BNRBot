#tag Window
Begin Window wClanCreationInvitation
   BackColor       =   48
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   349
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   149
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   349
   MinimizeButton  =   True
   MinWidth        =   360
   Placement       =   2
   Resizeable      =   False
   Title           =   "Create Clan Invitation Received"
   Visible         =   True
   Width           =   360
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   0
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You have been invited to create a clan!"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   320
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Clan Name: "
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextArea fldClanName
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.Black"
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
      Left            =   120
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CLAN.NAME"
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   34
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   220
   End
   Begin TextArea fldClanTag
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.Black"
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
      Left            =   120
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CLAN.TAG"
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   57
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   220
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Clan Tag:"
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
   Begin TextArea fldClanInviter
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   "#Colors.Black"
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
      Left            =   120
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CLAN.INVITER"
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   80
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   220
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Invited By:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   80
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnAccept
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "&Accept"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   260
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   311
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnDecline
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "&Decline"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   168
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   311
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnIgnore
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "&Ignore"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   311
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Listbox lstMembers
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   19
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   190
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   120
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   107
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   220
      _ScrollWidth    =   -1
   End
   Begin Label txtJunk
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   ""
      Left            =   40
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Members:"
      TextAlign       =   0
      TextColor       =   "#Colors.White"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   107
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   80
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
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused g
		  #pragma Unused areas
		  
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


	#tag Property, Flags = &h0
		Result As PushButton
	#tag EndProperty


#tag EndWindowCode

#tag Events btnAccept
	#tag Event
		Sub Action()
		  
		  Self.Result = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDecline
	#tag Event
		Sub Action()
		  
		  Self.Result = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnIgnore
	#tag Event
		Sub Action()
		  
		  Self.Result = Me
		  Self.Hide()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstMembers
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  #pragma Unused column
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = Colors.UI.ListSelectionColor
		  Else
		    g.ForeColor = Colors.UI.ControlBackColor
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = Colors.UI.ControlBackColor
		  Else
		    g.ForeColor = Colors.UI.ListSelectionColor
		  End If
		  
		  If row >= 0 And row < Me.ListCount Then _
		  g.DrawString(Me.Cell(row, column), x, y, g.Width - x * 2, True)
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
