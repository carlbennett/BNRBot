#tag Window
Begin Window GameKeysWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   228
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   228
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   228
   MinimizeButton  =   True
   MinWidth        =   432
   Placement       =   3
   Resizeable      =   False
   Title           =   "Game Key Manager"
   Visible         =   True
   Width           =   548
   Begin Listbox KeyList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
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
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   170
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   12
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Courier New"
      TextSize        =   12
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   212
      _ScrollWidth    =   -1
   End
   Begin GroupBox KeyPropertiesGroup
      AutoDeactivate  =   True
      Bold            =   True
      Caption         =   "Key Properties"
      Enabled         =   True
      Height          =   204
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   236
      LockBottom      =   False
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
      Top             =   12
      Underline       =   ""
      Visible         =   True
      Width           =   298
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   ""
         Left            =   248
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
         Text            =   "Key:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   32
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   274
      End
      Begin TextField KeyField
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
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   ""
         Left            =   256
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
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "Courier New"
         TextSize        =   12
         TextUnit        =   0
         Top             =   48
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   266
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   ""
         Left            =   248
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   0
         Text            =   "Product:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   82
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   274
      End
      Begin Label ProductLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   False
         Left            =   256
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   True
         TabIndex        =   3
         TabPanelIndex   =   0
         Text            =   "N/A"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   98
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   266
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   ""
         Left            =   248
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
         Text            =   "Public:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   126
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   274
      End
      Begin Label PublicLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   False
         Left            =   256
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   5
         TabPanelIndex   =   0
         Text            =   "N/A"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   142
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   266
      End
      Begin Label Labels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   3
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   ""
         Left            =   248
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
         Text            =   "Private:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   170
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   274
      End
      Begin Label PrivateLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "KeyPropertiesGroup"
         Italic          =   False
         Left            =   256
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   7
         TabPanelIndex   =   0
         Text            =   "N/A"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   186
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   266
      End
   End
   Begin PushButton AddKeyButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Add Key"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   124
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   194
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin PushButton RemoveKeyButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Remove Key"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   194
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function DuplicateKeyCheck(key As String) As Boolean
		  
		  Dim i As Integer = 0
		  Dim j As Integer = Me.KeyList.ListCount - 1
		  
		  While i <= j
		    If Me.KeyList.Cell(i, 0) = key Then Return True
		    i = i + 1
		  Wend
		  
		  Return False
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Keys() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events KeyList
	#tag Event
		Sub Change()
		  
		  Self.RemoveKeyButton.Enabled = (Me.ListIndex <> -1)
		  
		  If Me.ListIndex = -1 Then
		    
		    Self.KeyField.Text = ""
		    
		  Else
		    
		    Self.KeyField.Text = Me.Cell(Me.ListIndex, 0)
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events KeyField
	#tag Event
		Sub TextChange()
		  
		  Dim gameKey    As String
		  Dim productVal As UInt32
		  Dim publicVal  As UInt32
		  Dim privateVal As MemoryBlock
		  
		  gameKey = Battlenet.strToGameKey(Me.Text)
		  
		  If Battlenet.getKeyData(gameKey, productVal, publicVal, privateVal) = False Then
		    
		    Self.ProductLabel.Text    = "Invalid Key"
		    Self.PublicLabel.Text     = "N/A"
		    Self.PrivateLabel.Text    = "N/A"
		    Self.AddKeyButton.Enabled = False
		    
		  Else
		    
		    Self.ProductLabel.Text = Battlenet.keyProductToStr(Len(gameKey), productVal) + " (Id: " + Format(productVal, "-#") + ")"
		    
		    Self.PublicLabel.Text = Format(publicVal, "-#")
		    
		    If privateVal.Size = 4 Then
		      Self.PrivateLabel.Text = Format(privateVal.UInt32Value(0), "-#")
		    Else
		      Self.PrivateLabel.Text = App.HexString(privateVal)
		    End If
		    
		    Self.AddKeyButton.Enabled = Not Self.DuplicateKeyCheck(gameKey)
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddKeyButton
	#tag Event
		Sub Action()
		  
		  Self.KeyList.AddRow(Battlenet.strToGameKey(Self.KeyField.Text))
		  Self.KeyList.ListIndex = Self.KeyList.LastIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RemoveKeyButton
	#tag Event
		Sub Action()
		  
		  Self.KeyList.RemoveRow(Self.KeyList.ListIndex)
		  Self.KeyList.ListIndex = Self.KeyList.LastIndex
		  
		End Sub
	#tag EndEvent
#tag EndEvents
