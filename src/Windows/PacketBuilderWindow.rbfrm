#tag Window
Begin Window PacketBuilderWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   3
   Resizeable      =   True
   Title           =   "Packet Builder"
   Visible         =   True
   Width           =   8.0e+2
   Begin GroupBox grpPacket
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Packet"
      Enabled         =   True
      Height          =   266
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   16
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Underline       =   ""
      Visible         =   True
      Width           =   412
      Begin Listbox FieldList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   4
         ColumnsResizable=   True
         ColumnWidths    =   30,80,50
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
         Height          =   176
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "grpPacket"
         InitialValue    =   "#	Data Type	Bytes	Description"
         Italic          =   ""
         Left            =   32
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
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   88
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   380
         _ScrollWidth    =   -1
         Begin Timer FieldsTimer
            Height          =   32
            Index           =   -2147483648
            InitialParent   =   "FieldList"
            Left            =   64
            LockedInPosition=   False
            Mode            =   1
            Period          =   5
            Scope           =   0
            TabPanelIndex   =   0
            Top             =   120
            Width           =   32
         End
      End
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   32
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         Text            =   "Fields:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   70
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   380
      End
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   32
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Id:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   14
      End
      Begin TextField FieldId
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   54
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   38
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   90
      End
      Begin UpDownArrows FieldIdUpDownArrows
         AcceptFocus     =   True
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpPacket"
         Left            =   148
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   38
         Visible         =   True
         Width           =   13
      End
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   5
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   172
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
         Text            =   "Hex:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   26
      End
      Begin Label HexIdText
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   206
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         Text            =   "0x00"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   30
      End
      Begin PushButton SendButton
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&Send"
         Default         =   ""
         Enabled         =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpPacket"
         Italic          =   ""
         Left            =   322
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   37
         Underline       =   ""
         Visible         =   True
         Width           =   90
      End
   End
   Begin GroupBox grpField
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Field"
      Enabled         =   True
      Height          =   266
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   440
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   16
      Underline       =   ""
      Visible         =   True
      Width           =   340
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   454
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Data Type:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   40
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   70
      End
      Begin PopupMenu FieldTypeMenu
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpField"
         InitialValue    =   "INT8\r\nINT16\r\nINT32\r\nINT64\r\nSTRING\r\nUINT8\r\nUINT16\r\nUINT32\r\nUINT64\r\n"
         Italic          =   ""
         Left            =   532
         ListIndex       =   -1
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
         Top             =   38
         Underline       =   ""
         Visible         =   True
         Width           =   224
      End
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   454
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         Text            =   "Description:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   70
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   70
      End
      Begin TextField FieldDescription
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   532
         LimitText       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   ""
         ReadOnly        =   ""
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   68
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   224
      End
      Begin Label txtJunk
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   18
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   454
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         Text            =   "Data:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   100
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   70
      End
      Begin TextArea FieldText
         AcceptTabs      =   True
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         Format          =   ""
         Height          =   136
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   532
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
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "Courier New"
         TextSize        =   12
         TextUnit        =   0
         Top             =   98
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   224
      End
      Begin PushButton NewFieldButton
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "&New Field"
         Default         =   ""
         Enabled         =   True
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   666
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   242
         Underline       =   ""
         Visible         =   True
         Width           =   90
      End
      Begin PushButton DeleteFieldButton
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Delete Field"
         Default         =   ""
         Enabled         =   False
         Height          =   24
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "grpField"
         Italic          =   ""
         Left            =   568
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   242
         Underline       =   ""
         Visible         =   True
         Width           =   90
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		Config As Configuration
	#tag EndProperty


#tag EndWindowCode

#tag Events FieldList
	#tag Event
		Sub Change()
		  
		  
		  If Me.ListIndex < 0 Then
		    
		    DeleteFieldButton.Enabled = False
		    FieldTypeMenu.Enabled = False
		    FieldDescription.Enabled = False
		    FieldText.Enabled = False
		    
		    FieldTypeMenu.ListIndex = -1
		    FieldDescription.Text = ""
		    FieldText.Text = ""
		    
		  Else
		    
		    DeleteFieldButton.Enabled = True
		    FieldTypeMenu.Enabled = True
		    FieldDescription.Enabled = True
		    FieldText.Enabled = True
		    
		    For i As Integer = 0 To FieldTypeMenu.ListCount - 1
		      If FieldTypeMenu.List( i ) = Me.Cell( Me.ListIndex, 1 ) Then
		        FieldTypeMenu.ListIndex = i
		        Exit For
		      End If
		    Next
		    
		    FieldDescription.Text = Me.Cell( Me.ListIndex, 3 )
		    FieldText.Text = Me.CellTag( Me.ListIndex, 0 )
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  
		  #pragma Unused newPosition
		  #pragma Unused parentRow
		  
		  FieldsTimer.Reset()
		  
		  Return False
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events FieldsTimer
	#tag Event
		Sub Action()
		  
		  For i As Integer = 0 To FieldList.ListCount - 1
		    FieldList.Cell(i, 0) = Format(i, "-#")
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FieldId
	#tag Event
		Sub LostFocus()
		  
		  Dim v As Double = Val(Me.Text)
		  
		  If v < 0 Then v = 0
		  If v > 255 Then v = 255
		  
		  Me.Text = Format(v, "-#")
		  HexIdText.Text = "0x" + Right( "0" + Hex(v), 2 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FieldIdUpDownArrows
	#tag Event
		Sub Up()
		  
		  Dim v As Double = Val( FieldId.Text ) + 1
		  
		  If v < 0 Then v = 0
		  If v > 255 Then v = 255
		  
		  FieldId.Text = Format(v, "-#")
		  HexIdText.Text = "0x" + Right( "0" + Hex(v), 2 )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  
		  Dim v As Double = Val( FieldId.Text ) - 1
		  
		  If v < 0 Then v = 0
		  If v > 255 Then v = 255
		  
		  FieldId.Text = Format(v, "-#")
		  HexIdText.Text = "0x" + Right( "0" + Hex(v), 2 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SendButton
	#tag Event
		Sub Action()
		  
		  Call MsgBox("NYI", 48, "Error")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewFieldButton
	#tag Event
		Sub Action()
		  
		  FieldList.InsertRow(FieldList.ListIndex + 1, "#")
		  FieldList.Cell(FieldList.LastIndex, 1) = "STRING"
		  FieldList.Cell(FieldList.LastIndex, 2) = "1"
		  FieldList.Cell(FieldList.LastIndex, 3) = "Untitled"
		  
		  For i As Integer = 0 To FieldList.ListCount - 1
		    FieldList.Cell(i, 0) = Format(i, "-#")
		  Next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteFieldButton
	#tag Event
		Sub Action()
		  
		  If FieldList.ListIndex = -1 Then
		    Me.Enabled = False
		    Return
		  End If
		  
		  If FieldList.ListIndex = 0 And FieldList.ListCount > 1 Then
		    FieldList.ListIndex = FieldList.ListIndex + 1
		    FieldList.RemoveRow( FieldList.ListIndex - 1 )
		  Else
		    FieldList.ListIndex = FieldList.ListIndex - 1
		    FieldList.RemoveRow(FieldList.ListIndex + 1)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
