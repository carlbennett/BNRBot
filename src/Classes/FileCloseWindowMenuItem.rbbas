#tag Class
Protected Class FileCloseWindowMenuItem
Inherits MenuItem
	#tag Event
		Function Action() As Boolean
		  
		  If Me.Tag.ObjectValue IsA Window Then Window(Me.Tag.ObjectValue).Close()
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenu()
		  
		  Me.Enabled = (Me.Tag.ObjectValue IsA Window)
		  
		End Sub
	#tag EndEvent


End Class
#tag EndClass
