#tag Class
Protected Class ColorProgressBarThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  Dim i As Integer
		  Dim ub As Integer
		  
		  Do
		    ub = UBound( Me.ProgressBars )
		    For i = 0 To ub
		      If Me.ProgressBars( i ).Maximum = 0 And Me.ProgressBars( i ).Visible Then Me.ProgressBars( i ).Refresh()
		    Next
		    App.YieldToNextThread()
		    Me.Sleep( Me.Interval )
		  Loop
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Interval As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressBars() As ColorProgressBar
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Interval"
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Thread"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Thread"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
