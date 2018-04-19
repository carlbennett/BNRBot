#tag Window
Begin ContainerControl ChatContainer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   360
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   480
   Begin TextField ChatInput
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   False
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   338
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   480
   End
   Begin Listbox UserView
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   328
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   380
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   100
      _ScrollWidth    =   -1
   End
   Begin TextArea ChatOutput
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   314
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   370
   End
   Begin SizeGripControl SizeGripControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   328
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   370
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   10
   End
   Begin Label UIAlphaLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   14
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "USER INTERFACE ALPHA"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   370
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty


#tag EndWindowCode

#tag Events ChatInput
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.globalConfig.Colors.ChatBackColor
		  Me.TextColor = App.config.globalConfig.Colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Dim KeyAsc As Integer = Asc(Key)
		  
		  If Not (KeyAsc = 3 Or KeyAsc = 13) Then Return False
		  
		  Self.client.chatParser.responses.Insert(0, New ChatResponse(ChatResponse.TYPE_TALK, Me.Text))
		  Me.Text = ""
		  
		  If Self.client.chatParser.State = Self.client.chatParser.NotRunning Then
		    Self.client.chatParser.Run()
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events UserView
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  #pragma Unused column
		  
		  If Me.ListIndex = row Then
		    g.ForeColor = HighlightColor()
		  Else
		    g.ForeColor = App.config.globalConfig.Colors.ChatBackColor
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = App.config.globalConfig.Colors.ChatBackColor
		  Else
		    g.ForeColor = App.config.globalConfig.Colors.DefaultTextColor
		  End If
		  
		  If row < 0 Or row >= Me.ListCount Or column < 0 Or column >= Me.ColumnCount Then
		    Return False
		  End If
		  
		  g.DrawString(Me.Cell(row, column), x, y, g.Width - x * 2, True)
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ChatOutput
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.globalConfig.Colors.ChatBackColor
		  Me.TextColor = App.config.globalConfig.Colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SizeGripControl1
	#tag Event
		Sub Open()
		  
		  Me.Direction = SizeGripControl.DirectionType.Vertical
		  
		  Me.Attach(Self.UIAlphaLabel)
		  Me.Attach(Self.ChatOutput)
		  Me.Attach(Self.UserView)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MoveControl(c As RectControl, dX As Integer, dY As Integer)
		  
		  #pragma Unused dY
		  
		  Select Case c
		  Case Self.UIAlphaLabel
		    
		    c.Width = c.Width + dX
		    
		  Case Self.ChatOutput
		    
		    c.Width = c.Width + dX
		    
		  Case Self.UserView
		    
		    c.Left = c.Left + dX
		    c.Width = c.Width - dX
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
