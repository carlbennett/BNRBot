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
   Width           =   670
   Begin PagePanel Pages
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   257
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   170
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Top             =   0
      Value           =   1
      Visible         =   True
      Width           =   500
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
         Left            =   170
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
         Width           =   500
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
         Left            =   170
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
         Width           =   500
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
         Left            =   178
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
         Top             =   12
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
            Left            =   186
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
            Top             =   31
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
         Left            =   422
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
         Top             =   12
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
            Left            =   430
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
            Top             =   31
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
            Left            =   594
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
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   31
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
            Left            =   642
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   30
            Visible         =   True
            Width           =   13
         End
      End
      Begin GroupBox BnetGroupBox
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Battle.net Server"
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   422
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   67
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin TextField ProfileBnetHostCtl
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
            InitialParent   =   "BnetGroupBox"
            Italic          =   ""
            Left            =   430
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
            Top             =   86
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   160
         End
         Begin TextField ProfileBnetPortCtl
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
            InitialParent   =   "BnetGroupBox"
            Italic          =   ""
            Left            =   594
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
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   86
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   46
         End
         Begin UpDownArrows ProfileBnetPortArrowsCtl
            AcceptFocus     =   True
            AutoDeactivate  =   True
            Enabled         =   True
            Height          =   23
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "BnetGroupBox"
            Left            =   642
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Top             =   85
            Visible         =   True
            Width           =   13
         End
      End
      Begin GroupBox BattlenetGameEmulationGroup
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Battle.net Game Emulation"
         Enabled         =   True
         Height          =   50
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   178
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   67
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin PopupMenu ProfileProductCtl
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "BattlenetGameEmulationGroup"
            InitialValue    =   ""
            Italic          =   ""
            Left            =   186
            ListIndex       =   0
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   ""
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   2
            TabStop         =   True
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   86
            Underline       =   ""
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox GameKeysGroup
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Game Keys"
         Enabled         =   True
         Height          =   76
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   178
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   122
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin TextField ProfileGameKeyCtl1
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "game key 1"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GameKeysGroup"
            Italic          =   ""
            Left            =   186
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
            Top             =   141
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
         Begin TextField ProfileGameKeyCtl2
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "game key 2"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GameKeysGroup"
            Italic          =   ""
            Left            =   186
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
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   166
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
      Begin GroupBox CredentialsGroup
         AutoDeactivate  =   True
         Bold            =   True
         Caption         =   "Credentials"
         Enabled         =   True
         Height          =   76
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Pages"
         Italic          =   ""
         Left            =   422
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   2
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   122
         Underline       =   ""
         Visible         =   True
         Width           =   240
         Begin TextField ProfileUsernameCtl
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "username"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CredentialsGroup"
            Italic          =   ""
            Left            =   430
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
            Top             =   141
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
         Begin TextField ProfilePasswordCtl
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "password"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CredentialsGroup"
            Italic          =   ""
            Left            =   430
            LimitText       =   0
            LockBottom      =   ""
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Mask            =   ""
            Password        =   True
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   2
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "Arial"
            TextSize        =   12
            TextUnit        =   0
            Top             =   166
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   224
         End
      End
   End
   Begin Separator Separators
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   284
      Visible         =   True
      Width           =   644
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
      Left            =   576
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
      Left            =   484
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
      Top             =   302
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Listbox ProfileListCtl
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
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
      Left            =   18
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
      Top             =   18
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
      TabIndex        =   7
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
   Begin Separator Separators
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   276
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   168
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   10
      Visible         =   True
      Width           =   4
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
		  Self.ProfileBnetHostCtl.Text = p.bnetHost
		  Self.ProfileBnetPortCtl.Text = Format( p.bnetPort, "-#" )
		  Self.ProfileGameKeyCtl1.Text = p.gameKey1
		  Self.ProfileGameKeyCtl2.Text = p.gameKey2
		  Self.ProfileUsernameCtl.Text = p.username
		  Self.ProfilePasswordCtl.Text = p.password
		  
		  Dim i As Integer = Self.ProfileProductCtl.ListCount - 1
		  While i >= 0
		    If Self.ProfileProductCtl.RowTag( i ) = p.product Then
		      Self.ProfileProductCtl.ListIndex = i
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  If i < 0 Then Self.ProfileProductCtl.ListIndex = -1
		  
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
#tag Events ProfileBnetHostCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.bnetHost = Me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileBnetPortCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.bnetPort = Val( Me.Text )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileBnetPortArrowsCtl
	#tag Event
		Sub Up()
		  
		  Dim port As Integer = Val( Self.ProfileBnetPortCtl.Text )
		  
		  port = port + 1
		  
		  If port < 1 Then port = 1
		  If port > 65535 Then port = 65535
		  
		  Self.ProfileBnetPortCtl.Text = Format( port, "-#" )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  
		  Dim port As Integer = Val( Self.ProfileBnetPortCtl.Text )
		  
		  port = port - 1
		  
		  If port < 1 Then port = 1
		  If port > 65535 Then port = 65535
		  
		  Self.ProfileBnetPortCtl.Text = Format( port, "-#" )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileProductCtl
	#tag Event
		Sub Open()
		  
		  Me.DeleteAllRows()
		  
		  Me.AddRow( "Chat Gateway Client" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_CHAT
		  
		  Me.AddRow( "Diablo" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_DRTL
		  
		  Me.AddRow( "Diablo Shareware" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_DSHR
		  
		  Me.AddRow( "Diablo II" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_D2DV
		  
		  Me.AddRow( "Diablo II: Lord of Destruction" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_D2XP
		  
		  Me.AddRow( "Starcraft: Brood War" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_SEXP
		  
		  Me.AddRow( "Starcraft: Japanese" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_JSTR
		  
		  Me.AddRow( "Starcraft: Original" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_STAR
		  
		  Me.AddRow( "Starcraft: Shareware" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_SSHR
		  
		  Me.AddRow( "Warcraft II: Battle.net Edition" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_W2BN
		  
		  Me.AddRow( "Warcraft III: Demo" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_W3DM
		  
		  Me.AddRow( "Warcraft III: Reign of Chaos" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_WAR3
		  
		  Me.AddRow( "Warcraft III: The Frozen Throne" )
		  Me.RowTag( Me.ListCount - 1 ) = Battlenet.Product_W3XP
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.product = Me.RowTag( Me.ListIndex )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileGameKeyCtl1
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.gameKey1 = Me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileGameKeyCtl2
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.gameKey2 = Me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfileUsernameCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.username = Me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProfilePasswordCtl
	#tag Event
		Sub TextChange()
		  
		  Dim p As Configuration = Self.ProfileListCtl.RowTag( Self.ProfileListCtl.ListIndex )
		  
		  p.password = Me.Text
		  
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
