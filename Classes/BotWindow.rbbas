#tag Class
Protected Class BotWindow
Inherits Window
	#tag Event
		Sub Maximize()
		  
		  Self.Refresh(True)
		  Maximize()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Dim i As Integer = 0
		  While i < Me.ControlCount
		    If Me.Control(i) IsA PagePanel Then
		      Me.mPagePanel = PagePanel(Me.Control(i))
		      Exit While
		    End If
		    i = i + 1
		  Wend
		  
		  Open()
		  
		End Sub
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
		      
		      If (RC IsA TextArea Or RC IsA TextField Or RC IsA ListBox) And RC.Visible = True And _
		        (Me.mPagePanel = Nil Or (Me.mPagePanel <> Nil And RC.PanelIndex = -1 Or _
		        (RC.PanelIndex <> -1 And RC.PanelIndex = Me.mPagePanel.Value))) Then
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

	#tag Event
		Sub Resized()
		  
		  Self.Refresh(True)
		  Resized()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  Self.Refresh(True)
		  Resizing()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Restore()
		  
		  Self.Refresh(True)
		  Restore()
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Maximize()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resized()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resizing()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Restore()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mPagePanel As PagePanel
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CloseButton"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Composite"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Frame"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Window"
			#tag EnumValues
				"0 - Document"
				"1 - Movable Modal"
				"2 - Modal Dialog"
				"3 - Floating Window"
				"4 - Plain Box"
				"5 - Shadowed Box"
				"6 - Rounded Window"
				"7 - Global Floating Window"
				"8 - Sheet Window"
				"9 - Metal Window"
				"10 - Drawer Window"
				"11 - Modeless Dialog"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="FullScreen"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasBackColor"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="400"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImplicitInstance"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			EditorType="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Interfaces"
			Visible=true
			Group="ID"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LiveResize"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacProcID"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxHeight"
			Visible=true
			Group="Position"
			InitialValue="32000"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximizeButton"
			Visible=true
			Group="Appearance"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxWidth"
			Visible=true
			Group="Position"
			InitialValue="32000"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBar"
			Visible=true
			Group="Appearance"
			Type="MenuBar"
			EditorType="MenuBar"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MenuBarVisible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinHeight"
			Visible=true
			Group="Position"
			InitialValue="64"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimizeButton"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinWidth"
			Visible=true
			Group="Position"
			InitialValue="64"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Placement"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			InheritedFrom="Window"
			#tag EnumValues
				"0 - Default"
				"1 - Parent Window"
				"2 - Main Screen"
				"3 - Parent Window Screen"
				"4 - Stagger"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Resizeable"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=true
			Group="Appearance"
			InitialValue="Untitled"
			Type="String"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Window"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="600"
			Type="Integer"
			InheritedFrom="Window"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
