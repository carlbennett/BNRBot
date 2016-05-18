#tag Window
Begin BotWindow MainWindow
   BackColor       =   "#Colors.UI.WindowBackColor"
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   True
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
   Title           =   "BNRBot"
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
      DefaultRowHeight=   20
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
   Begin PagePanel Pages
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   151
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   0
      Panels          =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   649
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
		  EndOfLine + "Are you sure you wish to exit?", 305, "Still Connected - BNRBot")
		  
		  Return (i = 2 Or i = 3 Or i = 7)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  
		  If Globals.ConfigWindow_Open = True Then ConfigWindow.Close()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Dim Config As Configuration = Me.GetSelectedConfig()
		  If Config <> Nil Then Return Config.Container.HandleKeyDown(Key)
		  Return False
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Minimize()
		  
		  If Settings.PrefMinimizeToTray = True Then Self.Hide()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.Title = App.VersionString()
		  Me.LoadProfileList()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetSelectedConfig() As Configuration
		  
		  If Me.lstProfiles.ListIndex = -1 Then Return Nil
		  
		  Dim i As Integer = Me.lstProfiles.CellTag(Me.lstProfiles.ListIndex, 0)
		  
		  If i < 0 Or i >= UBound(Settings.Configurations) Then Return Nil
		  
		  Return Settings.Configurations(i)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsConfigSelected(Config As Configuration) As Boolean
		  
		  Return (Me.GetSelectedConfig = Config)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadProfileList()
		  
		  Dim i As Integer
		  
		  Me.lstProfiles.DeleteAllRows()
		  
		  While Me.Pages.PanelCount > 0
		    Me.Pages.Remove(0)
		  Wend
		  
		  i = 0
		  While i < UBound(Settings.Configurations)
		    If Settings.Configurations(i) = Nil Then
		      
		      Settings.Configurations.Remove(i)
		      
		    Else
		      
		      Me.Pages.Append()
		      
		      Settings.Configurations(i).Container.EmbedWithinPanel(_
		      Me.Pages, Pages.PanelCount - 1, 0, 0, Me.Pages.Width, Me.Pages.Height)
		      
		      Me.lstProfiles.AddRow(Settings.Configurations(i).Name)
		      Me.lstProfiles.CellTag(Me.lstProfiles.LastIndex, 0) = i
		      i = i + 1
		      
		    End If
		  Wend
		  
		End Sub
	#tag EndMethod


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
		    ConfigWindow.ShowWithin(Self)
		    
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
		    
		    Dim w As New UpdateWindow()
		    w.StepTransition(UpdateWindow.STEP_CHECK)
		    w.ShowModalWithin(Self)
		    
		  Case "Exit", "Quit"
		    Quit(0)
		    
		  Case Else
		    Return False
		    
		  End Select
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  If Self.Pages.Value <> Me.ListIndex Then Self.Pages.Value = Me.ListIndex
		  
		  Dim Config As Configuration = Self.GetSelectedConfig()
		  If Config <> Nil Then
		    Config.CacheChatUnread = False
		    Globals.ForceRedraw(Me)
		  End If
		  
		End Sub
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
#tag Events Pages
	#tag Event
		Sub Change()
		  
		  If Self.lstProfiles.ListIndex <> Me.Value Then Self.lstProfiles.ListIndex = Me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
