#tag Window
Begin Window GameKeysWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   266
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   266
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   266
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
      Height          =   24
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
      Height          =   24
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
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Save"
      Default         =   True
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   454
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   228
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton CancelButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   362
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   228
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Me.Reload()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function DuplicateKeyCheck(key As String) As Integer
		  
		  Dim i As Integer = 0
		  Dim j As Integer = Me.KeyList.ListCount - 1
		  
		  While i <= j
		    If Me.KeyList.Cell(i, 0) = key Then Return i
		    i = i + 1
		  Wend
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Reload()
		  
		  Self.KeyList.DeleteAllRows()
		  
		  Dim i As Integer = 0
		  Dim j As Integer = App.gameKeys.Ubound
		  
		  While i <= j
		    Self.KeyList.AddRow(App.gameKeys(i).KeyString())
		    Self.KeyList.CellTag(Self.KeyList.LastIndex, 0) = App.gameKeys(i)
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Resave()
		  
		  ReDim App.gameKeys(-1)
		  
		  Dim i As Integer = 0
		  Dim j As Integer = Self.KeyList.ListCount - 1
		  
		  While i <= j
		    App.gameKeys.Append(Self.KeyList.CellTag(i, 0))
		    i = i + 1
		  Wend
		  
		End Sub
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
		    Self.KeyField.SelectAll()
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events KeyField
	#tag Event
		Sub TextChange()
		  
		  If Len(Me.Text) = 0 Then
		    
		    Self.ProductLabel.Text    = "N/A"
		    Self.PublicLabel.Text     = "N/A"
		    Self.PrivateLabel.Text    = "N/A"
		    Self.AddKeyButton.Enabled = False
		    
		    Return
		    
		  End If
		  
		  Dim keyObj As GameKey
		  
		  Try
		    keyObj = New GameKey(Me.Text)
		  Catch err As InvalidGameKeyException
		    keyObj = Nil
		  End Try
		  
		  If keyObj = Nil Then
		    
		    Self.ProductLabel.Text    = "Invalid Key"
		    Self.PublicLabel.Text     = "N/A"
		    Self.PrivateLabel.Text    = "N/A"
		    Self.AddKeyButton.Enabled = False
		    
		    Return
		    
		  End If
		  
		  Dim gameKey    As String      = keyObj.KeyString()
		  Dim productVal As UInt32      = keyObj.ProductValue()
		  Dim publicVal  As UInt32      = keyObj.PublicValue()
		  Dim privateVal As MemoryBlock = keyObj.PrivateValue()
		  
		  Self.ProductLabel.Text = Battlenet.keyProductToStr(productVal) + " (Id: " + Format(productVal, "-#") + ")"
		  
		  Self.PublicLabel.Text = Format(publicVal, "-#")
		  
		  If privateVal.Size = 4 Then
		    Self.PrivateLabel.Text = Format(privateVal.UInt32Value(0), "-#")
		  Else
		    Self.PrivateLabel.Text = App.HexString(privateVal)
		  End If
		  
		  Dim exists As Integer = Self.DuplicateKeyCheck(gameKey)
		  
		  Self.AddKeyButton.Enabled = (exists = -1)
		  
		  If exists > -1 And Self.KeyList.ListIndex <> exists Then Self.KeyList.ListIndex = exists
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Dim KeyId As Integer = Asc(Key)
		  
		  If (KeyId = 3 Or KeyId = 13) And Self.AddKeyButton.Enabled Then
		    Self.AddKeyButton.Push()
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events AddKeyButton
	#tag Event
		Sub Action()
		  
		  Dim keyObj As New GameKey(Self.KeyField.Text)
		  
		  Self.KeyList.AddRow(keyObj.KeyString())
		  Self.KeyList.CellTag(Self.KeyList.LastIndex, 0) = keyObj
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
#tag Events SaveButton
	#tag Event
		Sub Action()
		  
		  Self.Resave()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
