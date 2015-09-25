#tag Window
Begin Window wMain
   BackColor       =   "#Colors.UI.WindowBackColor"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   467097599
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   800
   Placement       =   2
   Resizeable      =   True
   Title           =   "BNRBot v2"
   Visible         =   True
   Width           =   800
   Begin Listbox lstProfiles
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   22
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   400
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
      UseFocusRing    =   False
      Visible         =   True
      Width           =   150
      _ScrollWidth    =   -1
   End
   Begin Listbox lstUsers
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   56
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   15
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   318
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   576
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   ""
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   41
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   210
      _ScrollWidth    =   -1
   End
   Begin TextArea fldData
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   345
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   164
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
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   400
   End
   Begin Label txtChannel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   576
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Offline"
      TextAlign       =   1
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   210
   End
   Begin Timer lstUsersTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   -32
      LockedInPosition=   False
      Mode            =   0
      Period          =   75
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin TextArea fldInput
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   False
      AutomaticallyCheckSpelling=   True
      BackColor       =   "#Colors.UI.ControlBackColor"
      Bold            =   ""
      Border          =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   15
      HelpTag         =   ""
      HideSelection   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   164
      LimitText       =   0
      LineHeight      =   0
      LineSpacing     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   ""
      Mask            =   ""
      Multiline       =   False
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   371
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   622
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  
		  #pragma Unused appQuitting
		  
		  Dim i As Integer = UBound(Settings.Configurations)
		  While i >= 0
		    If Settings.Configurations(i) <> Nil And Settings.Configurations(i).BNET <> Nil And _
		      Settings.Configurations(i).BNET.IsConnected = True Then Exit While
		      i = i - 1
		  Wend
		  If i < 0 Then Return False
		  
		  i = MsgBox("There is at least one profile that is still connected to Battle.net." + EndOfLine + _
		  EndOfLine + "Are you sure you wish to exit?", 305, "BNRBot v2 - Still Connected")
		  
		  Return (i = 2 Or i = 3 Or i = 7)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  
		  If Globals.wConfig_Open = True Then wConfig.Close()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Return Self.HandleKeyDown(Key)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Maximize()
		  
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  
		  Self.mMinimized = True
		  
		  If Settings.PrefMinimizeToTray = True Then Self.Hide()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.Title = App.VersionString()
		  Me.LoadProfileList()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused g
		  
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
		  
		  Self.mMinimized = False
		  Self.Refresh(True)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Activate()
		  
		  #If TargetWin32 = False Then Return
		  
		  Soft Declare Function SetActiveWindow Lib "User32" (hWnd As Integer) As Integer
		  Soft Declare Function SetForegroundWindow Lib "User32" (hWnd As Integer) As Integer
		  
		  Call SetActiveWindow(Me.Handle)
		  Call SetForegroundWindow(Me.Handle)
		  
		End Sub
	#tag EndMethod

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
		      
		      If (RC IsA TextArea Or RC IsA TextField Or RC IsA ListBox Or RC = Me.txtChannel) And RC.Visible = True Then
		        g.ForeColor = Colors.UI.ControlBorderColor
		        
		        g.DrawLine(X + W, Y - 1, X + W, Y + H) // Right
		        If RC <> Me.lstProfiles Then
		          g.DrawLine(X - 1, Y - 1, X - 1, Y + H) // Left
		          g.DrawLine(X - 1, Y - 1, X + W, Y - 1) // Top
		          g.DrawLine(X - 1, Y + H, X + W, Y + H) // Bottom
		        End If
		        
		      End If
		    End If
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleKeyDown(Key As String) As Boolean
		  
		  Dim Config As Configuration
		  If Me.SelectedConfig >= 0 And Me.SelectedConfig <= UBound(Settings.Configurations) _
		    Then Config = Settings.Configurations(Me.SelectedConfig) Else Config = Nil
		    
		    Select Case Asc(Key)
		    Case &H09 // Tab
		      
		      If Keyboard.ControlKey = True And Asc(Key) = 9 Then
		        If Keyboard.ShiftKey = False Then
		          If lstProfiles.ListIndex = lstProfiles.ListCount - 1 Then
		            lstProfiles.ListIndex = 0
		          Else
		            lstProfiles.ListIndex = lstProfiles.ListIndex + 1
		          End If
		        Else
		          If lstProfiles.ListIndex = 0 Then
		            lstProfiles.ListIndex = lstProfiles.ListCount - 1
		          Else
		            lstProfiles.ListIndex = lstProfiles.ListIndex - 1
		          End If
		        End If
		      End If
		      
		    Case &HC8 // F1
		      
		      If Config <> Nil And Config.BNET <> Nil Then Config.BNET.DoReconnect()
		      
		    Case &HC9 // F2
		      
		      If Config <> Nil And Config.BNET <> Nil Then Config.BNET.DoDisconnect()
		      
		    Case &HCA // F3
		      
		      wConfig.Show()
		      
		    Case &HCB // F4
		      
		      If Keyboard.AltKey = True Then Return False // Alt + F4 lololol
		      If Config <> Nil Then Config.ClearChat(False)
		      
		    Case Else
		      
		      Return False
		      
		    End Select
		    
		    Return True
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsConfigSelected(Config As Configuration) As Boolean
		  
		  Return (Me.SelectedConfig >= 0 And Me.SelectedConfig <= UBound(Settings.Configurations) _
		  And Settings.Configurations(Me.SelectedConfig) = Config)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProfileList()
		  
		  Me.SelectConfig(-1)
		  lstProfiles.DeleteAllRows()
		  
		  Dim i As Integer = 0
		  While i <= UBound(Settings.Configurations)
		    If Settings.Configurations(i) <> Nil Then
		      lstProfiles.AddRow(Settings.Configurations(i).Name)
		      lstProfiles.CellTag(lstProfiles.LastIndex, 0) = i
		      i = i + 1
		    Else
		      Settings.Configurations.Remove(i)
		    End If
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lstUsers_Viewing_Channel() As Boolean
		  
		  Select Case Me.lstUsers_View
		  Case Me.lstUsers_View_Channel_Entry
		  Case Me.lstUsers_View_Channel_Name
		  Case Me.lstUsers_View_Channel_Game
		  Case Me.lstUsers_View_Channel_Flags
		  Case Me.lstUsers_View_Channel_Ping
		  Case Me.lstUsers_View_Channel_Activity
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lstUsers_Viewing_ChannelList() As Boolean
		  
		  Select Case Me.lstUsers_View
		  Case Me.lstUsers_View_ChannelList_Entry
		  Case Me.lstUsers_View_ChannelList_Name
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lstUsers_Viewing_Clan() As Boolean
		  
		  Select Case Me.lstUsers_View
		  Case Me.lstUsers_View_Clan_Entry
		  Case Me.lstUsers_View_Clan_Name
		  Case Me.lstUsers_View_Clan_Status
		  Case Me.lstUsers_View_Clan_Rank
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lstUsers_Viewing_Friends() As Boolean
		  
		  Select Case Me.lstUsers_View
		  Case Me.lstUsers_View_Friends_Entry
		  Case Me.lstUsers_View_Friends_Name
		  Case Me.lstUsers_View_Friends_Game
		  Case Me.lstUsers_View_Friends_Status
		  Case Me.lstUsers_View_Friends_Location
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function lstUsers_ViewIsFriends(View As Integer) As Boolean
		  
		  Select Case View
		  Case Me.lstUsers_View_Friends_Entry
		  Case Me.lstUsers_View_Friends_Name
		  Case Me.lstUsers_View_Friends_Game
		  Case Me.lstUsers_View_Friends_Status
		  Case Me.lstUsers_View_Friends_Location
		  Case Else
		    Return False
		  End Select
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectConfig(Index As Integer)
		  
		  If Me.SelectedConfig >= 0 And Me.SelectedConfig <= UBound(Settings.Configurations) And Index <> Me.SelectedConfig Then
		    Settings.Configurations(Me.SelectedConfig).CacheInputMessage = Me.fldInput.Text
		    Settings.Configurations(Me.SelectedConfig).RTFField = Nil
		  End If
		  
		  If Me.lstProfiles.ListIndex <> Index Then Me.lstProfiles.ListIndex = Index
		  Me.SelectedConfig = Index
		  
		  If Index < 0 Or Index > UBound(Settings.Configurations) Or _
		    (Index >= 0 And Index <= UBound(Settings.Configurations) And Settings.Configurations(Index) = Nil) Then
		    Me.SelectNoConfig()
		    Return
		  End If
		  
		  Dim Config As Configuration = Settings.Configurations(Index)
		  Config.CacheChatUnread = False
		  Config.RTFField = Me.fldData
		  Me.fldData.StyledText = Config.RTFData
		  Me.fldData.SelStart = Len(Me.fldData.Text)
		  Me.fldInput.Text = Config.CacheInputMessage
		  If Me.fldInput.ReadOnly = True Then Me.fldInput.ReadOnly = False
		  Me.lstUsers_View = Config.CachelstUsers_View
		  
		  // Apparently REALbasic is gay as fuck and both .Refresh and .Invalidate will
		  // not actually touch the ListBox (RectControl) so that it will redraw, so
		  // I'm using the little cheat:
		  Dim i As Integer = Me.lstProfiles.DefaultRowHeight
		  Me.lstProfiles.DefaultRowHeight = 0
		  Me.lstProfiles.DefaultRowHeight = i
		  
		  Config.AddChat(True, Colors.SkyBlue, "Profile selected." + EndOfLine)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectNoConfig()
		  
		  Me.SelectedConfig = -1
		  If Me.lstProfiles.ListIndex <> Me.SelectedConfig Then Me.lstProfiles.ListIndex = Me.SelectedConfig
		  
		  Me.fldData.Text = ""
		  Me.fldData.SelText = "BNRBot is not currently selected on a loaded profile." + EndOfLine + EndOfLine + _
		  "If you have not yet created a profile, right-click the list on the far left and " + _
		  "choose Configure. This will open the profile configuration dialog to which you can " + _
		  "add and remove profiles. The list on the far left will get updated when you do this." + _
		  EndOfLine + EndOfLine + "Global Hotkeys:" + EndOfLine + _
		  "F1 -- Reconnect the currently selected profile." + EndOfLine + _
		  "F2 -- Disconnect the currently selected profile." + EndOfLine + _
		  "F3 -- Open the configuration dialog." + EndOfLine + _
		  "F4 -- Clear the chat screen of the currently selected profile." + EndOfLine + _
		  "// -- In chat, allows access to internal commands." + EndOfLine + EndOfLine
		  If Len(Settings.FileCheckResults) > 0 Then
		    Me.fldData.SelTextColor = Colors.Red
		    Me.fldData.SelBold = True
		    Me.fldData.SelText = Settings.FileCheckResults + EndOfLine + EndOfLine + ""
		  End If
		  If Len(Settings.LoadErrors) > 0 Then
		    Me.fldData.SelTextColor = Colors.Red
		    Me.fldData.SelBold = True
		    Me.fldData.SelText = Settings.LoadErrors + EndOfLine + EndOfLine + ""
		  End If
		  If Len(Settings.SaveErrors) > 0 Then
		    Me.fldData.SelTextColor = Colors.Red
		    Me.fldData.SelBold = True
		    Me.fldData.SelText = Settings.SaveErrors + EndOfLine + EndOfLine + ""
		  End If
		  Me.txtChannel.Text = "No Profile Selected"
		  Me.lstUsers.DeleteAllRows()
		  Me.fldInput.Text = ""
		  Me.fldInput.ReadOnly = True
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  If Me.SelectedConfig >= 0 And Me.SelectedConfig <= UBound(Settings.Configurations) Then _
			  Return Settings.Configurations(Me.SelectedConfig).CachelstUsers_View Else _
			  Return 0
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Dim Config As Configuration
			  If Me.SelectedConfig >= 0 And Me.SelectedConfig <= UBound(Settings.Configurations) Then
			    Config = Settings.Configurations(Me.SelectedConfig)
			    Config.CachelstUsers_LastView = Config.CachelstUsers_View
			    Config.CachelstUsers_View = value
			  End If
			  
			  If Config = Nil Then
			    If Me.SelectedConfig <> -1 Then Me.SelectNoConfig()
			    Return
			  End If
			  
			  lstUsers.DeleteAllRows()
			  Dim sChannelText As String
			  
			  If Config.BNET <> Nil And Config.BNET.IsConnected = True Then
			    If LenB(Config.BNET.UniqueName) <= 0 Then
			      sChannelText = "Please Wait..."
			    Else
			      sChannelText = "Online"
			    End If
			  Else
			    sChannelText = "Offline"
			  End If
			  
			  If sChannelText <> "Online" Then
			    If lstUsers.ListCount > 0 Then sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    txtChannel.Text = sChannelText
			    Return
			  End If
			  
			  Dim i As Integer
			  
			  Dim Users(), User As Dictionary
			  Dim Times() As Double, Names(), Products() As String, Statuses() As UInt32
			  Dim Product As String
			  Dim sTmp1 As String
			  Dim dwTmp1 As UInt32
			  
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_CHAT, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_D2DV, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_D2XP, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_DRTL, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_DSHR, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_JSTR, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_SEXP, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_SSHR, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_STAR, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_W2BN, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_W3DM, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_W3XP, True))
			  Products.Append(MemClass.WriteDWORD(Packets.BNETProduct_WAR3, True))
			  Products.Append(MemClass.WriteDWORD(0, True))
			  
			  If Self.lstUsers_Viewing_Channel() = True Then
			    lstUsers.ColumnCount = 2
			    lstUsers.ColumnWidths = "56"
			    sChannelText = Config.BNET.ChannelName
			    If Config.BNET.ChannelUsers = Nil Then Return
			  ElseIf Self.lstUsers_Viewing_Friends() = True Then
			    lstUsers.ColumnCount = 2
			    lstUsers.ColumnWidths = "30"
			    If Config.BNET.FriendsList <> Nil Then
			      sChannelText = Str(Config.BNET.FriendsList.Count) + " friend"
			      If Config.BNET.FriendsList.Count <> 1 Then sChannelText = sChannelText + "s"
			    Else
			      sChannelText = "0 friends"
			    End If
			    If Self.lstUsers_ViewIsFriends(Config.CachelstUsers_LastView) = False Then _
			    Config.BNET.Send(Packets.CreateSID_FRIENDSLIST())
			  ElseIf Self.lstUsers_Viewing_Clan() = True Then
			    lstUsers.ColumnCount = 2
			    lstUsers.ColumnWidths = "30"
			    If Config.BNET.ClanMembers <> Nil Then
			      sChannelText = Str(Config.BNET.ClanMembers.Count) + " clan member"
			      If Config.BNET.ClanMembers.Count <> 1 Then sChannelText = sChannelText + "s"
			    Else
			      sChannelText = "0 clan members"
			      Return
			    End If
			  ElseIf Self.lstUsers_Viewing_ChannelList() = True Then
			    lstUsers.ColumnCount = 1
			    lstUsers.ColumnWidths = "100%"
			    sChannelText = Str(UBound(Config.BNET.Channels) + 1) + " channel"
			    If UBound(Config.BNET.Channels) <> 0 Then sChannelText = sChannelText + "s"
			  End If
			  
			  Select Case value
			  Case Me.lstUsers_View_Channel_Entry
			    
			    i = 0
			    While i < Config.BNET.ChannelUsers.Count
			      User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			      
			      Times.Append(User.Value("TimeEntered"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Times.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow("")
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			      User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			      User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Name
			    
			    i = 0
			    While i < Config.BNET.ChannelUsers.Count
			      User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			      
			      Names.Append(User.Value("Username"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Names.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow("")
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			      User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			      User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Game
			    
			    For Each Product In Products()
			      i = 0
			      While i < Config.BNET.ChannelUsers.Count
			        User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			        
			        If StrComp(Product, MidB(User.Value("Statstring"), 1, 4), 0) = 0 Then
			          lstUsers.AddRow("")
			          lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			          lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			          lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			          lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			          lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			          User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			          User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			        End If
			        
			        i = i + 1
			      Wend
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Flags
			    
			    // 0x01      0x08          0x04        0x02
			    Dim Admins(), Moderators(), Speakers(), Operators() As Dictionary
			    
			    i = 0
			    While i < Config.BNET.ChannelUsers.Count
			      User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			      
			      dwTmp1 = User.Value("Flags")
			      
			      If BitAnd(dwTmp1, &H01) > 0 Then
			        Admins.Append(User)
			        
			      ElseIf BitAnd(dwTmp1, &H08) > 0 Then
			        Moderators.Append(User)
			        
			      ElseIf BitAnd(dwTmp1, &H04) > 0 Then
			        Speakers.Append(User)
			        
			      ElseIf BitAnd(dwTmp1, &H02) > 0 Then
			        Operators.Append(User)
			        
			      Else
			        Users.Append(User)
			        
			      End If
			      
			      i = i + 1
			    Wend
			    
			    For Each User In Speakers
			      Users.Insert(0, User)
			    Next
			    For Each User In Operators
			      Users.Insert(0, User)
			    Next
			    For Each User In Moderators
			      Users.Insert(0, User)
			    Next
			    For Each User In Admins
			      Users.Insert(0, User)
			    Next
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow("")
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			      User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			      User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Ping
			    
			    Dim Pings() As UInt32
			    
			    i = 0
			    While i < Config.BNET.ChannelUsers.Count
			      User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			      
			      Pings.Append(User.Value("Ping"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Pings.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow("")
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			      User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			      User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Activity
			    
			    i = 0
			    While i < Config.BNET.ChannelUsers.Count
			      User = Config.BNET.ChannelUsers.Value(Config.BNET.ChannelUsers.Key(i))
			      
			      Times.Append(User.Value("LastMessageTime"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Times.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow("")
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForChannel(_
			      User.Value("Username"), MemClass.ReadDWORD(User.Value("Statstring"), 1, True), _
			      User.Value("Flags").IntegerValue, User.Value("Ping").IntegerValue, User.Value("Statstring"))
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Friends_Entry
			    
			    i = 0
			    While i < Config.BNET.FriendsList.Count
			      User = Config.BNET.FriendsList.Value(Config.BNET.FriendsList.Key(i))
			      
			      lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForFriends(_
			      User.Value("Username"), User.Value("Product"), User.Value("Status"), _
			      User.Value("Location"), User.Value("Location Name"))
			      
			      i = i + 1
			    Wend
			    
			  Case Me.lstUsers_View_Friends_Name
			    
			    i = 0
			    While i < Config.BNET.FriendsList.Count
			      User = Config.BNET.FriendsList.Value(Config.BNET.FriendsList.Key(i))
			      
			      Names.Append(User.Value("Username"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Names.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForFriends(_
			      User.Value("Username"), User.Value("Product"), User.Value("Status"), _
			      User.Value("Location"), User.Value("Location Name"))
			      
			    Next
			    
			  Case Me.lstUsers_View_Friends_Game
			    
			    For Each Product In Products()
			      i = 0
			      While i < Config.BNET.FriendsList.Count
			        User = Config.BNET.FriendsList.Value(Config.BNET.FriendsList.Key(i))
			        
			        If StrComp(Product, MemClass.WriteDWORD(User.Value("Product"), True), 0) = 0 Then
			          lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			          lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			          lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			          lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			          lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			          lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForFriends(_
			          User.Value("Username"), User.Value("Product"), User.Value("Status"), _
			          User.Value("Location"), User.Value("Location Name"))
			        End If
			        
			        i = i + 1
			      Wend
			    Next
			    
			  Case Me.lstUsers_View_Friends_Status
			    
			    i = 0
			    While i < Config.BNET.FriendsList.Count
			      User = Config.BNET.FriendsList.Value(Config.BNET.FriendsList.Key(i))
			      
			      Statuses.Append(User.Value("Status"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Statuses.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForFriends(_
			      User.Value("Username"), User.Value("Product"), User.Value("Status"), _
			      User.Value("Location"), User.Value("Location Name"))
			      
			    Next
			    
			  Case Me.lstUsers_View_Friends_Location
			    
			    // Statuses() is reused as the Locations() instead.
			    
			    i = 0
			    While i < Config.BNET.FriendsList.Count
			      User = Config.BNET.FriendsList.Value(Config.BNET.FriendsList.Key(i))
			      
			      Statuses.Append(User.Value("Location"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Statuses.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForFriends(_
			      User.Value("Username"), User.Value("Product"), User.Value("Status"), _
			      User.Value("Location"), User.Value("Location Name"))
			      
			    Next
			    
			  Case Me.lstUsers_View_Clan_Entry
			    
			    i = 0
			    While i < Config.BNET.ClanMembers.Count
			      User = Config.BNET.ClanMembers.Value(Config.BNET.ClanMembers.Key(i))
			      
			      lstUsers.AddRow(Str(User.Value("Rank")))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForClan(_
			      User.Value("Username"), User.Value("Rank"), User.Value("Status"), User.Value("Location"))
			      
			      i = i + 1
			    Wend
			    
			  Case Me.lstUsers_View_Clan_Name
			    
			    i = 0
			    While i < Config.BNET.ClanMembers.Count
			      User = Config.BNET.ClanMembers.Value(Config.BNET.ClanMembers.Key(i))
			      
			      Names.Append(User.Value("Username"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Names.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(Str(User.Value("Rank")))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForClan(_
			      User.Value("Username"), User.Value("Rank"), User.Value("Status"), User.Value("Location"))
			      
			    Next
			    
			  Case Me.lstUsers_View_Clan_Status
			    
			    i = 0
			    While i < Config.BNET.ClanMembers.Count
			      User = Config.BNET.ClanMembers.Value(Config.BNET.ClanMembers.Key(i))
			      
			      Statuses.Append(User.Value("Status"))
			      Users.Append(User)
			      
			      i = i + 1
			    Wend
			    
			    Statuses.SortWith(Users)
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(Str(User.Value("Rank")))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForClan(_
			      User.Value("Username"), User.Value("Rank"), User.Value("Status"), User.Value("Location"))
			      
			    Next
			    
			  Case Me.lstUsers_View_Clan_Rank
			    
			    Dim Others(), Chieftains(), Shamans(), Grunts(), Peons(), Initiates() As Dictionary
			    
			    i = 0
			    While i < Config.BNET.ClanMembers.Count
			      User = Config.BNET.ClanMembers.Value(Config.BNET.ClanMembers.Key(i))
			      
			      Select Case User.Value("Rank")
			      Case &H00
			        Initiates.Append(User)
			        
			      Case &H01
			        Peons.Append(User)
			        
			      Case &H02
			        Grunts.Append(User)
			        
			      Case &H03
			        Shamans.Append(User)
			        
			      Case &H04
			        Chieftains.Append(User)
			        
			      Case Else
			        Others.Append(User)
			        
			      End Select
			      
			      i = i + 1
			    Wend
			    
			    For Each User In Chieftains
			      Users.Append(User)
			    Next
			    For Each User In Shamans
			      Users.Append(User)
			    Next
			    For Each User In Grunts
			      Users.Append(User)
			    Next
			    For Each User In Peons
			      Users.Append(User)
			    Next
			    For Each User In Initiates
			      Users.Append(User)
			    Next
			    For Each User In Others
			      Users.Append(User)
			    Next
			    
			    For Each User In Users()
			      
			      lstUsers.AddRow(Str(User.Value("Rank")))
			      lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			      lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location")
			      lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			      lstUsers.CellHelpTag(lstUsers.LastIndex, 1) = Globals.GetUserHelpTagForClan(_
			      User.Value("Username"), User.Value("Rank"), User.Value("Status"), User.Value("Location"))
			      
			    Next
			    
			  Case Me.lstUsers_View_ChannelList_Entry
			    
			    For Each sTmp1 In Config.BNET.Channels
			      
			      lstUsers.AddRow(sTmp1)
			      
			    Next
			    
			  Case Me.lstUsers_View_ChannelList_Name
			    
			    For Each sTmp1 In Config.BNET.Channels
			      
			      Names.Append(sTmp1)
			      
			    Next
			    
			    Names.Sort()
			    
			    For Each sTmp1 In Names()
			      
			      lstUsers.AddRow(sTmp1)
			      
			    Next
			    
			  End Select
			  
			  txtChannel.Text = sChannelText
			  
			End Set
		#tag EndSetter
		lstUsers_View As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mMinimized
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mMinimized = value
			  
			  If value = True Then
			    Me.Minimize()
			  Else
			    Me.Restore()
			  End If
			  
			End Set
		#tag EndSetter
		Minimized As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMinimized As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedConfig As Integer
	#tag EndProperty


	#tag Constant, Name = lstUsers_View_ChannelList_Entry, Type = Double, Dynamic = False, Default = \"&H0F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_ChannelList_Name, Type = Double, Dynamic = False, Default = \"&H10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Activity, Type = Double, Dynamic = False, Default = \"&H05", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Entry, Type = Double, Dynamic = False, Default = \"&H00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Flags, Type = Double, Dynamic = False, Default = \"&H03", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Game, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Name, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Channel_Ping, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Clan_Entry, Type = Double, Dynamic = False, Default = \"&H0B", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Clan_Name, Type = Double, Dynamic = False, Default = \"&H0C", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Clan_Rank, Type = Double, Dynamic = False, Default = \"&H0E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Clan_Status, Type = Double, Dynamic = False, Default = \"&H0D", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Friends_Entry, Type = Double, Dynamic = False, Default = \"&H06", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Friends_Game, Type = Double, Dynamic = False, Default = \"&H08", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Friends_Location, Type = Double, Dynamic = False, Default = \"&H0A", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Friends_Name, Type = Double, Dynamic = False, Default = \"&H07", Scope = Public
	#tag EndConstant

	#tag Constant, Name = lstUsers_View_Friends_Status, Type = Double, Dynamic = False, Default = \"&H09", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events lstProfiles
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  #pragma Unused column
		  
		  Dim Config As Configuration = Nil
		  Dim Icon As Picture = Nil
		  
		  If row >= 0 And row < Me.ListCount Then
		    Config = Settings.Configurations(Me.CellTag(row, 0))
		    Icon = Globals.GetProductIcon(Config.Product)
		  End If
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = Colors.UI.ListSelectionColor
		  Else
		    g.ForeColor = Colors.UI.ControlBackColor
		  End If
		  
		  If Config <> Nil And Config.BNET.IsConnected = True Then
		    g.ForeColor = ColorMix(g.ForeColor, &c00FF00, -2)
		  ElseIf Config <> Nil And Config.BNET.IsConnected = False Then
		    g.ForeColor = ColorMix(g.ForeColor, &CFF0000, -2)
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  If Icon <> Nil Then g.DrawPicture(Icon, 2, g.Height / 2 - Icon.Height / 2)
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  Dim Config As Configuration = Nil
		  If row > -1 Then Config = Settings.Configurations(Me.CellTag(row, 0))
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = Colors.UI.ControlBackColor
		  Else
		    g.ForeColor = Colors.UI.ListSelectionColor
		  End If
		  
		  If Config <> Nil And Config.BNET.IsConnected = True Then
		    g.ForeColor = ColorMix(g.ForeColor, &c00FF00, -2)
		  ElseIf Config <> Nil And Config.BNET.IsConnected = False Then
		    g.ForeColor = ColorMix(g.ForeColor, &CFF0000, -2)
		  End If
		  
		  If Config <> Nil And Config.CacheChatUnread = True Then _
		  g.Bold = True Else g.Bold = False
		  
		  If row >= 0 And row < Me.ListCount Then _
		  g.DrawString(Me.Cell(row, column), x + 28, y, g.Width - x * 2 - 28, True)
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  If Me.ListIndex = -1 Then Self.SelectConfig(-1) Else Self.SelectConfig(Me.CellTag(Me.ListIndex, 0))
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  #pragma Unused x
		  #pragma Unused y
		  
		  If base = Nil Then Return False
		  
		  base.Insert(0, New MenuItem("Configure"))
		  base.Insert(1, New MenuItem(base.TextSeparator))
		  base.Insert(2, New MenuItem("Connect All"))
		  base.Insert(3, New MenuItem("Reconnect All"))
		  base.Insert(4, New MenuItem("Disconnect All"))
		  base.Insert(5, New MenuItem(base.TextSeparator))
		  
		  If Me.ListIndex = -1 Then
		    base.Insert(6, New MenuItem("Check for Updates"))
		    base.Insert(7, New MenuItem(base.TextSeparator))
		    base.Insert(8, New MenuItem("Exit"))
		    
		  Else
		    base.Insert(6, New MenuItem(Me.Cell(Me.ListIndex, 0)))
		    base.Item(6).Insert(0, New MenuItem("Connect"))
		    base.Item(6).Insert(1, New MenuItem("Reconnect"))
		    base.Item(6).Insert(2, New MenuItem("Disconnect"))
		    base.Insert(7, New MenuItem(base.TextSeparator))
		    base.Insert(8, New MenuItem("Check for Updates"))
		    base.Insert(9, New MenuItem(base.TextSeparator))
		    base.Insert(10, New MenuItem("Exit"))
		    
		  End If
		  
		  Return (base.Count() > 0)
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  If hitItem = Nil Then Return False
		  Dim Index As Integer
		  
		  Select Case hitItem.Text
		  Case "Configure"
		    wConfig.ShowWithin(Self)
		    
		  Case "Connect All"
		    Globals.ConnectAll()
		    
		  Case "Reconnect All"
		    Globals.ReconnectAll()
		    
		  Case "Disconnect All"
		    Globals.DisconnectAll()
		    
		  Case "Connect"
		    Index = Me.CellTag(Me.ListIndex, 0)
		    If Index >= 0 And Index <= UBound(Settings.Configurations) _
		      And Settings.Configurations(Index).BNET <> Nil Then _
		      Settings.Configurations(Index).BNET.DoConnect()
		      
		  Case "Reconnect"
		    Index = Me.CellTag(Me.ListIndex, 0)
		    If Index >= 0 And Index <= UBound(Settings.Configurations) _
		      And Settings.Configurations(Index).BNET <> Nil Then _
		      Settings.Configurations(Index).BNET.DoReconnect()
		      
		  Case "Disconnect"
		    Index = Me.CellTag(Me.ListIndex, 0)
		    If Index >= 0 And Index <= UBound(Settings.Configurations) _
		      And Settings.Configurations(Index).BNET <> Nil Then _
		      Settings.Configurations(Index).BNET.DoDisconnect()
		      
		  Case "Check for Updates"
		    
		    Dim w As New wUpdater()
		    w.WasAutomatic = False
		    w.Show()
		    
		  Case "Exit", "Quit"
		    Quit(0)
		    
		  Case Else
		    Return False
		    
		  End Select
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lstUsers
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  Dim Config As Configuration
		  If Self.SelectedConfig >= 0 And Self.SelectedConfig <= UBound(Settings.Configurations) Then _
		  Config = Settings.Configurations(Self.SelectedConfig) Else Config = Nil
		  
		  If column = 0 And Self.lstUsers_Viewing_ChannelList() = False Then
		    
		    g.ForeColor = Colors.Black
		    
		  ElseIf row = Me.ListIndex Then
		    
		    If Self.lstUsers_Viewing_Channel() = True Then
		      Dim Flags As UInt32 = Me.CellTag(row, 1)
		      If BitAnd(Flags, &H20) > 0 Then
		        g.ForeColor = Colors.Red
		      ElseIf BitAnd(Flags, &H09) > 0 Then
		        g.ForeColor = Colors.Cyan
		      ElseIf BitAnd(Flags, &H02) > 0 Then
		        g.ForeColor = Colors.White
		      ElseIf BitAnd(Flags, &H04) > 0 Then
		        g.ForeColor = Colors.Yellow
		      Else
		        g.ForeColor = Colors.UI.ListSelectionColor
		      End If
		      
		      If Config <> Nil And Config.BNET <> Nil And Globals.IsFriend(Config.BNET, Me.Cell(row, 1)) = True Then _
		      g.ForeColor = ColorMix(g.ForeColor, Colors.Green, -1)
		      
		    Else
		      
		      g.ForeColor = Colors.UI.ListSelectionColor
		      
		    End If
		    
		  ElseIf row = -1 Then
		  Else
		    
		    g.ForeColor = Colors.UI.ControlBackColor
		    
		    If Self.lstUsers_Viewing_Channel() = True And _
		      Config <> Nil And Config.BNET <> Nil And row >= 0 And row < Me.ListCount And _
		      Globals.IsFriend(Config.BNET, Me.Cell(row, 1)) = True Then _
		      g.ForeColor = ColorMix(g.ForeColor, Colors.Green, -2)
		      
		    End If
		    
		    g.FillRect(0, 0, g.Width, g.Height)
		    
		    If row >= 0 And row < Me.ListCount And column = 0 And Self.lstUsers_Viewing_ChannelList() = False Then
		      Dim Icon As Picture
		      If Self.lstUsers_Viewing_Channel() = True Then
		        Icon = Globals.GetUserIcon(Me.CellTag(row, 1), Me.CellTag(row, 0))
		      ElseIf Self.lstUsers_Viewing_Friends() = True Then
		        Icon = Globals.GetProductIcon(MemClass.ReadDWORD(Me.Cell(row, 0), 1, True))
		      ElseIf Self.lstUsers_Viewing_Clan() = True Then
		        Icon = Globals.GetClanIcon(Val(Me.Cell(row, 0)))
		      End If
		      If Icon <> Nil Then g.DrawPicture(Icon, g.Width / 2 - Icon.Width / 2, g.Height / 2 - Icon.Height / 2)
		    End If
		    
		    Return True
		    
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = Colors.UI.ControlBackColor
		  Else
		    
		    If Self.lstUsers_Viewing_Channel() = True Then
		      Dim Flags As UInt32 = Me.CellTag(row, 1)
		      If BitAnd(Flags, &H20) > 0 Then
		        g.ForeColor = Colors.Red
		      ElseIf BitAnd(Flags, &H09) > 0 Then
		        g.ForeColor = Colors.Cyan
		      ElseIf BitAnd(Flags, &H02) > 0 Then
		        g.ForeColor = Colors.White
		      ElseIf BitAnd(Flags, &H04) > 0 Then
		        g.ForeColor = Colors.Yellow
		      Else
		        g.ForeColor = Colors.UI.ListSelectionColor
		      End If
		    ElseIf Self.lstUsers_Viewing_Friends() = True Then
		      If Me.CellTag(row, 2) = &H00 Then
		        g.ForeColor = Colors.Maroon
		      Else
		        g.ForeColor = Colors.Green
		      End If
		    ElseIf Self.lstUsers_Viewing_Clan() = True Then
		      If Me.CellTag(row, 1) = &H00 Then
		        g.ForeColor = Colors.Maroon
		      Else
		        g.ForeColor = Colors.Green
		      End If
		    Else
		      g.ForeColor = Colors.UI.ListSelectionColor
		    End If
		    
		  End If
		  
		  If row >= 0 And row < Me.ListCount And _
		    ((column <> 0 And Self.lstUsers_Viewing_ChannelList() = False) Or _
		    Self.lstUsers_Viewing_ChannelList() = True) Then _
		    g.DrawString(Me.Cell(row, column), x, y, g.Width - x * 2, True)
		    
		    If row >= 0 And row < Me.ListCount And column = 1 And Self.lstUsers_Viewing_Channel() = True Then
		      Dim Icon As Picture, x2 As Integer = x * 2
		      Icon = Globals.GetLagIcon(Me.CellTag(row, 2), (BitAnd(Me.CellTag(row, 1), 16) = 0))
		      If x2 = 0 Then x2 = 8
		      If Icon <> Nil Then g.DrawPicture(Icon, g.Width - Icon.Width - x2, g.Height / 2 - Icon.Height / 2)
		    End If
		    
		    Return True
		    
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  #If DebugBuild = True Then
		    Me.AddRow("")
		    Me.Cell(Me.LastIndex, 1) = "The_Lynxy@Azeroth"
		    Me.CellTag(Me.LastIndex, 0) = "3RAW 2R3W 0" // Statstring
		    Me.CellTag(Me.LastIndex, 1) = 0 // Flags
		    Me.CellTag(Me.LastIndex, 2) = 0 // Ping
		  #EndIf
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  #pragma Unused x
		  #pragma Unused y
		  
		  If base = Nil Then Return False
		  
		  Dim Config As Configuration
		  If Self.SelectedConfig >= 0 And Self.SelectedConfig <= UBound(Settings.Configurations) Then _
		  Config = Settings.Configurations(Self.SelectedConfig) Else Config = Nil
		  
		  base.Insert(0, New MenuItem("Arrange By"))
		  base.Item(0).Insert(0, New MenuItem("Channel"))
		  base.Item(0).Item(0).Checked = Self.lstUsers_Viewing_Channel()
		  base.Item(0).Item(0).Insert(0, New MenuItem("Sort By Entry"))
		  base.Item(0).Item(0).Item(0).Tag = "Channel"
		  base.Item(0).Item(0).Item(0).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Entry)
		  base.Item(0).Item(0).Insert(1, New MenuItem("Sort By Name"))
		  base.Item(0).Item(0).Item(1).Tag = "Channel"
		  base.Item(0).Item(0).Item(1).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Name)
		  base.Item(0).Item(0).Insert(2, New MenuItem("Sort By Game"))
		  base.Item(0).Item(0).Item(2).Tag = "Channel"
		  base.Item(0).Item(0).Item(2).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Game)
		  base.Item(0).Item(0).Insert(3, New MenuItem("Sort By Flags"))
		  base.Item(0).Item(0).Item(3).Tag = "Channel"
		  base.Item(0).Item(0).Item(3).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Flags)
		  base.Item(0).Item(0).Insert(4, New MenuItem("Sort By Ping"))
		  base.Item(0).Item(0).Item(4).Tag = "Channel"
		  base.Item(0).Item(0).Item(4).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Ping)
		  base.Item(0).Item(0).Insert(5, New MenuItem("Sort By Activity"))
		  base.Item(0).Item(0).Item(5).Tag = "Channel"
		  base.Item(0).Item(0).Item(5).Checked = (Self.lstUsers_View = Self.lstUsers_View_Channel_Activity)
		  base.Item(0).Insert(1, New MenuItem("Friends"))
		  base.Item(0).Item(1).Checked = Self.lstUsers_Viewing_Friends()
		  base.Item(0).Item(1).Insert(0, New MenuItem("Sort By Entry"))
		  base.Item(0).Item(1).Item(0).Tag = "Friends"
		  base.Item(0).Item(1).Item(0).Checked = (Self.lstUsers_View = Self.lstUsers_View_Friends_Entry)
		  base.Item(0).Item(1).Insert(1, New MenuItem("Sort By Name"))
		  base.Item(0).Item(1).Item(1).Tag = "Friends"
		  base.Item(0).Item(1).Item(1).Checked = (Self.lstUsers_View = Self.lstUsers_View_Friends_Name)
		  base.Item(0).Item(1).Insert(2, New MenuItem("Sort By Game"))
		  base.Item(0).Item(1).Item(2).Tag = "Friends"
		  base.Item(0).Item(1).Item(2).Checked = (Self.lstUsers_View = Self.lstUsers_View_Friends_Game)
		  base.Item(0).Item(1).Insert(3, New MenuItem("Sort By Status"))
		  base.Item(0).Item(1).Item(3).Tag = "Friends"
		  base.Item(0).Item(1).Item(3).Checked = (Self.lstUsers_View = Self.lstUsers_View_Friends_Status)
		  base.Item(0).Item(1).Insert(4, New MenuItem("Sort By Location"))
		  base.Item(0).Item(1).Item(4).Tag = "Friends"
		  base.Item(0).Item(1).Item(4).Checked = (Self.lstUsers_View = Self.lstUsers_View_Friends_Location)
		  base.Item(0).Insert(2, New MenuItem("Clan"))
		  base.Item(0).Item(2).Checked = Self.lstUsers_Viewing_Clan()
		  base.Item(0).Item(2).Insert(0, New MenuItem("Sort By Entry"))
		  base.Item(0).Item(2).Item(0).Tag = "Clan"
		  base.Item(0).Item(2).Item(0).Checked = (Self.lstUsers_View = Self.lstUsers_View_Clan_Entry)
		  base.Item(0).Item(2).Insert(1, New MenuItem("Sort By Name"))
		  base.Item(0).Item(2).Item(1).Tag = "Clan"
		  base.Item(0).Item(2).Item(1).Checked = (Self.lstUsers_View = Self.lstUsers_View_Clan_Name)
		  base.Item(0).Item(2).Insert(2, New MenuItem("Sort By Status"))
		  base.Item(0).Item(2).Item(2).Tag = "Clan"
		  base.Item(0).Item(2).Item(2).Checked = (Self.lstUsers_View = Self.lstUsers_View_Clan_Status)
		  base.Item(0).Item(2).Insert(3, New MenuItem("Sort By Rank"))
		  base.Item(0).Item(2).Item(3).Tag = "Clan"
		  base.Item(0).Item(2).Item(3).Checked = (Self.lstUsers_View = Self.lstUsers_View_Clan_Rank)
		  base.Item(0).Insert(3, New MenuItem(base.TextSeparator))
		  base.Item(0).Insert(4, New MenuItem("Channels"))
		  base.Item(0).Item(4).Checked = Self.lstUsers_Viewing_ChannelList()
		  base.Item(0).Item(4).Insert(0, New MenuItem("Sort By Entry"))
		  base.Item(0).Item(4).Item(0).Tag = "Channels"
		  base.Item(0).Item(4).Item(0).Checked = (Self.lstUsers_View = Self.lstUsers_View_ChannelList_Entry)
		  base.Item(0).Item(4).Insert(1, New MenuItem("Sort By Name"))
		  base.Item(0).Item(4).Item(1).Tag = "Channels"
		  base.Item(0).Item(4).Item(1).Checked = (Self.lstUsers_View = Self.lstUsers_View_ChannelList_Name)
		  base.Insert(1, New MenuItem(base.TextSeparator))
		  
		  If Self.lstUsers_Viewing_ChannelList() = True Then
		    
		    If Me.ListIndex <> -1 Then
		      base.Insert(2, New MenuItem("Join Channel"))
		      base.Item(2).Tag = Me.Cell(Me.ListIndex, 0)
		    End If
		    
		  ElseIf Config <> Nil Then
		    
		    Dim AccountName, UniqueName, Statstring As String, Flags As UInt32
		    If Config.BNET <> Nil Then
		      AccountName = Config.BNET.AccountName
		      UniqueName = Config.BNET.UniqueName
		      Statstring = Config.BNET.Statstring
		      Flags = Config.BNET.Flags
		    End If
		    
		    If Self.lstUsers_Viewing_Friends() = True Or Self.lstUsers_Viewing_Clan() = True Then
		      base.Append(New MenuItem("Refresh"))
		      base.Append(New MenuItem(base.TextSeparator))
		    End If
		    
		    If Me.ListIndex <> -1 Then
		      
		      If BitAnd(Flags, &H0B) > 0 Then
		        base.Append(New MenuItem("Designate"))
		        base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		        base.Append(New MenuItem("Ban"))
		        base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem("Kick"))
		        base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		      End If
		      
		      If Me.Cell(Me.ListIndex, 1) <> UniqueName Then
		        If BitAnd(Me.CellTag(Me.ListIndex, 1), &H20) <= 0 Then _
		        base.Append(New MenuItem("Squelch")) Else base.Append(New MenuItem("Unsquelch"))
		        base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		      End If
		      
		      base.Append(New MenuItem("Whisper"))
		      base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		      
		      base.Append(New MenuItem(base.TextSeparator))
		      base.Append(New MenuItem("View Profile"))
		      If Me.Cell(Me.ListIndex, 1) <> UniqueName Then
		        base.Item(base.Count - 1).Tag = MemClass.WriteDWORD(MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True), True) _
		        + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		      Else
		        base.Item(base.Count - 1).Tag = MemClass.WriteDWORD(Config.BNET.Product, True) _
		        + MemClass.WriteCString(AccountName) // Do not use unique name here.
		      End If
		      
		    Else
		      
		      base.Append(New MenuItem("View Profile"))
		      base.Item(base.Count - 1).Tag = MemClass.WriteDWORD(Config.BNET.Product, True) _
		      + MemClass.WriteCString(AccountName) // Do not use unique name here.
		      
		    End If
		    
		    If Globals.IsWarcraftIII(Config.Product) = True Then
		      
		      base.Append(New MenuItem("View Clan Info"))
		      If Me.ListIndex <> -1 And Me.Cell(Me.ListIndex, 1) <> UniqueName Then _
		      base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1) + " " + Me.CellTag(Me.ListIndex, 0) Else _
		      base.Item(base.Count - 1).Tag = AccountName + " " + Statstring
		      
		      If Config.BNET.ClanTag <> 0 Then
		        
		        base.Append(New MenuItem(base.TextSeparator))
		        base.Append(New MenuItem("Leave clan"))
		        If Config.BNET.ClanRank >= 4 Then
		          base.Append(New MenuItem(base.TextSeparator))
		          base.Append(New MenuItem("Disband clan"))
		        End If
		        
		        If Me.ListIndex <> -1 Then
		          base.Append(New MenuItem(base.TextSeparator))
		          If Self.lstUsers_Viewing_Channel() = True And _
		            Globals.IsWarcraftIII(MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True)) = True And _
		            CountFields(Me.CellTag(Me.ListIndex, 0), " ") < 4 And Config.BNET.ClanRank >= 3 Then
		            base.Append(New MenuItem("Send clan invitation"))
		            base.Item(base.Count - 1).Tag = Me.Cell(Me.ListIndex, 1)
		          End If
		          
		          If (Self.lstUsers_Viewing_Clan() = True) Or _
		            (Self.lstUsers_Viewing_Channel() = True And _
		            MemClass.ReadDWORD(NthField(Me.CellTag(Me.ListIndex, 0), " ", 4), 1, True) = Config.BNET.ClanTag) And _
		            Config.BNET.ClanRank >= 3 Then
		            base.Append(New MenuItem("Remove from clan"))
		            base.Item(base.Count - 1).Tag = MemClass.WriteBYTE(Val(Me.Cell(Me.ListIndex, 0))) _
		            + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Append(New MenuItem(base.TextSeparator))
		            base.Append(New MenuItem("Change member's rank"))
		            base.Item(base.Count - 1).Insert(0, New MenuItem("Chieftain"))
		            base.Item(base.Count - 1).Item(0).Tag = MemClass.WriteBYTE(&H04) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count - 1).Insert(1, New MenuItem("Shaman"))
		            base.Item(base.Count - 1).Item(1).Tag = MemClass.WriteBYTE(&H03) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count - 1).Insert(2, New MenuItem("Grunt"))
		            base.Item(base.Count - 1).Item(2).Tag = MemClass.WriteBYTE(&H02) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count - 1).Insert(3, New MenuItem("Peon"))
		            base.Item(base.Count - 1).Item(3).Tag = MemClass.WriteBYTE(&H01) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count - 1).Insert(4, New MenuItem("Initiate"))
		            base.Item(base.Count - 1).Item(4).Tag = MemClass.WriteBYTE(&H00) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            If Self.lstUsers_Viewing_Clan() = True Then
		              base.Item(base.Count - 1).Item(0).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H04)
		              base.Item(base.Count - 1).Item(1).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H03)
		              base.Item(base.Count - 1).Item(2).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H02)
		              base.Item(base.Count - 1).Item(3).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H01)
		              base.Item(base.Count - 1).Item(4).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H00)
		            End If
		          End If
		          
		        End If
		        
		      End If
		      
		    End If
		    
		  End If
		  
		  Return (base.Count() > 0)
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  If hitItem = Nil Then Return False
		  
		  Dim Config As Configuration
		  If Self.SelectedConfig >= 0 And Self.SelectedConfig <= UBound(Settings.Configurations) Then _
		  Config = Settings.Configurations(Self.SelectedConfig) Else Config = Nil
		  
		  Dim sTmp As String
		  
		  Select Case hitItem.Text
		  Case "Sort By Entry"
		    
		    Select Case hitItem.Tag
		    Case "Channel"
		      Self.lstUsers_View = Self.lstUsers_View_Channel_Entry
		    Case "Friends"
		      Self.lstUsers_View = Self.lstUsers_View_Friends_Entry
		    Case "Clan"
		      Self.lstUsers_View = Self.lstUsers_View_Clan_Entry
		    Case "Channels"
		      Self.lstUsers_View = Self.lstUsers_View_ChannelList_Entry
		    End Select
		    
		  Case "Sort By Name"
		    
		    Select Case hitItem.Tag
		    Case "Channel"
		      Self.lstUsers_View = Self.lstUsers_View_Channel_Name
		    Case "Friends"
		      Self.lstUsers_View = Self.lstUsers_View_Friends_Name
		    Case "Clan"
		      Self.lstUsers_View = Self.lstUsers_View_Clan_Name
		    Case "Channels"
		      Self.lstUsers_View = Self.lstUsers_View_ChannelList_Name
		    End Select
		    
		  Case "Sort By Game"
		    
		    Select Case hitItem.Tag
		    Case "Channel"
		      Self.lstUsers_View = Self.lstUsers_View_Channel_Game
		    Case "Friends"
		      Self.lstUsers_View = Self.lstUsers_View_Friends_Game
		    End Select
		    
		  Case "Sort By Flags"
		    
		    Self.lstUsers_View = Self.lstUsers_View_Channel_Flags
		    
		  Case "Sort By Ping"
		    
		    Self.lstUsers_View = Self.lstUsers_View_Channel_Ping
		    
		  Case "Sort By Activity"
		    
		    Self.lstUsers_View = Self.lstUsers_View_Channel_Activity
		    
		  Case "Sort By Status"
		    
		    Select Case hitItem.Tag
		    Case "Friends"
		      Self.lstUsers_View = Self.lstUsers_View_Friends_Status
		    Case "Clan"
		      Self.lstUsers_View = Self.lstUsers_View_Clan_Status
		    End Select
		    
		  Case "Sort By Location"
		    
		    Self.lstUsers_View = Self.lstUsers_View_Friends_Location
		    
		  Case "Sort By Rank"
		    
		    Self.lstUsers_View = Self.lstUsers_View_Clan_Rank
		    
		  Case "Join Channel"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True Then
		      If Config.Product = Packets.BNETProduct_CHAT And Config.VersionByte = &H00 Then
		        Config.BNET.Send("/join " + hitItem.Tag + Chr(13))
		      Else
		        Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H0, hitItem.Tag))
		      End If
		      Self.lstUsers_View = Config.CachelstUsers_LastView
		    End If
		    
		  Case "Refresh"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And LenB(Config.BNET.UniqueName) > 0 Then
		      If Self.lstUsers_Viewing_Friends() = True Then
		        Config.BNET.Send(Packets.CreateSID_FRIENDSLIST())
		      ElseIf Self.lstUsers_Viewing_Clan() = True Then
		        Config.BNET.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		      End If
		    End If
		    
		  Case "Squelch", "Unsquelch", "Ban", "Kick", "Designate"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True Then
		      sTmp = "/" + Lowercase(hitItem.Text) + " " + hitItem.Tag
		      If Config.Product = Packets.BNETProduct_CHAT And Config.VersionByte = &H00 Then
		        Config.BNET.Send(sTmp + Chr(13))
		      Else
		        If Config.EnableUTF8 = False Then
		          Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(sTmp))
		        Else
		          Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(ConvertEncoding(sTmp, Encodings.UTF8)))
		        End If
		      End If
		    End If
		    
		  Case "Whisper"
		    
		    sTmp = "/w " + hitItem.Tag + " "
		    fldInput.SelText = sTmp
		    fldInput.SelStart = fldInput.SelStart + Len(sTmp)
		    fldInput.SetFocus()
		    
		  Case "View Profile"
		    
		    sTmp = hitItem.Tag
		    If Config <> Nil And Config.BNET <> Nil Then _
		    Config.BNET.ViewProfile(MemClass.ReadCString(sTmp, 5), MemClass.ReadDWORD(sTmp, 1, True))
		    
		  Case "View Clan Info"
		    
		    Dim Name As String = NthField(hitItem.Tag, " ", 1)
		    Dim Statstring As String = Mid(hitItem.Tag, Len(Name + " ") + 1)
		    Dim iProduct As UInt32 = MemClass.ReadDWORD(NthField(Statstring, " ", 4), 1, True)
		    
		    If Config <> Nil And Config.BNET <> Nil Then Config.BNET.ViewClanInfo(iProduct, Name)
		    
		  Case "Leave clan"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And Config.BNET.ClanTag <> 0 Then _
		    Globals.ConfirmClanAction(Config, Globals.ClanConfirmLeave)
		    
		  Case "Disband clan"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And Config.BNET.ClanTag <> 0 Then _
		    Globals.ConfirmClanAction(Config, Globals.ClanConfirmDisband)
		    
		  Case "Send clan invitation"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And Config.BNET.ClanTag <> 0 _
		      And hitItem.Tag <> Config.BNET.UniqueName Then
		      Dim Cookie As UInt32 = Globals.GenerateDWORD()
		      Globals.ClanCookies.Value(Cookie) = MemClass.WriteCString(hitItem.Tag)
		      Config.BNET.Send(Packets.CreateSID_CLANINVITATION(Cookie, hitItem.Tag))
		      Config.AddChat(True, Colors.Yellow, "BNET: Inviting ")
		      Config.AddChat(False, Colors.Orange, hitItem.Tag)
		      Config.AddChat(False, Colors.Yellow, " to the clan..." + EndOfLine)
		    End If
		    
		  Case "Remove from clan"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And Config.BNET.ClanTag <> 0 Then
		      sTmp = MemClass.ReadCString(hitItem.Tag, 2)
		      If sTmp <> Config.BNET.UniqueName Then _
		      Globals.ConfirmRemoveClanMember(Config, sTmp, MemClass.ReadBYTE(hitItem.Tag, 1))
		    End If
		    
		  Case "Initiate", "Peon", "Grunt", "Shaman", "Chieftain"
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True And Config.BNET.ClanTag <> 0 _
		      And MemClass.ReadCString(hitItem.Tag, 2) <> Config.BNET.UniqueName Then
		      Dim Cookie As UInt32 = Globals.GenerateDWORD()
		      Globals.ClanCookies.Value(Cookie) = MemClass.WriteCString(MemClass.ReadCString(hitItem.Tag, 2))
		      Config.BNET.Send(Packets.CreateSID_CLANRANKCHANGE(Cookie, MemClass.ReadCString(hitItem.Tag, 2), _
		      MemClass.ReadBYTE(hitItem.Tag, 1)))
		    End If
		    
		  Case Else
		    Return False
		    
		  End Select
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  
		  // Apparently Me.MouseX and Me.MouseY are the same as Self.MouseX and Self.MouseY
		  // So, because of this, we have to take the difference of our Top/Left values to find *our* MouseX/MouseY
		  
		  Dim x As Integer = Self.MouseX - Me.Left
		  Dim y As Integer = Self.MouseY - Me.Top
		  Dim row As Integer = Me.RowFromXY(x, y)
		  If row < 0 Or row >= Me.ListCount Then Return
		  
		  If Self.lstUsers_Viewing_Channel() = True Or _
		    Self.lstUsers_Viewing_Friends() = True Or _
		    Self.lstUsers_Viewing_Clan() = True Then
		    
		    fldInput.SelText = Me.Cell(row, 1)
		    fldInput.SetFocus()
		    
		  ElseIf Self.lstUsers_Viewing_ChannelList() = True THen
		    
		    fldInput.SelText = Me.Cell(row, 0)
		    fldInput.SetFocus()
		    
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstUsersTimer
	#tag Event
		Sub Action()
		  
		  Self.lstUsers_View = Self.lstUsers_View
		  
		  // Apparently REALbasic is gay as fuck and both .Refresh and .Invalidate will
		  // not actually touch the ListBox (RectControl) so that it will redraw, so
		  // I'm using the little cheat:
		  Dim i As Integer = Self.lstProfiles.DefaultRowHeight
		  Self.lstProfiles.DefaultRowHeight = 0
		  Self.lstProfiles.DefaultRowHeight = i
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events fldInput
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  If (Key <> Chr(13) And Key <> Chr(3)) Then Return Self.HandleKeyDown(Key)
		  
		  Dim Config As Configuration
		  If Self.SelectedConfig >= 0 And Self.SelectedConfig <= UBound(Settings.Configurations) Then _
		  Config = Settings.Configurations(Self.SelectedConfig)
		  
		  If Config = Nil Then Return False
		  
		  Dim Lines(), Line As String
		  Lines = Split(ReplaceLineEndings(Me.Text, EndOfLine), EndOfLine)
		  
		  For Each Line In Lines
		    
		    If Left(Line, 2) = "//" Then
		      Globals.InternalCommand(Config, Mid(Line, 3))
		      Continue For
		    End If
		    
		    Line = SafeString(ReplaceAll(Line, Chr(9), "  "), " ")
		    
		    If Config.BNET = Nil Then Continue For
		    If Config.BNET.IsConnected = False Then Continue For
		    If LenB(Config.BNET.UniqueName) < 1 Then Continue For
		    
		    Dim dTmp As Dictionary = Config.BNET.ChannelUsers.Lookup(Config.BNET.UniqueName, Nil)
		    If dTmp <> Nil Then dTmp.Value("LastMessageTime") = Microseconds()
		    
		    Dim s As String
		    If Config.EnableUTF8 = False Then s = Line Else s = ConvertEncoding(Line, Encodings.UTF8)
		    
		    If dTmp <> Nil Then
		      If Left(s, 3) = "/me" Or Left(s, 6) = "/emote" Then
		        dTmp.Value("LastMessageType") = &H17
		        dTmp.Value("LastMessage") = Mid(s, Len(NthField(s, " ", 1) + " ") + 1)
		      ElseIf Left(s, 2) = "/w" Or Left(s, 4) = "/msg" Or Left(s, 8) = "/whisper" Then
		        dTmp.Value("LastMessageType") = &H0A
		        dTmp.Value("LastMessage") = Mid(s, Len(NthField(s, " ", 1) + " " + NthField(s, " ", 2) + " ") + 1)
		      Else
		        dTmp.Value("LastMessageType") = &H05
		        dTmp.Value("LastMessage") = s
		      End If
		    End If
		    
		    Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(s))
		    
		    If Left(Line, 1) <> "/" Then
		      Config.AddChat(True, Colors.Cyan, "<" + Config.BNET.UniqueName + "> ")
		      Config.AddChat(False, Colors.White, Line + EndOfLine)
		      
		      'Else
		      'Config.AddChat(True, Colors.SkyBlue, Line + EndOfLine)
		      
		    End If
		    
		  Next
		  
		  If Self.lstUsers_View = Self.lstUsers_View_Channel_Activity Then _
		  Self.lstUsers_View = Self.lstUsers_View
		  
		  Me.Text = ""
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
