#tag Window
Begin Window ProfilesWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   340
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   340
   MinimizeButton  =   True
   MinWidth        =   640
   Placement       =   0
   Resizeable      =   False
   Title           =   "Profile Manager"
   Visible         =   True
   Width           =   640
   Begin PagePanel Pages
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   257
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   150
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   0
      Value           =   1
      Visible         =   True
      Width           =   490
      Begin Label NoProfileLabels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   14
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   150
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         Text            =   "No profile selected."
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   113
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   490
      End
      Begin Label NoProfileLabels
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   14
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   150
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         Text            =   "Select from the left or click Create."
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   129
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   490
      End
      Begin GroupBox ProfileAliasGroupCtl
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Profile Alias"
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   152
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   4
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin TextField ProfileAliasCtl
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "alias"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "ProfileAliasGroupCtl"
            Italic          =   ""
            Left            =   160
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
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   23
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox BNLSGroupBox
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Battle.Net Logon Server (BNLS)"
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   396
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   4
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin TextField ProfileBnlsHostCtl
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "address"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "BNLSGroupBox"
            Italic          =   ""
            Left            =   404
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
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   23
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin TextField ProfileBnlsPortCtl
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "port"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "BNLSGroupBox"
            Italic          =   ""
            Left            =   568
            LimitText       =   0
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Mask            =   "#####"
            Password        =   ""
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   65535
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   23
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   46
         End
         Begin UpDownArrows ProfileBnlsPortArrowsCtl
            AcceptFocus     =   True
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "BNLSGroupBox"
            Left            =   616
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   22
            Visible         =   True
            Width           =   13
         End
      End
   End
   Begin Separator Separators
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   284
      Visible         =   True
      Width           =   614
   End
   Begin PushButton SaveButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "&Save"
      Default         =   True
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   546
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
      Top             =   302
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton CloseButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Clos&e"
      Default         =   False
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
      Top             =   302
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Listbox ProfileListCtl
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   18
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   257
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   0
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
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   140
      _ScrollWidth    =   -1
   End
   Begin PushButton CreateButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "&Create"
      Default         =   False
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   14
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   302
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton DeleteButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "&Delete"
      Default         =   False
      Enabled         =   False
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   106
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   302
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin SizeGripControl SizeGripControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   257
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   140
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   10
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Self.Reload()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Reload()
		  
		  Dim i, ub As Integer
		  Dim p As Configuration
		  
		  Self.ProfileListCtl.DeleteAllRows()
		  
		  i = 0
		  ub = UBound( App.config.profiles )
		  
		  While i <= ub
		    p = App.config.profiles( i )
		    
		    Self.ProfileListCtl.AddRow( p.alias )
		    Self.ProfileListCtl.RowTag( Self.ProfileListCtl.LastIndex ) = p
		    
		    i = i + 1
		  Wend
		  
		  If Self.ProfileListCtl.ListCount > 0 Then
		    Self.ProfileListCtl.ListIndex = 0
		  Else
		    Self.CreateButtonCtl.SetFocus()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReloadProfile()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  Self.ProfileAliasCtl.Text = p.alias
		  Self.ProfileBnlsHostCtl.Text = p.bnlsHost
		  Self.ProfileBnlsPortCtl.Text = Format( p.bnlsPort, "-#" )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Resave()
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Pages
	#tag Event
		Sub Change()
		  
		  Select Case Me.Value
		  Case 0
		    // No profile selected
		    
		  Case 1
		    // Profile editor
		    Self.ReloadProfile()
		    
		  Case Else
		    // Unsupported
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileAliasCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.alias = Me.Text
		  
		  Self.ProfileListCtl.Cell( Self.ProfileListCtl.ListIndex, 0 ) = p.alias
		  
		  Dim cl As BNETClient
		  Dim cw As ChatWindow
		  Dim i1, i2, ub1, ub2 As Integer
		  
		  i1 = 0
		  ub1 = REALbasic.WindowCount() - 1
		  
		  While i1 <= ub1
		    If REALbasic.Window( i1 ) IsA ChatWindow Then
		      cw = ChatWindow( REALbasic.Window( i1 ))
		      
		      i2 = 0
		      ub2 = cw.ChatContainerList.ListCount - 1
		      
		      While i2 <= ub2
		        cl = cw.ChatContainerList.RowTag( i2 )
		        If cl.config = p Then
		          
		          cw.ChatContainerList.Cell( i2, 0 ) = p.alias
		          Exit While
		          
		        End If
		        i2 = i2 + 1
		      Wend
		    End If
		    i1 = i1 + 1
		  Wend
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileBnlsHostCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.bnlsHost = Me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileBnlsPortCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.bnlsPort = Val( Me.Text )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileBnlsPortArrowsCtl
	#tag Event
		Sub Up()
		  
		  Dim port As Integer = Val( Self.ProfileBnlsPortCtl.Text )
		  
		  port = port + 1
		  
		  If port < 1 Then port = 1
		  If port > 65535 Then port = 65535
		  
		  Self.ProfileBnlsPortCtl.Text = Format( port, "-#" )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  
		  Dim port As Integer = Val( Self.ProfileBnlsPortCtl.Text )
		  
		  port = port - 1
		  
		  If port < 1 Then port = 1
		  If port > 65535 Then port = 65535
		  
		  Self.ProfileBnlsPortCtl.Text = Format( port, "-#" )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButtonCtl
	#tag Event
		Sub Action()
		  
		  Self.Resave()
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseButtonCtl
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileListCtl
	#tag Event
		Sub Change()
		  
		  If Me.ListIndex = -1 Then
		    Self.Pages.Value = 0
		  Else
		    Self.Pages.Value = 1
		  End If
		  
		  Self.DeleteButtonCtl.Enabled = ( Me.ListIndex <> -1 )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SizeGripControl1
	#tag Event
		Sub Open()
		  
		  Me.Direction = SizeGripControl.DirectionType.Vertical
		  
		  Me.Attach( Self.ProfileListCtl )
		  Me.Attach( Self.Pages )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MoveControl(c As RectControl, dX As Integer, dY As Integer)
		  
		  #pragma Unused dY
		  
		  Select Case c
		  Case Self.ProfileListCtl
		    
		    c.Width = c.Width + dX
		    
		  Case Self.Pages
		    
		    c.Left = c.Left + dX
		    c.Width = c.Width - dX
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
