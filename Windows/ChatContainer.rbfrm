#tag Window
Begin ContainerControl ChatContainer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   "#Colors.UI.WindowBackColor"
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   True
   Height          =   400
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
   Width           =   649
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
      Height          =   294
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   428
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   64
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   210
      _ScrollWidth    =   -1
   End
   Begin TextArea oChatInput
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
      Height          =   17
      HelpTag         =   ""
      HideSelection   =   False
      Index           =   -2147483648
      Italic          =   ""
      Left            =   11
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   370
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   627
   End
   Begin Rectangle rectChannel
      AutoDeactivate  =   True
      BorderWidth     =   1
      BottomRightColor=   "#Colors.UI.ControlBorderColor"
      Enabled         =   True
      FillColor       =   "#Colors.UI.ControlBackColor"
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   427
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   12
      TopLeftColor    =   "#Colors.UI.ControlBorderColor"
      Visible         =   True
      Width           =   212
      Begin Label txtChannel
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   17
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "rectChannel"
         Italic          =   ""
         Left            =   428
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Offline"
         TextAlign       =   1
         TextColor       =   "#Colors.UI.ControlTextColor"
         TextFont        =   "Arial"
         TextSize        =   12
         TextUnit        =   0
         Top             =   13
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   210
      End
   End
   Begin UIButton btnChannelView
      AcceptFocus     =   True
      AcceptTabs      =   True
      ActiveColor     =   "#Colors.UI.ListSelectionColor"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "#Colors.UI.ControlBackColor"
      Bold            =   True
      BorderColor     =   "#Colors.UI.ControlBorderColor"
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Focused         =   ""
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   427
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Channel"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   42
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   70
   End
   Begin UIButton btnFriendsView
      AcceptFocus     =   True
      AcceptTabs      =   True
      ActiveColor     =   "#Colors.UI.ListSelectionColor"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "#Colors.UI.ControlBackColor"
      Bold            =   True
      BorderColor     =   "#Colors.UI.ControlBorderColor"
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Focused         =   ""
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   498
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Friends"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   42
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   70
   End
   Begin UIButton btnClanView
      AcceptFocus     =   True
      AcceptTabs      =   True
      ActiveColor     =   "#Colors.UI.ListSelectionColor"
      AutoDeactivate  =   True
      Backdrop        =   ""
      BackgroundColor =   "#Colors.UI.ControlBackColor"
      Bold            =   True
      BorderColor     =   "#Colors.UI.ControlBorderColor"
      DoubleBuffer    =   ""
      Enabled         =   True
      EraseBackground =   ""
      Focused         =   ""
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   569
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Clan"
      TextColor       =   "#Colors.UI.ControlTextColor"
      TextFont        =   "Arial"
      TextSize        =   12
      Top             =   42
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   70
   End
   Begin WebViewer oChatOutput
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   345
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   11
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   1
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   13
      Visible         =   True
      Width           =   403
   End
   Begin Timer lstUsersTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   637
      LockedInPosition=   False
      Mode            =   0
      Period          =   75
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   64
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Return Self.HandleKeyDown(Key)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  Dim RC As RectControl
		  Dim X, Y, W, H, i As Integer
		  
		  i = 0
		  While i < Me.ControlCount
		    If Me.Control(i) IsA RectControl Then
		      
		      RC = RectControl(Me.Control(i))
		      X = RC.Left
		      Y = RC.Top
		      W = RC.Width
		      H = RC.Height
		      
		      If (RC IsA TextArea Or RC IsA TextField Or RC IsA ListBox Or RC IsA HTMLViewer) And RC.Visible = True Then
		        If Me.Focus = RC Then
		          g.ForeColor = Colors.UI.ListSelectionColor
		        Else
		          g.ForeColor = Colors.UI.ControlBorderColor
		        End If
		        
		        g.DrawLine(X + W, Y - 1, X + W, Y + H) // Right
		        g.DrawLine(X - 1, Y - 1, X - 1, Y + H) // Left
		        g.DrawLine(X - 1, Y - 1, X + W, Y - 1) // Top
		        g.DrawLine(X - 1, Y + H, X + W, Y + H) // Bottom
		        
		      End If
		    End If
		    i = i + 1
		  Wend
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AutoCompleteInput(source As String) As String
		  
		  If Me.lstUsers_Viewing_Channel() = False Then Return "" // AutoComplete only available for channel users at this time
		  If Me.Config.BNET.ChannelUsers = Nil Then Return ""
		  
		  Dim word As String
		  
		  If Left(source, 1) = "@" Then
		    word = Mid(source, 2)
		  Else
		    word = source
		  End If
		  
		  Dim wordLength As Integer = Len(word)
		  Dim User As Dictionary = Nil
		  Dim Username As String = ""
		  Dim Match As String = ""
		  Dim i As Integer = 0
		  
		  While i < Me.Config.BNET.ChannelUsers.Count
		    User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
		    Username = User.Value("Username")
		    
		    If Left(Username, wordLength) = word Then
		      Match = Username
		      Exit While // Return first match, other possible matches are ignored for now
		    End If
		    
		    i = i + 1
		  Wend
		  
		  If Len(Match) > 0 And Left(source, 1) = "@" Then Match = "@" + Match
		  
		  Return Match // Couldn't find a suitable match
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConstructUserChannelDetailsMenu(Username As String, Product As UInt32, Flags As UInt32, Ping As Int32, Statstring As String) As MenuItem
		  
		  Dim detailsMenu As New MenuItem()
		  
		  detailsMenu.Append(New MenuItem(Username))
		  detailsMenu.Append(New MenuItem(Globals.ProductName(Product)))
		  detailsMenu.Append(New MenuItem(Format(Ping, "-#0") + "ms"))
		  
		  If Globals.IsWarcraftIII(Product) = True And CountFields(Statstring, " ") >= 4 Then
		    
		    detailsMenu.Append(New MenuItem("Clan " + _
		    Globals.SClanTag(MemClass.ReadDWORD(NthField(Statstring, " ", 4), 1, True))))
		    
		  ElseIf Globals.IsStarcraft(Product) = True Or Globals.IsWarcraftII(Product) = True Then
		    
		    detailsMenu.Append(New MenuItem("Normal Game Wins: " + _
		    Format(Val(NthField(Statstring, " ", 4)), "-#0")))
		    
		  End If
		  
		  If BitAnd(Flags, &H7F) > 0 Then detailsMenu.Append(New MenuItem(detailsMenu.TextSeparator))
		  If BitAnd(Flags, &H01) > 0 Then detailsMenu.Append(New MenuItem("Blizzard Employee"))
		  If BitAnd(Flags, &H08) > 0 Then detailsMenu.Append(New MenuItem("Battle.net Admin"))
		  If BitAnd(Flags, &H02) > 0 Then detailsMenu.Append(New MenuItem("Channel Operator"))
		  If BitAnd(Flags, &H04) > 0 Then detailsMenu.Append(New MenuItem("Channel Speaker"))
		  If BitAnd(Flags, &H20) > 0 Then detailsMenu.Append(New MenuItem("Squelched"))
		  If BitAnd(Flags, &H40) > 0 Then detailsMenu.Append(New MenuItem("Guest"))
		  If BitAnd(Flags, &H10) > 0 Then detailsMenu.Append(New MenuItem("No UDP"))
		  
		  Return detailsMenu
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConstructUserClanDetailsMenu(Username As String, Rank As Byte, LocationType As Byte, Location As String) As MenuItem
		  
		  Dim detailsMenu As New MenuItem()
		  
		  detailsMenu.Append(New MenuItem(Username))
		  detailsMenu.Append(New MenuItem(Globals.ClanRankName(Rank)))
		  
		  Const LOCATION_OFFLINE            = &H00
		  Const LOCATION_ONLINE             = &H01
		  Const LOCATION_INCHAT             = &H02
		  Const LOCATION_PUBLICGAME         = &H03
		  Const LOCATION_PRIVATEGAME        = &H04
		  Const LOCATION_PRIVATEGAME_FRIEND = &H05
		  
		  Select Case LocationType
		  Case LOCATION_OFFLINE
		    detailsMenu.Append(New MenuItem("Offline"))
		    
		  Case LOCATION_ONLINE, LOCATION_INCHAT
		    detailsMenu.Append(New MenuItem("Online"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  Case LOCATION_PUBLICGAME
		    detailsMenu.Append(New MenuItem("In a public game"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  Case LOCATION_PRIVATEGAME, LOCATION_PRIVATEGAME_FRIEND
		    detailsMenu.Append(New MenuItem("In a private game"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  End Select
		  
		  Return detailsMenu
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConstructUserFriendDetailsMenu(Username As String, Product As UInt32, Status As Byte, LocationType As Byte, Location As String) As MenuItem
		  
		  Dim detailsMenu As New MenuItem()
		  
		  detailsMenu.Append(New MenuItem(Username))
		  If Product <> 0 Then _
		  detailsMenu.Append(New MenuItem(Globals.ProductName(Product)))
		  
		  Const LOCATION_OFFLINE            = &H00
		  Const LOCATION_ONLINE             = &H01
		  Const LOCATION_INCHAT             = &H02
		  Const LOCATION_PUBLICGAME         = &H03
		  Const LOCATION_PRIVATEGAME        = &H04
		  Const LOCATION_PRIVATEGAME_FRIEND = &H05
		  
		  Select Case LocationType
		  Case LOCATION_OFFLINE
		    detailsMenu.Append(New MenuItem("Offline"))
		    
		  Case LOCATION_ONLINE
		    detailsMenu.Append(New MenuItem("Online, not in chat"))
		    
		  Case LOCATION_INCHAT
		    detailsMenu.Append(New MenuItem("Online, in chat"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  Case LOCATION_PUBLICGAME
		    detailsMenu.Append(New MenuItem("In a public game"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  Case LOCATION_PRIVATEGAME, LOCATION_PRIVATEGAME_FRIEND
		    detailsMenu.Append(New MenuItem("In a private game"))
		    If Len(Location) > 0 Then detailsMenu.Append(New MenuItem(Location))
		    
		  End Select
		  
		  If BitAnd(Status, &HFF) > 0 Then detailsMenu.Append(New MenuItem(detailsMenu.TextSeparator))
		  If BitAnd(Status, &H01) > 0 Then detailsMenu.Append(New MenuItem("Mutual Friend"))
		  If BitAnd(Status, &H02) > 0 Then detailsMenu.Append(New MenuItem("Do Not Disturb"))
		  If BitAnd(Status, &H04) > 0 Then detailsMenu.Append(New MenuItem("Away"))
		  If BitAnd(Status, &HF8) > 0 Then detailsMenu.Append(New MenuItem("Unknown (0x" + Hex(Status) + ")"))
		  
		  Return detailsMenu
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleChatInput(Text As String)
		  
		  Dim Cmd As String = NthField(Text, " ", 1)
		  Dim Rest As String = Mid(Text, Len(Cmd + " ") + 1)
		  
		  Dim BNETText As String = ""
		  Dim d As Dictionary
		  Dim sTmp As String
		  
		  Select Case Cmd
		  Case ""
		    
		    Self.Config.AddChat(True, Colors.SkyBlue, "Error - no internal command specified. Type //help for info.")
		    
		  Case "?", "Help"
		    
		    Self.Config.AddChat(True, Colors.SkyBlue, App.VersionString() + "'s Internal Commands:")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //cls  --  Clears this profile's chat log. (Hotkey: F4)")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //config  --  Opens the configuration dialog. (Hotkey: F3)")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //disconnect  --  Disconnects this profile from Battle.net. (Hotkey: F2)")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //exit  --  Disconnects all profiles and closes the bot. (Hotkey: Alt+F4)")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //fakejoin <game>  --  Makes Battle.net think you entered a <game>.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //force <channel>  --  Forces you into a <channel>.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //home  --  Forces you into your home channel, otherwise requests a first-join from Battle.net.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //leave  --  Forces you out of chat; only friends will be able to chat with you.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //lenny [message]  --  Types [message] ( ͡° ͜ʖ ͡°) to the chat.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //ping [username]  --  Pings [username] or yourself if [username] omitted.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //pingme  --  Pings yourself.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //profile [username] [GAME]  --  Opens a profile dialog for you or [username].")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //proxy <server[:port]|on|off>  --  Sets the proxy host and/or toggles proxy use.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //pvpgn [text]  --  Sends //[text] to Battle.net.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //reconnect  --  Reconnects this profile to Battle.net. (Hotkey: F1)")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //rejoin  --  Forces you out of then back into the current channel.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //shrug [message]  --  Types [message] ¯\_(ツ)_/¯ to the chat.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //time  --  Announces your system's time to the channel.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //update  --  Checks to see if there are updates to the bot.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //uptime  --  Announces the uptime of your system, bot, and connection.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //utf8  --  Toggles UTF-8 encoding for this profile.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "  //version  --  Announces the version of this bot to the channel.")
		    Self.Config.AddChat(True, Colors.SkyBlue, "End of " + App.VersionString() + "'s internal commands.")
		    
		  Case "Cls", "Clearscreen"
		    
		    Self.Config.ClearChat(False)
		    
		  Case "Configuration", "Config"
		    
		    ConfigWindow.Show()
		    
		  Case "Disconnect", "Disc", "Dc"
		    
		    If Self.Config.BNET <> Nil Then Self.Config.BNET.DoDisconnect()
		    
		  Case "Exit", "Quit"
		    
		    Quit(0)
		    
		  Case "Fakejoin", "Fakegame"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      If LenB(Rest) > 0 Then
		        Self.Config.BNET.Send(Packets.CreateSID_LEAVECHAT() + _
		        Packets.CreateSID_NOTIFYJOIN(Self.Config.BNET.Product, Self.Config.BNET.VersionByte, _
		        Rest, ""))
		        Self.Config.BNET.ReturnChannel = Self.Config.BNET.ChannelName
		        Self.Config.BNET.ChannelName = ""
		        Self.Config.BNET.ChannelFlags = 0
		        Self.Config.BNET.ChannelUsers.Clear()
		        Self.lstUsers_View = Self.lstUsers_View
		        Self.Config.AddChat(True, Colors.SkyBlue, "Sent a fake joined game to Battle.net. Type /whoami for info.")
		      Else
		        Self.Config.AddChat(True, Colors.SkyBlue, "Error - that command requires its game name parameter.")
		      End If
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Force"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      If LenB(Self.Config.BNET.ChannelName) < 1 Then Self.Config.BNET.ReturnChannel = ""
		      Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H2, Rest))
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Home", "HomeChannel"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True Then
		      If LenB(Self.Config.HomeChannel) > 0 Then
		        Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H2, Self.Config.HomeChannel))
		      ElseIf IsDiabloII(Self.Config.BNET.Product) = True Then
		        Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H5, ProductName(Self.Config.BNET.Product, True)))
		      Else
		        Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H1, ProductName(Self.Config.BNET.Product, True)))
		      End If
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Leave"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      Self.Config.BNET.Send(Packets.CreateSID_LEAVECHAT())
		      Self.Config.BNET.ReturnChannel = Self.Config.BNET.ChannelName
		      Self.Config.BNET.ChannelName = ""
		      Self.Config.BNET.ChannelFlags = 0
		      Self.Config.BNET.ChannelUsers.Clear()
		      Self.lstUsers_View = Self.lstUsers_View
		      Self.Config.AddChat(True, Colors.SkyBlue, "You are no longer in a channel. " _
		      + "Type //rejoin to re-enter your last channel.")
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Lenny"
		    
		    BNETText = "( ͡° ͜ʖ ͡°)"
		    If Len(Rest) > 0 Then BNETText = Rest + " " + BNETText
		    
		  Case "Ping"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      BNETText = NthField(Rest, " ", 1)
		      If Len(BNETText) < 1 Then BNETText = Self.Config.BNET.UniqueName
		      d = Self.Config.BNET.ChannelUsers.Lookup(BNETText, Nil)
		      If d = Nil Then
		        If BNETText = Self.Config.BNET.UniqueName Then
		          Self.Config.AddChat(True, Colors.SkyBlue, "I cannot find your name in the channel.")
		        Else
		          Self.Config.AddChat(True, Colors.SkyBlue, "I cannot find that name in the channel.")
		        End If
		        BNETText = ""
		      Else
		        If d.Value("Username").StringValue = Self.Config.BNET.UniqueName Then BNETText = "My" _
		    Else BNETText = d.Value("Username").StringValue + "'s"
		      BNETText = BNETText + " ping is " + Str(d.Value("Ping").IntegerValue) + "ms"
		      If BitAnd(d.Value("Flags").IntegerValue, &H10) > 0 Then
		        BNETText = BNETText + " and "
		        If d.Value("Username").StringValue = Self.Config.BNET.UniqueName Then BNETText = BNETText + "I" _
		      Else BNETText = BNETText + "they"
		        BNETText = BNETText + " have no UDP support"
		      End If
		      BNETText = BNETText + "."
		    End If
		  Else
		    BNETText = " "
		  End If
		  
		  Case "PingMe"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      d = Self.Config.BNET.ChannelUsers.Lookup(Self.Config.BNET.UniqueName, Nil)
		      If d = Nil Then
		        Self.Config.AddChat(True, Colors.SkyBlue, "I cannot find your name in the channel.")
		        BNETText = ""
		      Else
		        BNETText = "My ping is " + Str(d.Value("Ping").IntegerValue) + "ms"
		        If BitAnd(d.Value("Flags").IntegerValue, &H10) > 0 Then BNETText = BNETText + " and I have no UDP support"
		        BNETText = BNETText + "."
		      End If
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Profile"
		    
		    // Reusing BNETText as a variable here, we will clear it at the end.
		    
		    BNETText = NthField(Rest, " ", 1)
		    sTmp = NthField(Rest, " ", 2)
		    If Len(BNETText) < 1 Then BNETText = Self.Config.BNET.AccountName
		    If Len(sTmp) < 1 Then sTmp = MemClass.WriteDWORD(Self.Config.BNET.Product, False)
		    Select Case sTmp
		    Case "STAR", "SEXP", "JSTR", "SSHR", _
		      "DRTL", "DSHR", "D2DV", "D2XP", _
		      "W2BN", "WAR3", "W3DM", "W3XP", _
		      "CHAT"
		      sTmp = Uppercase(sTmp)
		    Case "RATS", "PXES", "RTSJ", "RHSS", _
		      "LTRD", "RHSD", "VD2D", "PX2D", _
		      "NB2W", "3RAW", "MD3W", "PX3W", _
		      "TAHC"
		      sTmp = Uppercase(MemClass.WriteDWORD(MemClass.ReadDWORD(sTmp, 1, True), False))
		    End Select
		    Self.Config.BNET.ViewProfile(BNETText, MemClass.ReadDWORD(sTmp, 1, False))
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then _
		    BNETText = "" Else BNETText = " "
		    
		  Case "Proxy"
		    
		    For Each sTmp In Split(Rest, " ")
		      If Globals.SBoolCheck(sTmp) = True And Globals.SBool(sTmp) = False Then
		        Self.Config.ProxyType = Configuration.ProxyOff
		      Else
		        Select Case sTmp
		        Case "http", "web"
		          Self.Config.ProxyType = Configuration.ProxyHTTP
		        Case "socks4", "socks"
		          Self.Config.ProxyType = Configuration.ProxySOCKS4
		        Case "socks5"
		          Self.Config.ProxyType = Configuration.ProxySOCKS5
		        Case Else
		          Self.Config.ProxyHost = sTmp
		        End Select
		      End If
		    Next
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      
		      BNETText = "Proxy support is now "
		      Select Case Self.Config.ProxyType
		      Case Configuration.ProxyOff
		        BNETText = BNETText + "disabled."
		      Case Configuration.ProxyHTTP
		        BNETText = BNETText + "enabled over http."
		      Case Configuration.ProxySOCKS4
		        BNETText = BNETText + "enabled over SOCKS v4."
		      Case Configuration.ProxySOCKS5
		        BNETText = BNETText + "enabled over SOCKS v5."
		      End Select
		      
		    Else
		      
		      BNETText = "Proxy support is now "
		      Select Case Self.Config.ProxyType
		      Case Configuration.ProxyOff
		        BNETText = BNETText + "disabled."
		      Case Configuration.ProxyHTTP
		        BNETText = BNETText + "enabled over http. Host: " + Self.Config.ProxyHost
		      Case Configuration.ProxySOCKS4
		        BNETText = BNETText + "enabled over SOCKS v4. Host: " + Self.Config.ProxyHost
		      Case Configuration.ProxySOCKS5
		        BNETText = BNETText + "enabled over SOCKS v5. Host: " + Self.Config.ProxyHost
		      End Select
		      
		      Self.Config.AddChat(True, Colors.SkyBlue, BNETText + EndOfLine)
		      BNETText = ""
		      
		    End If
		    
		  Case "PvPGN"
		    
		    BNETText = "//" + Rest
		    
		  Case "Reconnect", "Rc"
		    
		    If Self.Config.BNET <> Nil Then Self.Config.BNET.DoReconnect()
		    
		  Case "Rejoin", "Rj"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      If LenB(Self.Config.BNET.ChannelName) < 1 And LenB(Self.Config.BNET.ReturnChannel) > 0 Then
		        Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H2, Self.Config.BNET.ReturnChannel))
		      Else
		        Self.Config.BNET.Send(Packets.CreateSID_LEAVECHAT() + Packets.CreateSID_JOINCHANNEL(&H2, Self.Config.BNET.ChannelName))
		      End If
		    Else
		      BNETText = " "
		    End If
		    
		  Case "Shrug"
		    
		    BNETText = "¯\_(ツ)_/¯"
		    If Len(Rest) > 0 Then BNETText = Rest + " " + BNETText
		    
		  Case "Time", "Today", "Date"
		    
		    Dim Timestamp As New Date()
		    BNETText = "It is currently " + Timestamp.LongTime() + " (GMT"
		    If Timestamp.GMTOffset >= 0 Then BNETText = BNETText + "+"
		    BNETText = BNETText + Str(Timestamp.GMTOffset) + ") on " + Timestamp.LongDate() + "."
		    
		  Case "Update", "UpdateCheck"
		    
		    Dim w As New UpdateWindow()
		    w.StepTransition(UpdateWindow.STEP_CHECK)
		    w.ShowModalWithin(MainWindow)
		    
		  Case "Uptime"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      
		      BNETText = "System [" + _
		      Globals.TimeString(Microseconds() / 1000000, False, True) + "] "
		      BNETText = BNETText + "Bot [" + _
		      Globals.TimeString((Microseconds() - Globals.TimeStarted) / 1000000, False, True) + "] "
		      BNETText = BNETText + "Connection [" + _
		      Globals.TimeString((Microseconds() - Self.Config.BNET.ConnectionTime) / 1000000, False, True) + "]"
		      
		    Else
		      
		      Self.Config.AddChat(True, Colors.SkyBlue, "System [" + _
		      Globals.TimeString(Microseconds() / 1000000, False, True) + "]")
		      Self.Config.AddChat(True, Colors.SkyBlue, "Bot [" + _
		      Globals.TimeString((Microseconds() - Globals.TimeStarted) / 1000000, False, True) + "]")
		      Self.Config.AddChat(True, Colors.SkyBlue, "Connection [" + _
		      Globals.TimeString((Microseconds() - Self.Config.BNET.ConnectionTime) / 1000000, False, True) + "]")
		      
		    End If
		    
		  Case "UTF8", "UTF-8"
		    
		    Self.Config.EnableUTF8 = Not Self.Config.EnableUTF8
		    
		    If Self.Config.EnableUTF8 = False Then _
		    Self.Config.AddChat(True, Colors.SkyBlue, "UTF-8 encoded chat is now disabled.") Else _
		    Self.Config.AddChat(True, Colors.SkyBlue, "UTF-8 encoded chat is now enabled.")
		    
		  Case "Version", "Ver", "About"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      BNETText = "/me is using " + App.VersionString() + " by Jailout2000"
		    Else
		      Self.Config.AddChat(True, Colors.SkyBlue, "You are using " + App.VersionString() + " by Jailout2000.")
		    End If
		    
		  Case Else
		    Self.Config.AddChat(True, Colors.SkyBlue, "Error - unrecognized internal command. Type //help for info.")
		    
		  End Select
		  
		  // Reply to Battle.net:
		  
		  If LenB(BNETText) > 0 Then
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      
		      If LeftB(BNETText, 1) <> "/" And Self.Config.BNET.Init6Protocol = False Then
		        Self.Config.AddChat(True, Colors.Cyan, "<" + Self.Config.BNET.UniqueName + "> ", Colors.White, BNETText)
		      End If
		      
		      If Self.Config.EnableUTF8 = True Then
		        BNETText = ConvertEncoding(BNETText, Encodings.UTF8)
		      End If
		      
		      If Config.BNET.Product = Packets.BNETProduct_CHAT Then
		        Self.Config.BNET.Send(BNETText + EndOfLine.Windows)
		      Else
		        Self.Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(BNETText))
		      End If
		      
		    Else
		      
		      Self.Config.AddChat(True, Colors.SkyBlue, "Error - not logged on to Battle.net to be able to send that.")
		      
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HandleKeyDown(Key As String) As Boolean
		  
		  Select Case Asc(Key)
		  Case &H09 // Tab
		    
		    If Keyboard.ControlKey = False Then Return False
		    
		    If Keyboard.ShiftKey = False Then
		      If MainWindow.lstProfiles.ListIndex = MainWindow.lstProfiles.ListCount - 1 Then
		        MainWindow.lstProfiles.ListIndex = 0
		      Else
		        MainWindow.lstProfiles.ListIndex = MainWindow.lstProfiles.ListIndex + 1
		      End If
		    Else
		      If MainWindow.lstProfiles.ListIndex = 0 Then
		        MainWindow.lstProfiles.ListIndex = MainWindow.lstProfiles.ListCount - 1
		      Else
		        MainWindow.lstProfiles.ListIndex = MainWindow.lstProfiles.ListIndex - 1
		      End If
		    End If
		    
		  Case &HC8 // F1
		    
		    If Config <> Nil And Config.BNET <> Nil Then Config.BNET.DoReconnect()
		    
		  Case &HC9 // F2
		    
		    If Config <> Nil And Config.BNET <> Nil Then Config.BNET.DoDisconnect()
		    
		  Case &HCA // F3
		    
		    ConfigWindow.Show()
		    
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


	#tag Property, Flags = &h0
		Config As Configuration
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.Config.CachelstUsers_View
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.Config.CachelstUsers_LastView = Me.Config.CachelstUsers_View
			  Me.Config.CachelstUsers_View = value
			  
			  Dim scrollPosX As Integer = lstUsers.ScrollPositionX
			  Dim scrollPosY As Integer = lstUsers.ScrollPosition
			  lstUsers.DeleteAllRows()
			  Dim sChannelText As String
			  
			  If Me.Config.BNET <> Nil And Me.Config.BNET.IsConnected = True Then
			    If LenB(Me.Config.BNET.UniqueName) <= 0 Then
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
			    sChannelText = Me.Config.BNET.ChannelName
			    If Me.Config.BNET.ChannelUsers = Nil Then Return
			  ElseIf Self.lstUsers_Viewing_Friends() = True Then
			    lstUsers.ColumnCount = 2
			    lstUsers.ColumnWidths = "30"
			    If Me.Config.BNET.FriendsList <> Nil Then
			      sChannelText = Str(Me.Config.BNET.FriendsList.Count) + " friend"
			      If Me.Config.BNET.FriendsList.Count <> 1 Then sChannelText = sChannelText + "s"
			    Else
			      sChannelText = "0 friends"
			    End If
			    If Self.lstUsers_ViewIsFriends(Me.Config.CachelstUsers_LastView) = False Then _
			    Me.Config.BNET.Send(Packets.CreateSID_FRIENDSLIST())
			  ElseIf Self.lstUsers_Viewing_Clan() = True Then
			    lstUsers.ColumnCount = 2
			    lstUsers.ColumnWidths = "30"
			    If Me.Config.BNET.ClanMembers <> Nil Then
			      sChannelText = Str(Me.Config.BNET.ClanMembers.Count) + " clan member"
			      If Me.Config.BNET.ClanMembers.Count <> 1 Then sChannelText = sChannelText + "s"
			    Else
			      sChannelText = "0 clan members"
			      Return
			    End If
			  ElseIf Self.lstUsers_Viewing_ChannelList() = True Then
			    lstUsers.ColumnCount = 1
			    lstUsers.ColumnWidths = "100%"
			    sChannelText = Str(UBound(Me.Config.BNET.Channels) + 1) + " channel"
			    If UBound(Me.Config.BNET.Channels) <> 0 Then sChannelText = sChannelText + "s"
			  End If
			  
			  Select Case value
			  Case Me.lstUsers_View_Channel_Entry
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    i = 0
			    While i < Me.Config.BNET.ChannelUsers.Count
			      User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			      
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
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Name
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    i = 0
			    While i < Me.Config.BNET.ChannelUsers.Count
			      User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			      
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
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Game
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    For Each Product In Products()
			      i = 0
			      While i < Me.Config.BNET.ChannelUsers.Count
			        User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			        
			        If StrComp(Product, MidB(User.Value("Statstring"), 1, 4), 0) = 0 Then
			          lstUsers.AddRow("")
			          lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			          lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Statstring")
			          lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Flags")
			          lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Ping")
			        End If
			        
			        i = i + 1
			      Wend
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Flags
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    // 0x01      0x08          0x04        0x02
			    Dim Admins(), Moderators(), Speakers(), Operators() As Dictionary
			    
			    i = 0
			    While i < Me.Config.BNET.ChannelUsers.Count
			      User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			      
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
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Ping
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    Dim Pings() As UInt32
			    
			    i = 0
			    While i < Me.Config.BNET.ChannelUsers.Count
			      User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			      
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
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Channel_Activity
			    Me.Config.CachelstUsers_View_Channel = value
			    
			    i = 0
			    While i < Me.Config.BNET.ChannelUsers.Count
			      User = Me.Config.BNET.ChannelUsers.Value(Me.Config.BNET.ChannelUsers.Key(i))
			      
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
			      
			    Next
			    
			    sChannelText = sChannelText + " (" + Str(lstUsers.ListCount) + ")"
			    
			  Case Me.lstUsers_View_Friends_Entry
			    Me.Config.CachelstUsers_View_Friends = value
			    
			    If Me.Config.BNET.FriendsList <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.FriendsList.Count
			        User = Me.Config.BNET.FriendsList.Value(Me.Config.BNET.FriendsList.Key(i))
			        
			        lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			        lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			        lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			        lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			        lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			        
			        i = i + 1
			      Wend
			    End If
			    
			  Case Me.lstUsers_View_Friends_Name
			    Me.Config.CachelstUsers_View_Friends = value
			    
			    If Me.Config.BNET.FriendsList <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.FriendsList.Count
			        User = Me.Config.BNET.FriendsList.Value(Me.Config.BNET.FriendsList.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Friends_Game
			    Me.Config.CachelstUsers_View_Friends = value
			    
			    If Me.Config.BNET.FriendsList <> Nil Then
			      For Each Product In Products()
			        i = 0
			        While i < Me.Config.BNET.FriendsList.Count
			          User = Me.Config.BNET.FriendsList.Value(Me.Config.BNET.FriendsList.Key(i))
			          
			          If StrComp(Product, MemClass.WriteDWORD(User.Value("Product"), True), 0) = 0 Then
			            lstUsers.AddRow(MemClass.WriteDWORD(User.Value("Product"), True))
			            lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			            lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location Name")
			            lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			            lstUsers.CellTag(lstUsers.LastIndex, 2) = User.Value("Location")
			          End If
			          
			          i = i + 1
			        Wend
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Friends_Status
			    Me.Config.CachelstUsers_View_Friends = value
			    
			    If Me.Config.BNET.FriendsList <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.FriendsList.Count
			        User = Me.Config.BNET.FriendsList.Value(Me.Config.BNET.FriendsList.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Friends_Location
			    Me.Config.CachelstUsers_View_Friends = value
			    
			    // Statuses() is reused as the Locations() instead.
			    
			    If Me.Config.BNET.FriendsList <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.FriendsList.Count
			        User = Me.Config.BNET.FriendsList.Value(Me.Config.BNET.FriendsList.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Clan_Entry
			    Me.Config.CachelstUsers_View_Clan = value
			    
			    If Me.Config.BNET.ClanMembers <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.ClanMembers.Count
			        User = Me.Config.BNET.ClanMembers.Value(Me.Config.BNET.ClanMembers.Key(i))
			        
			        lstUsers.AddRow(Str(User.Value("Rank")))
			        lstUsers.Cell(lstUsers.LastIndex, 1) = User.Value("Username")
			        lstUsers.CellTag(lstUsers.LastIndex, 0) = User.Value("Location")
			        lstUsers.CellTag(lstUsers.LastIndex, 1) = User.Value("Status")
			        
			        i = i + 1
			      Wend
			    End If
			    
			  Case Me.lstUsers_View_Clan_Name
			    Me.Config.CachelstUsers_View_Clan = value
			    
			    If Me.Config.BNET.ClanMembers <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.ClanMembers.Count
			        User = Me.Config.BNET.ClanMembers.Value(Me.Config.BNET.ClanMembers.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Clan_Status
			    Me.Config.CachelstUsers_View_Clan = value
			    
			    If Me.Config.BNET.ClanMembers <> Nil Then
			      i = 0
			      While i < Me.Config.BNET.ClanMembers.Count
			        User = Me.Config.BNET.ClanMembers.Value(Me.Config.BNET.ClanMembers.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_Clan_Rank
			    Me.Config.CachelstUsers_View_Clan = value
			    
			    If Me.Config.BNET.ClanMembers <> Nil Then
			      Dim Others(), Chieftains(), Shamans(), Grunts(), Peons(), Initiates() As Dictionary
			      
			      i = 0
			      While i < Me.Config.BNET.ClanMembers.Count
			        User = Me.Config.BNET.ClanMembers.Value(Me.Config.BNET.ClanMembers.Key(i))
			        
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
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_ChannelList_Entry
			    Me.Config.CachelstUsers_View_ChannelList = value
			    
			    If Me.Config.BNET.Channels <> Nil Then
			      For Each sTmp1 In Me.Config.BNET.Channels
			        
			        lstUsers.AddRow(sTmp1)
			        
			      Next
			    End If
			    
			  Case Me.lstUsers_View_ChannelList_Name
			    Me.Config.CachelstUsers_View_ChannelList = value
			    
			    If Me.Config.BNET.Channels <> Nil Then
			      For Each sTmp1 In Me.Config.BNET.Channels
			        
			        Names.Append(sTmp1)
			        
			      Next
			      
			      Names.Sort()
			      
			      For Each sTmp1 In Names()
			        
			        lstUsers.AddRow(sTmp1)
			        
			      Next
			    End If
			    
			  End Select
			  
			  lstUsers.ScrollPositionX = scrollPosX
			  lstUsers.ScrollPosition = scrollPosY
			  
			  txtChannel.Text = sChannelText
			  
			End Set
		#tag EndSetter
		lstUsers_View As Integer
	#tag EndComputedProperty


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

#tag Events lstUsers
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  If column = 0 And Self.lstUsers_Viewing_ChannelList() = False Then
		    
		    g.ForeColor = Colors.UI.ControlBackColor
		    
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
		      
		      If Self.Config.BNET <> Nil And Globals.IsFriend(Self.Config.BNET, Me.Cell(row, 1)) = True Then _
		      g.ForeColor = ColorMix(g.ForeColor, Colors.Green, -1)
		      
		    Else
		      
		      g.ForeColor = Colors.UI.ListSelectionColor
		      
		    End If
		    
		  ElseIf row = -1 Then
		  Else
		    
		    g.ForeColor = Colors.UI.ControlBackColor
		    
		    If Self.lstUsers_Viewing_Channel() = True And _
		      Self.Config.BNET <> Nil And row >= 0 And row < Me.ListCount And _
		      Globals.IsFriend(Self.Config.BNET, Me.Cell(row, 1)) = True Then _
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
		    Me.Cell(Me.LastIndex, 1) = "Jailout2000@Azeroth"
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
		    If Self.Config.BNET <> Nil Then
		      AccountName = Self.Config.BNET.AccountName
		      UniqueName = Self.Config.BNET.UniqueName
		      Statstring = Self.Config.BNET.Statstring
		      Flags = Self.Config.BNET.Flags
		    End If
		    
		    If Self.lstUsers_Viewing_Friends() = True Or Self.lstUsers_Viewing_Clan() = True Then
		      base.Append(New MenuItem("Refresh"))
		      base.Append(New MenuItem(base.TextSeparator))
		    End If
		    
		    If Me.ListIndex <> -1 Then
		      
		      If BitAnd(Flags, &H0B) > 0 Then
		        base.Append(New MenuItem("Designate"))
		        base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		        base.Append(New MenuItem("Ban"))
		        base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem("Kick"))
		        base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		      End If
		      
		      If Me.Cell(Me.ListIndex, 1) <> UniqueName Then
		        If BitAnd(Me.CellTag(Me.ListIndex, 1), &H20) <= 0 Then _
		        base.Append(New MenuItem("Squelch")) Else base.Append(New MenuItem("Unsquelch"))
		        base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		        base.Append(New MenuItem(base.TextSeparator))
		      End If
		      
		      base.Append(New MenuItem("Whisper"))
		      base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		      
		      base.Append(New MenuItem(base.TextSeparator))
		      
		      Dim detailsMenu As MenuItem = Nil
		      
		      If Self.lstUsers_Viewing_Channel() = True Then
		        detailsMenu = Self.ConstructUserChannelDetailsMenu(_
		        Me.Cell(Me.ListIndex, 1), _
		        MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True), _
		        Me.CellTag(Me.ListIndex, 1).IntegerValue, _
		        Me.CellTag(Me.ListIndex, 2).IntegerValue, _
		        Me.CellTag(Me.ListIndex, 0))
		      ElseIf Self.lstUsers_Viewing_Friends() = True Then
		        detailsMenu = Self.ConstructUserFriendDetailsMenu(_
		        Me.Cell(Me.ListIndex, 1), _
		        MemClass.ReadDWORD(Me.Cell(Me.ListIndex, 0), 1, True), _
		        Me.CellTag(Me.ListIndex, 1).IntegerValue, _
		        Me.CellTag(Me.ListIndex, 2).IntegerValue, _
		        Me.CellTag(Me.ListIndex, 0))
		      ElseIf Self.lstUsers_Viewing_Clan() = True Then
		        detailsMenu = Self.ConstructUserClanDetailsMenu(_
		        Me.Cell(Me.ListIndex, 1), _
		        Val(Me.Cell(Me.ListIndex, 0)), _
		        Me.CellTag(Me.ListIndex, 1).IntegerValue, _
		        Me.CellTag(Me.ListIndex, 0))
		      End If
		      
		      If detailsMenu <> Nil Then
		        detailsMenu.Text = "View Details"
		        For i As Integer = 0 To detailsMenu.Count() - 1
		          detailsMenu.Item(i).Tag = "CLIPBOARD_COPY"
		        Next
		        base.Append(detailsMenu)
		      End If
		      
		      base.Append(New MenuItem("View Profile"))
		      If Me.Cell(Me.ListIndex, 1) <> UniqueName Then
		        base.Item(base.Count() - 1).Tag = MemClass.WriteDWORD(MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True), True) _
		        + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		      Else
		        base.Item(base.Count() - 1).Tag = MemClass.WriteDWORD(Self.Config.BNET.Product, True) _
		        + MemClass.WriteCString(AccountName) // Do not use unique name here.
		      End If
		      
		    Else
		      
		      base.Append(New MenuItem("View Profile"))
		      base.Item(base.Count() - 1).Tag = MemClass.WriteDWORD(Self.Config.BNET.Product, True) _
		      + MemClass.WriteCString(AccountName) // Do not use unique name here.
		      
		    End If
		    
		    If Globals.IsWarcraftIII(Self.Config.Product) = True Then
		      
		      base.Append(New MenuItem("View Clan Info"))
		      If Me.ListIndex <> -1 And Me.Cell(Me.ListIndex, 1) <> UniqueName Then _
		      base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1) + " " + Me.CellTag(Me.ListIndex, 0) Else _
		      base.Item(base.Count() - 1).Tag = AccountName + " " + Statstring
		      
		      If Self.Config.BNET.ClanTag <> 0 Then
		        
		        base.Append(New MenuItem(base.TextSeparator))
		        base.Append(New MenuItem("Leave clan"))
		        If Self.Config.BNET.ClanRank >= 4 Then
		          base.Append(New MenuItem(base.TextSeparator))
		          base.Append(New MenuItem("Disband clan"))
		        End If
		        
		        If Me.ListIndex <> -1 Then
		          base.Append(New MenuItem(base.TextSeparator))
		          If Self.lstUsers_Viewing_Channel() = True And _
		            Globals.IsWarcraftIII(MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True)) = True And _
		            CountFields(Me.CellTag(Me.ListIndex, 0), " ") < 4 And Self.Config.BNET.ClanRank >= 3 Then
		            base.Append(New MenuItem("Send clan invitation"))
		            base.Item(base.Count() - 1).Tag = Me.Cell(Me.ListIndex, 1)
		          End If
		          
		          If (Self.lstUsers_Viewing_Clan() = True) Or _
		            (Self.lstUsers_Viewing_Channel() = True And _
		            MemClass.ReadDWORD(NthField(Me.CellTag(Me.ListIndex, 0), " ", 4), 1, True) = Self.Config.BNET.ClanTag) And _
		            Self.Config.BNET.ClanRank >= 3 Then
		            base.Append(New MenuItem("Remove from clan"))
		            base.Item(base.Count() - 1).Tag = MemClass.WriteBYTE(Val(Me.Cell(Me.ListIndex, 0))) _
		            + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Append(New MenuItem(base.TextSeparator))
		            base.Append(New MenuItem("Change member's rank"))
		            base.Item(base.Count() - 1).Insert(0, New MenuItem("Chieftain"))
		            base.Item(base.Count() - 1).Item(0).Tag = MemClass.WriteBYTE(&H04) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count() - 1).Insert(1, New MenuItem("Shaman"))
		            base.Item(base.Count() - 1).Item(1).Tag = MemClass.WriteBYTE(&H03) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count() - 1).Insert(2, New MenuItem("Grunt"))
		            base.Item(base.Count() - 1).Item(2).Tag = MemClass.WriteBYTE(&H02) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count() - 1).Insert(3, New MenuItem("Peon"))
		            base.Item(base.Count() - 1).Item(3).Tag = MemClass.WriteBYTE(&H01) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            base.Item(base.Count() - 1).Insert(4, New MenuItem("Initiate"))
		            base.Item(base.Count() - 1).Item(4).Tag = MemClass.WriteBYTE(&H00) + MemClass.WriteCString(Me.Cell(Me.ListIndex, 1))
		            If Self.lstUsers_Viewing_Clan() = True Then
		              base.Item(base.Count() - 1).Item(0).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H04)
		              base.Item(base.Count() - 1).Item(1).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H03)
		              base.Item(base.Count() - 1).Item(2).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H02)
		              base.Item(base.Count() - 1).Item(3).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H01)
		              base.Item(base.Count() - 1).Item(4).Checked = (Val(Me.Cell(Me.ListIndex, 0)) = &H00)
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
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True Then
		      If Self.Config.Product = Packets.BNETProduct_CHAT And Self.Config.VersionByte = &H00 Then
		        Self.Config.BNET.Send("/join " + hitItem.Tag + Chr(13))
		      Else
		        Self.Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H0, hitItem.Tag))
		      End If
		      Self.lstUsers_View = Self.Config.CachelstUsers_LastView
		    End If
		    
		  Case "Refresh"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And LenB(Self.Config.BNET.UniqueName) > 0 Then
		      If Self.lstUsers_Viewing_Friends() = True Then
		        Self.Config.BNET.Send(Packets.CreateSID_FRIENDSLIST())
		      ElseIf Self.lstUsers_Viewing_Clan() = True Then
		        Self.Config.BNET.Send(Packets.CreateSID_CLANMEMBERLIST(1))
		      End If
		    End If
		    
		  Case "Squelch", "Unsquelch", "Ban", "Kick", "Designate"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True Then
		      sTmp = "/" + Lowercase(hitItem.Text) + " " + hitItem.Tag
		      If Self.Config.Product = Packets.BNETProduct_CHAT And Self.Config.VersionByte = &H00 Then
		        Self.Config.BNET.Send(sTmp + Chr(13))
		      Else
		        If Self.Config.EnableUTF8 = False Then
		          Self.Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(sTmp))
		        Else
		          Self.Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(ConvertEncoding(sTmp, Encodings.UTF8)))
		        End If
		      End If
		    End If
		    
		  Case "Whisper"
		    
		    sTmp = "/w " + hitItem.Tag + " "
		    oChatInput.SelText = sTmp
		    oChatInput.SelStart = oChatInput.SelStart + Len(sTmp)
		    oChatInput.SetFocus()
		    
		  Case "View Profile"
		    
		    sTmp = hitItem.Tag
		    If Config <> Nil And Self.Config.BNET <> Nil Then _
		    Self.Config.BNET.ViewProfile(MemClass.ReadCString(sTmp, 5), MemClass.ReadDWORD(sTmp, 1, True))
		    
		  Case "View Clan Info"
		    
		    Dim Name As String = NthField(hitItem.Tag, " ", 1)
		    Dim Statstring As String = Mid(hitItem.Tag, Len(Name + " ") + 1)
		    Dim iProduct As UInt32 = MemClass.ReadDWORD(NthField(Statstring, " ", 4), 1, True)
		    
		    If Config <> Nil And Self.Config.BNET <> Nil Then Self.Config.BNET.ViewClanInfo(iProduct, Name)
		    
		  Case "Leave clan"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And Self.Config.BNET.ClanTag <> 0 Then _
		    Globals.ConfirmClanAction(Config, Globals.ClanConfirmLeave)
		    
		  Case "Disband clan"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And Self.Config.BNET.ClanTag <> 0 Then _
		    Globals.ConfirmClanAction(Config, Globals.ClanConfirmDisband)
		    
		  Case "Send clan invitation"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And Self.Config.BNET.ClanTag <> 0 _
		      And hitItem.Tag <> Self.Config.BNET.UniqueName Then
		      Dim Cookie As UInt32 = Globals.GenerateDWORD()
		      Globals.ClanCookies.Value(Cookie) = MemClass.WriteCString(hitItem.Tag)
		      Self.Config.BNET.Send(Packets.CreateSID_CLANINVITATION(Cookie, hitItem.Tag))
		      Self.Config.AddChat(True, Colors.Yellow, "BNET: Inviting ")
		      Self.Config.AddChat(False, Colors.Orange, hitItem.Tag)
		      Self.Config.AddChat(False, Colors.Yellow, " to the clan..." + EndOfLine)
		    End If
		    
		  Case "Remove from clan"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And Self.Config.BNET.ClanTag <> 0 Then
		      sTmp = MemClass.ReadCString(hitItem.Tag, 2)
		      If sTmp <> Self.Config.BNET.UniqueName Then _
		      Globals.ConfirmRemoveClanMember(Config, sTmp, MemClass.ReadBYTE(hitItem.Tag, 1))
		    End If
		    
		  Case "Initiate", "Peon", "Grunt", "Shaman", "Chieftain"
		    
		    If Self.Config.BNET <> Nil And Self.Config.BNET.IsConnected = True And Self.Config.BNET.ClanTag <> 0 _
		      And MemClass.ReadCString(hitItem.Tag, 2) <> Self.Config.BNET.UniqueName Then
		      Dim Cookie As UInt32 = Globals.GenerateDWORD()
		      Globals.ClanCookies.Value(Cookie) = MemClass.WriteCString(MemClass.ReadCString(hitItem.Tag, 2))
		      Self.Config.BNET.Send(Packets.CreateSID_CLANRANKCHANGE(Cookie, MemClass.ReadCString(hitItem.Tag, 2), _
		      MemClass.ReadBYTE(hitItem.Tag, 1)))
		    End If
		    
		  Case Else
		    If hitItem.Tag = "CLIPBOARD_COPY" Then
		      Dim c As New Clipboard()
		      c.SetText(hitItem.Text)
		      c.Close()
		      Return True
		    End If
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
		    
		    Config.BNET.ViewProfile(Me.Cell(Me.ListIndex, 1), MemClass.ReadDWORD(Me.CellTag(Me.ListIndex, 0), 1, True))
		    
		  ElseIf Self.lstUsers_Viewing_ChannelList() = True Then
		    
		    If Config.BNET <> Nil And Config.BNET.IsConnected = True Then
		      If Config.Product = Packets.BNETProduct_CHAT And Config.VersionByte = &H00 Then
		        Config.BNET.Send("/join " + Me.Cell(row, 0) + Chr(13))
		      Else
		        Config.BNET.Send(Packets.CreateSID_JOINCHANNEL(&H0, Me.Cell(row, 0)))
		      End If
		      Self.lstUsers_View = Config.CachelstUsers_LastView
		    End If
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  
		  Self.RefreshRect(Me.Left - 1, Me.Top - 1, Me.Width + 2, Me.Height + 2)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub LostFocus()
		  
		  Self.RefreshRect(Me.Left - 1, Me.Top - 1, Me.Width + 2, Me.Height + 2)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events oChatInput
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Dim KeyAsc As Integer = Asc(Key)
		  
		  If (KeyAsc <> 13 And KeyAsc <> 3 And KeyAsc <> 9) Then Return Self.HandleKeyDown(Key)
		  
		  If KeyAsc = 9 Then // Try to auto-complete the username at this cursor
		    If Keyboard.AsyncAltKey = True Then Return False // User is switching to another application
		    If Keyboard.AsyncControlKey = True Then Return Self.HandleKeyDown(Key) // User is switching to another profile
		    Dim textLength As Integer = Len(Me.Text)
		    If textLength = 0 Then Return False
		    If Me.SelStart <> textLength Then
		      Call MsgBox("Cannot autocomplete unless cursor is at end of input.", 48, "Application Limitation")
		      Return True
		    End If
		    Dim word As String = NthField(Me.Text, " ", CountFields(Me.Text, " "))
		    Dim wordComplete As String = Self.AutoCompleteInput(word)
		    If wordComplete <> "" Then
		      Dim leftCursor As Integer = textLength - Len(word)
		      If leftCursor = 0 Then wordComplete = wordComplete + ": " _
		    Else wordComplete = wordComplete + " "
		      Me.SelStart = leftCursor
		      Me.SelLength = textLength - leftCursor
		      Me.SelText = wordComplete
		    End If
		    Return True
		  End If
		  
		  // Process the text in the box
		  
		  Dim Lines(), Line As String
		  Lines = Split(ReplaceLineEndings(Me.Text, EndOfLine), EndOfLine)
		  
		  For Each Line In Lines
		    
		    If Left(Line, 2) = "//" Then
		      Self.HandleChatInput(Mid(Line, 3))
		      Continue For
		    End If
		    
		    Line = SafeString(ReplaceAll(Line, Chr(9), "  "), " ")
		    
		    If Config.BNET = Nil Then Continue For
		    If Config.BNET.IsConnected = False Then Continue For
		    If LenB(Config.BNET.UniqueName) < 1 Then Continue For
		    
		    Dim s As String
		    If Config.EnableUTF8 = False Then s = Line Else s = ConvertEncoding(Line, Encodings.UTF8)
		    
		    If Config.BNET.Init6Protocol = False Then
		      Dim dTmp As Dictionary = Config.BNET.ChannelUsers.Lookup(Config.BNET.UniqueName, Nil)
		      If dTmp <> Nil Then dTmp.Value("LastMessageTime") = Microseconds()
		      
		      If dTmp <> Nil Then
		        // Emotes and Whispers will be covered when they are sent back to us by Battle.net.
		        //If Left(s, 3) = "/me" Or Left(s, 6) = "/emote" Then
		        //dTmp.Value("LastMessageType") = &H17
		        //dTmp.Value("LastMessage") = Mid(s, Len(NthField(s, " ", 1) + " ") + 1)
		        //ElseIf Left(s, 2) = "/w" Or Left(s, 4) = "/msg" Or Left(s, 8) = "/whisper" Then
		        //dTmp.Value("LastMessageType") = &H0A
		        //dTmp.Value("LastMessage") = Mid(s, Len(NthField(s, " ", 1) + " " + NthField(s, " ", 2) + " ") + 1)
		        //Else
		        If Left(s, 1) <> "/" Then
		          dTmp.Value("LastMessageType") = &H05
		          dTmp.Value("LastMessage") = s
		        End If
		        //End If
		      End If
		    End If
		    
		    If Config.BNET.Product = Packets.BNETProduct_CHAT Then
		      Config.BNET.Send(s + EndOfLine.Windows)
		    Else
		      Config.BNET.Send(Packets.CreateSID_CHATCOMMAND(s))
		    End If
		    
		    If Left(Line, 1) <> "/" And Config.BNET.Init6Protocol = False Then
		      Config.AddChat(True, Colors.Teal, "<", Colors.Cyan, Config.BNET.UniqueName, Colors.Teal, "> ", Colors.White, Line)
		      Globals.ExpandChatContent(Self.Config, Line)
		      
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
	#tag Event
		Sub LostFocus()
		  
		  Self.RefreshRect(Me.Left - 1, Me.Top - 1, Me.Width + 2, Me.Height + 2)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub GotFocus()
		  
		  Self.RefreshRect(Me.Left - 1, Me.Top - 1, Me.Width + 2, Me.Height + 2)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtChannel
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  
		  #pragma Unused x
		  #pragma Unused y
		  
		  base.Append(New MenuItem("&Copy to Clipboard"))
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  
		  If hitItem = Nil Then Return False
		  
		  Select Case Replace(hitItem.Text, "&", "")
		  Case "Copy to Clipboard"
		    
		    Dim c As New Clipboard()
		    If Self.lstUsers_Viewing_Channel() = True And Config <> Nil And Len(Config.BNET.ChannelName) > 0 Then
		      c.Text = Config.BNET.ChannelName
		    Else
		      c.Text = Me.Text
		    End If
		    c.Close()
		    
		  Case Else
		    
		    Dim err As New RuntimeException()
		    err.Message = "Unhandled menu item."
		    Raise err
		    Return False
		    
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnChannelView
	#tag Event
		Sub Action()
		  
		  Self.lstUsers_View = Self.Config.CachelstUsers_View_Channel
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnFriendsView
	#tag Event
		Sub Action()
		  
		  Self.lstUsers_View = Self.Config.CachelstUsers_View_Friends
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClanView
	#tag Event
		Sub Action()
		  
		  Self.lstUsers_View = Self.Config.CachelstUsers_View_Clan
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events oChatOutput
	#tag Event
		Sub Open()
		  
		  Me.Config = Self.Config
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lstUsersTimer
	#tag Event
		Sub Action()
		  
		  // The purpose of this timer is to delay refreshing the UI until a set
		  // of incoming events subsides. If we were to refresh for every event
		  // that came in instead of waiting, the bot will slow to a halt in the
		  // event of a flood.
		  
		  // The following property will refresh the right-side list:
		  Self.lstUsers_View = Self.lstUsers_View
		  
		  // The following will redraw the left-side list:
		  Globals.ForceRedraw(MainWindow.lstProfiles)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
