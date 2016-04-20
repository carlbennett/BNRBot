#tag Class
Protected Class UIButton
Inherits Canvas
	#tag Event
		Sub GotFocus()
		  
		  Me.mFocused = True
		  Me.Refresh()
		  GotFocus()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  
		  Me.mKeyDownKey = ""
		  
		  If KeyDown(Key) = True Then
		    Me.mKeyDownEvent = True
		    Return True
		  End If
		  
		  If Asc(Key) = 32 Then
		    Me.mKeyDownKey = Key
		    Me.Refresh()
		    Return True
		  End If
		  
		  Return False
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  
		  If Me.mKeyDownEvent = True Then
		    Me.mKeyDownKey = ""
		    Me.mKeyUpKey = ""
		    KeyUp(Key)
		    Return
		  End If
		  
		  If Asc(Key) = 32 Then
		    Me.mKeyDownKey = ""
		    Me.mKeyUpKey = Key
		    Me.Refresh()
		    Action()
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  
		  Me.mFocused = False
		  Me.Refresh()
		  LostFocus()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  
		  Me.mMouseDownEvent = MouseDown(X, Y)
		  
		  If Me.mMouseDownEvent = False Then
		    Me.mMouseDown = True
		    Me.Refresh()
		  End If
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  
		  MouseDrag(X, Y)
		  
		  Dim newVal As Boolean = (X >= 0 And X <= Me.Width And Y >= 0 And Y <= Me.Height)
		  If newVal <> Me.mMouseDrag Then Me.Refresh()
		  Me.mMouseDrag = newVal
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  If Me.mMouseDownEvent = True Then
		    MouseUp(X, Y)
		    Return
		  End If
		  
		  Me.mMouseDown = False
		  Me.mMouseDrag = False
		  Me.Refresh()
		  If X >= 0 And X <= Me.Width And Y >= 0 And Y <= Me.Height Then Action()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  If Me.mMouseDown = True Or Me.mMouseDrag = True Or Asc(Me.mKeyDownKey) = 32 Then
		    g.ForeColor = Me.ActiveColor
		  Else
		    g.ForeColor = Me.BackgroundColor
		  End If
		  
		  g.FillRect(0, 0, g.Width, g.Height)
		  
		  If Me.Focused = False Then
		    g.ForeColor = Me.BorderColor
		  Else
		    g.ForeColor = Me.ActiveColor
		  End If
		  
		  g.DrawRect(0, 0, g.Width, g.Height)
		  
		  g.ForeColor = Me.TextColor
		  g.TextFont = Me.TextFont
		  g.TextSize = Me.TextSize
		  g.TextUnit = Me.TextUnit
		  g.Bold = Me.Bold
		  g.Italic = Me.Italic
		  g.Underline = Me.Underline
		  
		  g.DrawString(Me.Text, g.Width/2-g.StringWidth(Me.Text)/2, g.Height/2+g.TextAscent/2, g.Width-2, True)
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GotFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(Key As String) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(Key As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LostFocus()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp(X As Integer, Y As Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mActiveColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mActiveColor = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		ActiveColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mBackgroundColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mBackgroundColor = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		BackgroundColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mBold
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mBold = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Bold As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mBorderColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mBorderColor = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		BorderColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mFocused
			  
			End Get
		#tag EndGetter
		Focused As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mItalic
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mItalic = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Italic As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mActiveColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBackgroundColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBorderColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFocused As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItalic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeyDownEvent As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeyDownKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mKeyUpKey As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDownEvent As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMouseDrag As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextFont As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextSize As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTextUnit As FontUnits
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUnderline As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mText
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mText = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mTextColor
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mTextColor = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mTextFont
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mTextFont = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mTextSize
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mTextSize = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		TextSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mTextUnit
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mTextUnit = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		TextUnit As FontUnits
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mUnderline
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mUnderline = value
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Underline As Boolean
	#tag EndComputedProperty


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
			Name="ActiveColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
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
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Group="Behavior"
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
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="20"
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
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			InitialValue="80"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
