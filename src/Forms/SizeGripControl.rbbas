#tag Class
Class SizeGripControl
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Me.mFireMouseUp = MouseDown(X, Y)
		  If Me.mFireMouseUp = True Then Return True
		  If X < 0 Or X > Me.Width Or Y < 0 Or Y > Me.Height Then Return False
		  
		  Me.MouseCursor = System.Cursors.HandClosed
		  
		  Me.mLockX = X
		  Me.mLockY = Y
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  
		  If Me.mFireMouseUp = True Then
		    MouseDrag(X, Y)
		    Return
		  End If
		  
		  Dim deltaX, deltaY As Integer
		  
		  deltaX = (X - Me.mLockX)
		  deltaY = (Y - Me.mLockY)
		  If deltaX = 0 And deltaY = 0 Then Return
		  
		  Dim temp(3) As Integer
		  
		  For Each c As RectControl In Me.attachments()
		    temp(0) = c.Left
		    temp(1) = c.Top
		    temp(2) = c.Width
		    temp(3) = c.Height
		    
		    MoveControl(c, deltaX, deltaY)
		    
		    If c.Left <> temp(0) Or c.Top <> temp(1) Or c.Width <> temp(2) Or c.Height <> temp(3) Then _
		    c.Window.Refresh()
		  Next
		  
		  Select Case Me.mDirection
		  Case SizeGripControl.DirectionType.Vertical
		    Me.Left = Me.Left + deltaX
		  Case SizeGripControl.DirectionType.Horizontal
		    Me.Top = Me.Top + deltaY
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  If Me.mFireMouseUp = True Then MouseUp(X, Y)
		  
		  Me.MouseCursor = System.Cursors.HandOpen
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Me.MouseCursor = System.Cursors.HandOpen
		  Open()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  g.ForeColor = App.config.globalConfig.Colors.DefaultBackColor
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = App.config.globalConfig.Colors.DefaultFrameColor
		  
		  Dim x1, x2, y1, y2, i As Integer
		  
		  Select Case Me.mDirection
		  Case SizeGripControl.DirectionType.Vertical
		    
		    x1 = g.Width / 2 - 2
		    x2 = g.Width / 2 + 2
		    y1 = g.Height / 2 - 6
		    y2 = g.Height / 2 + 6
		    
		    For i = x1 To x2 Step 2
		      g.DrawLine(i, y1, i, y2)
		    Next
		    
		  Case SizeGripControl.DirectionType.Horizontal
		    
		    x1 = g.Width / 2 - 6
		    x2 = g.Width / 2 + 6
		    y1 = g.Height / 2 - 2
		    y2 = g.Height / 2 + 2
		    
		    For i = y1 To y2 Step 2
		      g.DrawLine(x1, i, x2, i)
		    Next
		    
		  End Select
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Attach(c As RectControl)
		  
		  attachments.Append(c)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Detach(c As RectControl)
		  
		  Dim i As Integer = UBound(Me.attachments)
		  While i >= 0
		    If Me.attachments(i) = c Then
		      Me.attachments.Remove(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MoveControl(c As RectControl, dX As Integer, dY As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected attachments() As RectControl
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mDirection
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mDirection = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Direction As SizeGripControl.DirectionType
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mDirection As SizeGripControl.DirectionType
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFireMouseUp As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLockX As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLockY As Integer
	#tag EndProperty


	#tag Enum, Name = DirectionType, Type = Integer, Flags = &h0
		Horizontal
		Vertical
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="10"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
