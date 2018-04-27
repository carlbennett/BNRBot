#tag Class
Class ColorProgressBar
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  g.ForeColor = Me.BackColor
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.ForeColor = Me.ForeColor
		  
		  Dim infinite As Boolean = ( Me.mMaximum = 0 )
		  Dim infiniteSectionWidth As Integer = 30
		  Dim x As Integer = 0
		  
		  If Not infinite Then
		    x = ( Me.mValue / Me.mMaximum * g.Width )
		    g.FillRect( 0, x, 0, g.Height )
		  Else
		    x = ( REALbasic.Ticks() Mod infiniteSectionWidth * 2 ) - infiniteSectionWidth
		    While x <= g.Width
		      g.FillRect( x, 0, infiniteSectionWidth, g.Height )
		      x = x + infiniteSectionWidth * 2
		    Wend
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  If ColorProgressBar.RedrawThread = Nil Then
		    ColorProgressBar.RedrawThread = New ColorProgressBarThread()
		  End If
		  
		  ColorProgressBar.RedrawThread.ProgressBars.Append( Me )
		  
		  If ColorProgressBar.RedrawThread.State = ColorProgressBarThread.NotRunning Then
		    ColorProgressBar.RedrawThread.Run()
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  If ColorProgressBar.RedrawThread = Nil Then Return
		  
		  If ColorProgressBar.RedrawThread.State = ColorProgressBarThread.Running Then
		    ColorProgressBar.RedrawThread.Kill()
		  End If
		  
		  Dim i As Integer = UBound( ColorProgressBar.RedrawThread.ProgressBars )
		  
		  While i >= 0
		    If ColorProgressBar.RedrawThread.ProgressBars( i ) = Me Then
		      ColorProgressBar.RedrawThread.ProgressBars.Remove( i )
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		  If UBound( ColorProgressBar.RedrawThread.ProgressBars ) < 0 Then
		    ColorProgressBar.RedrawThread = Nil
		  Else
		    ColorProgressBar.RedrawThread.Run()
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeColor As Color
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mMaximum
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mMaximum = value
			  
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Maximum As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mMaximum As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mValue As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared RedrawThread As ColorProgressBarThread
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mValue
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.mValue = value
			  
			  Me.Refresh()
			  
			End Set
		#tag EndSetter
		Value As Integer
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
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
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
			Name="ForeColor"
			Visible=true
			Group="Appearance"
			InitialValue="&c000000"
			Type="Color"
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
			Name="Maximum"
			Visible=true
			Group="Initial State"
			InitialValue="100"
			Type="Integer"
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
			Name="Value"
			Visible=true
			Group="Initial State"
			InitialValue="0"
			Type="Integer"
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
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
