#tag Class
Protected Class ConnectMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  
		  Dim profile As Configuration = App.ConnectProfile()
		  
		  If profile = Nil Then Return False
		  
		  Dim i As Integer
		  Dim c As ChatWindow
		  
		  While i < REALbasic.WindowCount()
		    If REALbasic.Window( i ) IsA ChatWindow Then
		      c = ChatWindow( REALbasic.Window( i ))
		      Exit While
		    End If
		    i = i + 1
		  Wend
		  
		  If c = Nil Then
		    c = New ChatWindow()
		    c.Hide()
		    c.Left = REALbasic.Screen(0).Left + REALbasic.Screen(0).Width  / 2 - c.Width  / 2
		    c.Top  = REALbasic.Screen(0).Top  + REALbasic.Screen(0).Height / 2 - c.Height / 2
		  End If
		  
		  Dim cl As New BNETClient()
		  
		  cl.config = profile
		  
		  c.AddClient( cl, True )
		  
		  c.Show()
		  
		  cl.Connect()
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  
		  Me.Enable()
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoEnable"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Checked"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandKey"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Icon"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="KeyboardShortcut"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
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
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mIndex"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="MenuItem"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
