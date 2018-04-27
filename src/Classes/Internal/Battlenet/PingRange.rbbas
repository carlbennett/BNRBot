#tag Class
Protected Class PingRange
	#tag Method, Flags = &h0
		Sub Constructor(lowVal As UInt32, highVal As UInt32, barCountVal As UInt32, barColorVal As UInt32)
		  
		  Me.LowestPing  = lowVal
		  Me.HighestPing = highVal
		  Me.BarCount    = barCountVal
		  Me.BarColorId  = barColorVal
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BarColorId As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		BarCount As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		HighestPing As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		LowestPing As UInt32
	#tag EndProperty


	#tag Constant, Name = BarColorGreen, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BarColorRed, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BarColorYellow, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
