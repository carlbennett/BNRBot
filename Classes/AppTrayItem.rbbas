#tag Class
Protected Class AppTrayItem
Inherits TrayItem
	#tag Event
		Sub Action(cause as Integer)
		  
		  Select Case cause
		  Case Me.LeftMouseButton
		    wMain.Hide()
		    
		  Case Me.DoubleClick
		    wMain.Show()
		    wMain.Activate()
		    
		  Case Me.RightMouseButton
		    Dim base As MenuItem = New MenuItem("")
		    If Me.ConstructMenu(base) = True And base <> Nil Then Me.MenuAction(base.PopUp())
		    
		  Case Else
		    #If TargetWin32 = False Then Beep()
		    Call MsgBox("Error - unrecognized mouse button.", 64, "BNRBot v2")
		    
		  End Select
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ConstructMenu(ByRef base As MenuItem) As Boolean
		  
		  If base = Nil Then Return False
		  
		  base.Insert(0, New MenuItem("Main Window"))
		  
		  base.Item(0).Insert(0, New MenuItem("Show", wMain))
		  If wMain.Visible = True Then base.Item(0).Item(0).Text = "Hide"
		  
		  base.Insert(1, New MenuItem(base.TextSeparator))
		  
		  base.Insert(2, New MenuItem("Configure"))
		  
		  base.Insert(3, New MenuItem(base.TextSeparator))
		  
		  base.Insert(4, New MenuItem("Connect All"))
		  base.Insert(5, New MenuItem("Reconnect All"))
		  base.Insert(6, New MenuItem("Disconnect All"))
		  
		  base.Insert(7, New MenuItem(base.TextSeparator))
		  
		  base.Insert(8, New MenuItem("Exit"))
		  
		  Return (base.Count > 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ParamArray Customs As Variant)
		  
		  Dim Bitset As Byte = &B00000000
		  
		  For Each Item As Variant In Customs
		    Select Case Item.Type
		    Case Item.TypeBoolean
		      
		      If Item = True Then
		        Bitset = BitOr(Bitset, &B00000001)
		      Else
		        Bitset = BitAnd(Bitset, OnesComplement(&B00000001))
		      End If
		      
		    Case Item.TypeString
		      
		      Me.HelpTag = Item
		      Bitset = BitOr(Bitset, &B00000010)
		      
		    Case Item.TypeObject
		      
		      If Item IsA Picture Then
		        Me.Icon = Picture(Item)
		        Bitset = BitOr(Bitset, &B00000100)
		      End If
		      
		    End Select
		  Next
		  
		  If BitAnd(Bitset, &B00000001) = 0 Then Call App.AddTrayItem(Me)
		  If BitAnd(Bitset, &B00000010) = 0 Then Me.HelpTag = App.VersionString()
		  If BitAnd(Bitset, &B00000100) = 0 Then Me.Icon = imgAppIcon16x
		  
		  Me.mAutoAddedToTray = (BitAnd(Bitset, &B00000001) = 0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  If Me.mAutoAddedToTray = True Then App.RemoveTrayItem(Me)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MenuAction(hitItem As MenuItem)
		  
		  If hitItem = Nil Then Return
		  
		  If hitItem.Tag IsA wMain And hitItem.Text = "Show" Then
		    wMain(hitItem.Tag).Show()
		    wMain(hitItem.Tag).Activate()
		    
		  ElseIf hitItem.Tag IsA wMain And hitItem.Text = "Hide" Then
		    wMain(hitItem.Tag).Hide()
		    
		  Else
		    
		    Select Case hitItem.Text
		    Case "Configure"
		      wConfig.Show()
		      
		    Case "Connect All"
		      Globals.ConnectAll()
		      
		    Case "Reconnect All"
		      Globals.ReconnectAll()
		      
		    Case "Disconnect All"
		      Globals.DisconnectAll()
		      
		    Case "Exit"
		      Quit(0)
		      
		    End Select
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mAutoAddedToTray As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HelpTag"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="TrayItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="TrayItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
