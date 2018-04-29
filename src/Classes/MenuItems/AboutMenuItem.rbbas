#tag Class
Protected Class AboutMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  
		  AboutWindow.Show()
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  
		  Me.Enable()
		  
		End Sub
	#tag EndEvent


End Class
#tag EndClass
