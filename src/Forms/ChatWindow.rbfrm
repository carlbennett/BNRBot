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
   Width           =   600
   Begin Listbox ChatContainerList
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
      RequiresSelection=   True
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
      Width           =   100
      _ScrollWidth    =   -1
   End
   Begin PagePanel ChatContainers
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   110
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
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   490
   End
   Begin SizeGripControl SizeGripControl1
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   100
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
		Sub Change()
		  
		  If Me.ListIndex = -1 Then
		    Self.ChatContainers.Value = -1
		  Else
		    Self.ChatContainers.Value = Me.CellTag(Me.ListIndex, 1)
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  
		  #pragma Unused column
		  
		  If Me.ListIndex = row Then
		    g.ForeColor = HighlightColor()
		  Else
		    g.ForeColor = App.config.globalConfig.Colors.ChatBackColor
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  Return True
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		  If row = Me.ListIndex Then
		    g.ForeColor = App.config.globalConfig.Colors.ChatBackColor
		  Else
		    g.ForeColor = App.config.globalConfig.Colors.DefaultTextColor
		  End If
		  
		  If row < 0 Or row >= Me.ListCount Or column < 0 Or column >= Me.ColumnCount Then
		    Return False
		  End If
		  
		  g.DrawString(Me.Cell(row, column), x, y, g.Width - x * 2, True)
		  
		  Return True
		  
		End Function
	#tag EndEvent
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
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SizeGripControl1
	#tag Event
		Sub Open()
		  
		  Me.Direction = SizeGripControl.DirectionType.Vertical
		  
		  Me.Attach(Self.ChatContainerList)
		  Me.Attach(Self.ChatContainers)
		  
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
