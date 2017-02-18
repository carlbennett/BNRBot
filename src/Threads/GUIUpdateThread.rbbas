#tag Class
Protected Class GUIUpdateThread
Inherits Thread
	#tag Event
		Sub Run()
		  
		  Dim e As GUIUpdateEvent
		  
		  While UBound(Me.events) >= 0
		    e = Me.events(0)
		    Me.events.Remove(0)
		    If e = Nil Then Continue While
		    If e.client = Nil Then Continue While
		    If e.client.gui = Nil Then Continue While
		    
		    // TODO: Parse GUIUpdateEvent
		  Wend
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		events() As GUIUpdateEvent
	#tag EndProperty


End Class
#tag EndClass
