#tag Class
Protected Class Friend
	#tag Method, Flags = &h0
		Sub Constructor(username As String, status As UInt8, location As UInt8, product As UInt32, locationString As String)
		  
		  Me.Username = username
		  Me.Status = status
		  Me.LocationId = location
		  Me.Product = product
		  Me.LocationString = locationString
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LocationId As UInt8
	#tag EndProperty

	#tag Property, Flags = &h0
		LocationString As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Product As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Status As UInt8
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String
	#tag EndProperty


	#tag Constant, Name = LocationInChat, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LocationOffline, Type = Double, Dynamic = False, Default = \"&H00", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LocationOnline, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LocationPasswordGame, Type = Double, Dynamic = False, Default = \"&H05", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LocationPrivateGame, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LocationPublicGame, Type = Double, Dynamic = False, Default = \"&H03", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusAway, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusDND, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusMutual, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
