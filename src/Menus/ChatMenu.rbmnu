#tag Menu
Begin Menu ChatMenu
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Begin ConnectMenuItem FileConnect
         SpecialMenu = 0
         Text = "Connect..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileReconnectProfile
         SpecialMenu = 0
         Text = "Reconnect Profile"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem FileDisconnectProfile
         SpecialMenu = 0
         Text = "Disconnect Profile"
         Index = -2147483648
         ShortcutKey = "D"
         Shortcut = "Cmd+D"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Separators
         SpecialMenu = 0
         Text = "-"
         Index = 0
         AutoEnable = True
      End
      Begin WindowNewMenuItem FileNewWindow
         SpecialMenu = 0
         Text = "&New Window"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = True
      End
      Begin WindowCloseMenuItem FileCloseWindow
         SpecialMenu = 0
         Text = "Close &Window"
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+W"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Separators
         SpecialMenu = 0
         Text = "-"
         Index = 1
         AutoEnable = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Separators
         SpecialMenu = 0
         Text = "-"
         Index = 2
         AutoEnable = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
      End
      Begin MenuItem Separators
         SpecialMenu = 0
         Text = "-"
         Index = 3
         AutoEnable = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
      End
      Begin MenuItem Separators
         SpecialMenu = 0
         Text = "-"
         Index = 4
         AutoEnable = True
      End
      Begin AccountsMenuItem EditAccountManager
         SpecialMenu = 0
         Text = "Account &Manager"
         Index = -2147483648
         ShortcutKey = "M"
         Shortcut = "Cmd+M"
         MenuModifier = True
         AutoEnable = True
      End
      Begin GameKeysMenuItem EditGameKeyManager
         SpecialMenu = 0
         Text = "Game &Key Manager"
         Index = -2147483648
         ShortcutKey = "K"
         Shortcut = "Cmd+K"
         MenuModifier = True
         AutoEnable = True
      End
      Begin ProfilesMenuItem EditProfileManager
         SpecialMenu = 0
         Text = "&Profile Manager"
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
      End
   End
   Begin MenuItem WindowMenu
      SpecialMenu = 0
      Text = "&Window"
      Index = -2147483648
      AutoEnable = True
      Begin WindowMaximizeMenuItem WindowMaximize
         SpecialMenu = 0
         Text = "Ma&ximize"
         Index = -2147483648
         AutoEnable = True
      End
      Begin WindowMinimizeMenuItem WindowMinimize
         SpecialMenu = 0
         Text = "Mi&nimize"
         Index = -2147483648
         AutoEnable = True
      End
      Begin WindowRestoreMenuItem WindowRestore
         SpecialMenu = 0
         Text = "&Restore"
         Index = -2147483648
         AutoEnable = True
      End
   End
End
#tag EndMenu
