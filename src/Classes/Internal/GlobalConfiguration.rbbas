#tag Class
Protected Class GlobalConfiguration
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.CheckForUpdates      = True
		  Me.Colors               = New ColorSwatch()
		  Me.MinimizeToTray       = False
		  Me.PingRangesFlushRight = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CheckForUpdates As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Colors As ColorSwatch
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimizeToTray As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PingRangesFlushRight As Boolean
	#tag EndProperty


End Class
#tag EndClass
