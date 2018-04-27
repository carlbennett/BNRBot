#tag Window
Begin Window ChatWindow
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1100060671
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Chat Window"
   Visible         =   True
   Width           =   760
   Begin ChatListbox ChatContainerList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   False
      ColumnCount     =   1
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
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
      RequiresSelection=   False
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
   Begin PagePanel ChatContainers
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   160
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin Label NoProfileLabels
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   14
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "ChatContainers"
         Italic          =   ""
         Left            =   160
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
         Top             =   22
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   600
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
         InitialParent   =   "ChatContainers"
         Italic          =   ""
         Left            =   160
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
         Text            =   "Select from the left or open Profile Manager."
         TextAlign       =   1
         TextColor       =   &h000000
         TextFont        =   "Arial"
         TextSize        =   11
         TextUnit        =   0
         Top             =   38
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   600
      End
   End
   Begin SizeGripControl SizeGripControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      BackColor       =   ""
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      ForeColor       =   ""
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   150
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   10
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  
		  If appQuitting = True Then Return False
		  
		  Dim i As Integer = 0
		  Dim j As Integer = REALbasic.WindowCount() - 1
		  
		  While i <= j
		    If REALbasic.Window(i) IsA ChatWindow And REALbasic.Window(i) <> Me Then Return False
		    i = i + 1
		  Wend
		  
		  If MsgBox("There are no other chat windows, closing this one will exit the application. Are you sure?", _
		    36, "Confirm Quit") = 6 Then Return False
		    
		    Return True
		    
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  
		  FileCloseWindow.Tag = Me
		  WindowMaximize.Tag = Me
		  WindowMinimize.Tag = Me
		  WindowRestore.Tag = Me
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.BackColor = App.config.colors.DefaultBackColor
		  Me.HasBackColor = True
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileDisconnectProfile() As Boolean Handles FileDisconnectProfile.Action
			
			If Me.ChatContainerList.ListIndex = -1 Then Return False
			
			Dim client As BNETClient = Me.ChatContainerList.RowTag( Me.ChatContainerList.ListIndex )
			
			client.Disconnect()
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileReconnectProfile() As Boolean Handles FileReconnectProfile.Action
			
			If Me.ChatContainerList.ListIndex = -1 Then Return False
			
			Dim client As BNETClient = Me.ChatContainerList.RowTag( Me.ChatContainerList.ListIndex )
			
			client.Connect()
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddClient(client As BNETClient, focus As Boolean)
		  
		  Me.clients.Append(client)
		  
		  Me.ChatContainers.Append()
		  
		  Me.ChatContainerList.AddRow(client.config.alias)
		  Me.ChatContainerList.RowTag(Me.ChatContainerList.LastIndex) = client
		  Me.ChatContainerList.CellTag(Me.ChatContainerList.LastIndex, 1) = Me.ChatContainers.PanelCount - 1
		  
		  If client.gui = Nil Then
		    client.gui = New ChatContainer()
		  End If
		  
		  client.gui.EmbedWithinPanel(Me.ChatContainers, Me.ChatContainers.PanelCount - 1, _
		  0, 0, Me.ChatContainers.Width, Me.ChatContainers.Height)
		  
		  If focus Then
		    Me.ChatContainerList.ListIndex = Me.ChatContainerList.LastIndex
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveClient(client As BNETClient)
		  
		  Dim i As Integer
		  
		  i = UBound(Me.clients)
		  While i >= 0
		    If Me.clients(i) = client Then
		      Me.clients.Remove(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		  i = Me.ChatContainerList.ListCount - 1
		  While i >= 0
		    If Me.ChatContainerList.RowTag(i) = client Then
		      Me.ChatContainers.Remove(Me.ChatContainerList.CellTag(i, 1))
		      Me.ChatContainerList.RemoveRow(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		  client.gui.Close()
		  client.gui = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub TransferProfile(source As ChatWindow, destination As ChatWindow, sourceRow As Integer)
		  
		  Logger.WriteLine( True, "Transfer profile between two chat windows in progress" )
		  
		  Dim client As BNETClient = source.ChatContainerList.RowTag( sourceRow )
		  
		  source.RemoveClient( client )
		  
		  destination.AddClient( client, True )
		  
		  destination.SetFocus()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private clients() As BNETClient
	#tag EndProperty


#tag EndWindowCode

#tag Events ChatContainerList
	#tag Event
		Sub Open()
		  
		  Me.AcceptRawDataDrop( DragNDropTypes.ChatContainer )
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  
		  #pragma Unused action
		  
		  If obj = Nil Then Return
		  
		  Dim buffer As MemoryBlock
		  Dim row As Integer
		  Dim windowHandle As Integer
		  Dim cw As ChatWindow
		  
		  Do
		    
		    If Not obj.RawDataAvailable( DragNDropTypes.ChatContainer ) Then Continue Do
		    
		    buffer = obj.RawData( DragNDropTypes.ChatContainer )
		    row = buffer.Int32Value( 0 )
		    windowHandle = buffer.Int32Value( 4 )
		    
		    Dim i As Integer = 0
		    While i < REALbasic.WindowCount()
		      
		      If REALbasic.Window( i ).Handle = windowHandle And REALbasic.Window( i ) IsA ChatWindow Then
		        
		        cw = ChatWindow( REALbasic.Window( i ))
		        
		        ChatWindow.TransferProfile( cw, Self, row )
		        
		        Exit While
		        
		      End If
		      
		      i = i + 1
		    Wend
		    
		  Loop Until Not obj.NextItem()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  
		  If drag = Nil Or row < 0 Or row >= Me.ListCount Then Return False // REALbasic is a fucker.
		  
		  Dim buffer As New MemoryBlock( 8 )
		  
		  buffer.Int32Value( 0 ) = row
		  buffer.Int32Value( 4 ) = Self.Handle
		  
		  drag.PrivateRawData( DragNDropTypes.ChatContainer ) = buffer
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  
		  Dim page As Integer
		  
		  If Me.ListIndex = -1 Then
		    page = 0
		  Else
		    page = Me.CellTag(Me.ListIndex, 1)
		  End If
		  
		  Self.ChatContainers.Value = page
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellMouseExit(row As Integer, column As Integer)
		  
		  Me.CellUnderline( row, column ) = False
		  Me.MouseCursor = Nil
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellMouseEnter(row As Integer, column As Integer)
		  
		  Me.CellUnderline( row, column ) = True
		  Me.MouseCursor = System.Cursors.FingerPointer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NoProfileLabels
	#tag Event
		Sub Open(index as Integer)
		  
		  #pragma Unused index
		  
		  Me.TextColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SizeGripControl1
	#tag Event
		Sub Open()
		  
		  Me.Direction = SizeGripControl.DirectionType.Vertical
		  
		  Me.Attach(Self.ChatContainerList)
		  Me.Attach(Self.ChatContainers)
		  
		  Me.BackColor = App.config.colors.DefaultBackColor
		  Me.ForeColor = App.config.colors.DefaultTextColor
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MoveControl(c As RectControl, dX As Integer, dY As Integer)
		  
		  #pragma Unused dY
		  
		  Select Case c
		  Case Self.ChatContainerList
		    
		    c.Width = c.Width + dX
		    
		  Case Self.ChatContainers
		    
		    c.Left = c.Left + dX
		    c.Width = c.Width - dX
		    
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
