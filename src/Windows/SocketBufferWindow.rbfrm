#tag Window
Begin Window SocketBufferWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Socket Buffer"
   Visible         =   True
   Width           =   600
   Begin Label OutboundFramesLabelCtl
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
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
      Text            =   "Outbound Frames:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   13
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   160
   End
   Begin StyledListbox OutboundFramesListCtl
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   16
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   314
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Message Id	Size"
      Italic          =   ""
      Left            =   8
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
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
      Top             =   42
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   160
      _ScrollWidth    =   -1
   End
   Begin Line LineVertical
      BorderWidth     =   1
      Height          =   50
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   180
      LineColor       =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   1.0e+1
      Visible         =   True
      Width           =   100
      X1              =   180
      X2              =   180
      Y1              =   10
      Y2              =   390
   End
   Begin Label MessageLabelCtl
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   18
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   190
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
      Text            =   "Message:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   13
      TextUnit        =   0
      Top             =   10
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   400
   End
   Begin Rectangle MessageIdBackCtl
      AutoDeactivate  =   True
      BorderWidth     =   0
      BottomRightColor=   &h000000
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   264
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      Top             =   42
      TopLeftColor    =   &h000000
      Visible         =   True
      Width           =   70
      Begin TextField MessageIdCtl
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
         InitialParent   =   "MessageIdBackCtl"
         Italic          =   ""
         Left            =   266
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
         Top             =   46
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   64
      End
   End
   Begin Line LineHorizontal
      BorderWidth     =   1
      Height          =   50
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1.8e+2
      LineColor       =   ""
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   3.39e+2
      Visible         =   True
      Width           =   100
      X1              =   10
      X2              =   590
      Y1              =   32
      Y2              =   32
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   190
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Message Id:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   42
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   70
   End
   Begin Label Labels
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   344
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Size:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   42
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   30
   End
   Begin Label SizeLabelCtl
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
      Left            =   378
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "0 bytes"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   42
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin StyledListbox FieldListCtl
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   3
      ColumnsResizable=   True
      ColumnWidths    =   120,70,
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   16
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   280
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Type	Value"
      Italic          =   ""
      Left            =   190
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
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   76
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   400
      _ScrollWidth    =   -1
   End
   Begin StyledButton OutboundFrameCreateCtl
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      ActiveColor     =   "&c000000"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "&c000000"
      Bold            =   ""
      BorderColor     =   "&c000000"
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Focused         =   ""
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   90
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Create"
      TextColor       =   "&c000000"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   366
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   78
   End
   Begin StyledButton OutboundFrameDeleteCtl
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      ActiveColor     =   "&c000000"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "&c000000"
      Bold            =   ""
      BorderColor     =   "&c000000"
      DoubleBuffer    =   ""
      Enabled         =   False
      EraseBackground =   ""
      Focused         =   ""
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   8
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Delete"
      TextColor       =   "&c000000"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   366
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   78
   End
   Begin StyledButton AddFieldCtl
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      ActiveColor     =   "&c000000"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "&c000000"
      Bold            =   ""
      BorderColor     =   "&c000000"
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Focused         =   ""
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   490
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Add Field"
      TextColor       =   "&c000000"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   366
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
   Begin StyledButton RemoveFieldCtl
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      ActiveColor     =   "&c000000"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "&c000000"
      Bold            =   ""
      BorderColor     =   "&c000000"
      DoubleBuffer    =   ""
      Enabled         =   False
      EraseBackground =   ""
      Focused         =   ""
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   386
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Remove Field"
      TextColor       =   "&c000000"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   366
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.colors.DefaultBackColor
		  Me.HasBackColor = True
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  
		  Me.AdjustControlCoords()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  Me.AdjustControlCoords()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub AdjustControlCoords()
		  
		  Self.LineVertical.X1 = 10 + Self.OutboundFramesListCtl.Width + 10
		  Self.LineVertical.X2 = Self.LineVertical.X1
		  Self.LineVertical.Y1 = 10
		  Self.LineVertical.Y2 = Self.Height - 10
		  
		  Self.LineHorizontal.X1 = 10
		  Self.LineHorizontal.X2 = Self.Width - 10
		  Self.LineHorizontal.Y1 = 10 + Self.MessageLabelCtl.Height + 4
		  Self.LineHorizontal.Y2 = Self.LineHorizontal.Y1
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Client As BNETClient
	#tag EndProperty


#tag EndWindowCode

#tag Events OutboundFramesLabelCtl
	#tag Event
		Sub Open()
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutboundFramesListCtl
	#tag Event
		Sub Change()
		  
		  Self.OutboundFrameDeleteCtl.Enabled = ( Me.ListIndex <> -1 )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  
		  #pragma Unused x
		  #pragma Unused y
		  
		  If column <> 1 Then
		    Me.EditCell( row, column )
		    Return True
		  End If
		  
		  Dim menu As New MenuItem()
		  
		  menu.Append( New MenuItem( "Boolean" )
		  menu.Append( New MenuItem( "Int8" ))
		  menu.Append( New MenuItem( "Int16" ))
		  menu.Append( New MenuItem( "Int32" ))
		  menu.Append( New MenuItem( "Int64" )))
		  menu.Append( New MenuItem( "String" ))
		  menu.Append( New MenuItem( "UInt8" ))
		  menu.Append( New MenuItem( "UInt16" ))
		  menu.Append( New MenuItem( "UInt32" ))
		  menu.Append( New MenuItem( "UInt64" ))
		  
		  Dim hitItem As MenuItem = menu.PopUp()
		  
		  If hitItem = Nil Then Return False
		  
		  Me.Cell( row, column ) = hitItem.Text
		  
		  If hitItem.Text = "String" Then
		    Me.CellType( row, column ) = Me.TypeEditableTextArea
		  Else
		    Me.CellType( row, column ) = Me.TypeEditableTextField
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events LineVertical
	#tag Event
		Sub Open()
		  
		  Me.LineColor = App.config.colors.DefaultFrameColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageLabelCtl
	#tag Event
		Sub Open()
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageIdBackCtl
	#tag Event
		Sub Open()
		  
		  Me.FillColor = App.config.colors.ChatBackColor
		  
		  Me.TopLeftColor = Me.FillColor
		  Me.BottomRightColor = Me.FillColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MessageIdCtl
	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.colors.ChatBackColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Dim str As String = Trim( Me.Text )
		  Dim id As Double
		  
		  If Left( str, 2 ) = "0x" Then
		    id = Val( "&H" + Mid( str, 3 ))
		  Else
		    id = Val( str )
		  End If
		  
		  If id < 0 Then
		    id = 0
		  End If
		  
		  If id > 255 Then
		    id = 255
		  End If
		  
		  Me.Text = "0x" + Right( "0" + Hex( id ), 2 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineHorizontal
	#tag Event
		Sub Open()
		  
		  Me.LineColor = App.config.colors.DefaultFrameColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Labels
	#tag Event
		Sub Open(index as Integer)
		  
		  #pragma Unused index
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SizeLabelCtl
	#tag Event
		Sub Open()
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FieldListCtl
	#tag Event
		Sub Change()
		  
		  Self.RemoveFieldCtl.Enabled = ( Me.ListIndex <> -1 )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  Me.ColumnType( 0 ) = Me.TypeEditableTextField
		  Me.ColumnType( 1 ) = Me.TypeNormal
		  Me.ColumnType( 2 ) = Me.TypeEditableTextField
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutboundFrameCreateCtl
	#tag Event
		Sub Open()
		  
		  Me.ActiveColor = App.config.colors.DefaultHighlightBackColor
		  Me.BackgroundColor = App.config.colors.ChatBackColor
		  Me.BorderColor = App.config.colors.DefaultFrameColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  
		  Dim items() As Pair
		  
		  items.Append( New Pair( "UInt8", &HFF ))
		  items.Append( New Pair( "UInt8", &H00 ))
		  items.Append( New Pair( "UInt8", &H04 ))
		  items.Append( New Pair( "UInt8", &H00 ))
		  
		  Self.OutboundFramesListCtl.AddRow( "0x00" )
		  Self.OutboundFramesListCtl.RowTag( Self.OutboundFramesListCtl.LastIndex ) = items
		  Self.OutboundFramesListCtl.Cell( Self.OutboundFramesListCtl.LastIndex, 1 ) = "4"
		  
		  Self.OutboundFramesListCtl.ListIndex = Self.OutboundFramesListCtl.LastIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutboundFrameDeleteCtl
	#tag Event
		Sub Open()
		  
		  Me.ActiveColor = App.config.colors.DefaultHighlightBackColor
		  Me.BackgroundColor = App.config.colors.ChatBackColor
		  Me.BorderColor = App.config.colors.DefaultFrameColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddFieldCtl
	#tag Event
		Sub Open()
		  
		  Me.ActiveColor = App.config.colors.DefaultHighlightBackColor
		  Me.BackgroundColor = App.config.colors.ChatBackColor
		  Me.BorderColor = App.config.colors.DefaultFrameColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  
		  Self.FieldListCtl.AddRow( "Untitled" )
		  Self.FieldListCtl.Cell( Self.FieldListCtl.LastIndex, 1 ) = "String"
		  Self.FieldListCtl.Cell( Self.FieldListCtl.LastIndex, 2 ) = ""
		  
		  Self.FieldListCtl.ListIndex = Self.FieldListCtl.LastIndex
		  
		  Self.FieldListCtl.EditCell( Self.FieldListCtl.LastIndex, 0 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RemoveFieldCtl
	#tag Event
		Sub Open()
		  
		  Me.ActiveColor = App.config.colors.DefaultHighlightBackColor
		  Me.BackgroundColor = App.config.colors.ChatBackColor
		  Me.BorderColor = App.config.colors.DefaultFrameColor
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  
		  If Self.FieldListCtl.ListIndex = -1 Then Return
		  
		  Self.FieldListCtl.ListIndex = Self.FieldListCtl.ListIndex - 1
		  Self.FieldListCtl.RemoveRow( Self.FieldListCtl.ListIndex + 1 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
