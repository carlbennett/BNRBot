#tag Class
Protected Class GlobalConfiguration
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.CheckForUpdates      = True
		  Me.MinimizeToTray       = False
		  Me.PingRangesFlushRight = True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CheckForUpdates As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimizeToTray As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PingRangesFlushRight As Boolean
	#tag EndProperty


End Class
#tag EndClass
