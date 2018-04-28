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
   Width           =   580
   Begin StyledListbox UserView
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   2
      ColumnsResizable=   ""
      ColumnWidths    =   36
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   274
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   430
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   38
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   150
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
      Height          =   312
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   420
   End
   Begin SizeGripControl SizeGripControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      BackColor       =   ""
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      ForeColor       =   ""
      Height          =   312
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   420
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "USER INTERFACE ALPHA"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   346
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   580
   End
   Begin Rectangle StatusBackCtl
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &h000000
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   26
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   430
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      Top             =   0
      TopLeftColor    =   &h000000
      Visible         =   True
      Width           =   150
      Begin Label StatusCtl
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "StatusBackCtl"
         Italic          =   ""
         Left            =   432
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Status"
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "Microsoft Sans Serif"
         TextSize        =   11
         TextUnit        =   0
         Top             =   2
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   146
      End
   End
   Begin Rectangle ChatInputBackCtl
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &h000000
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   322
      TopLeftColor    =   &h000000
      Visible         =   True
      Width           =   580
      Begin TextField ChatInput
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   "&cF0F0F0"
         Bold            =   ""
         Border          =   False
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ChatInputBackCtl"
         Italic          =   ""
         Left            =   2
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
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
         Top             =   326
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   574
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		client As BNETClient
	#tag EndProperty


#tag EndWindowCode

#tag Events UserView
	#tag Event
		Sub CellBackgroundPaint(g As Graphics, row As Integer, column As Integer)
		  
		  If row >= 0 And row < Me.ListCount And column = 0 Then
		    
		    Dim icon As Picture
		    Dim mb As New MemoryBlock( 4 )
		    
		    mb.LittleEndian = True
		    mb.StringValue( 0, 4 ) = Me.Cell( row, column )
		    
		    icon = ProductIcon.GetCachedIcon( mb.UInt32Value( 0 ))
		    
		    g.DrawPicture( icon, 0, 0, g.Width, g.Height )
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x As Integer, y As Integer) As Boolean
		  
		  #pragma Unused g
		  #pragma Unused x
		  #pragma Unused y
		  
		  If row >= 0 And row < Me.ListCount And column = 0 Then Return True
		  
		  Return False
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ChatOutput
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.colors.ChatBackColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SizeGripControl1
	#tag Event
		Sub Open()
		  
		  Me.Direction = SizeGripControl.DirectionType.Vertical
		  
		  Me.Attach(Self.UIAlphaLabel)
		  Me.Attach(Self.ChatOutput)
		  Me.Attach(Self.StatusBackCtl)
		  Me.Attach(Self.UserView)
		  
		  Me.BackColor = App.config.colors.DefaultBackColor
		  Me.ForeColor = App.config.colors.DefaultTextColor
		  
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
		    
		  Case Self.StatusBackCtl
		    
		    c.Left = c.Left + dX
		    c.Width = c.Width - dX
		    
		  Case Self.UserView
		    
		    c.Left = c.Left + dX
		    c.Width = c.Width - dX
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UIAlphaLabel
	#tag Event
		Sub Open()
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatusBackCtl
	#tag Event
		Sub Open()
		  
		  Me.FillColor = App.config.colors.ChatBackColor
		  
		  Me.TopLeftColor = Me.FillColor
		  Me.BottomRightColor = Me.FillColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatusCtl
	#tag Event
		Sub Open()
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChatInputBackCtl
	#tag Event
		Sub Open()
		  
		  Me.FillColor = App.config.colors.ChatBackColor
		  
		  Me.TopLeftColor = Me.FillColor
		  Me.BottomRightColor = Me.FillColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChatInput
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.colors.ChatBackColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
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
