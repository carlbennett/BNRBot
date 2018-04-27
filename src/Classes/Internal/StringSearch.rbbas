#tag Class
Protected Class StringSearch
	#tag Method, Flags = &h0
		Sub Constructor(Mode As UInt8, Pattern As String)
		  
		  Me.Mode    = Mode
		  Me.Pattern = Pattern
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Match(value As String) As Boolean
		  
		  Select Case Me.Mode
		  Case Me.ModeExactString
		    
		    Return ( Me.Pattern = value )
		    
		  Case Me.ModeRegularExpression
		    
		    // TODO
		    
		    Dim e As New RuntimeException()
		    e.Message = "Not yet implemented"
		    Raise e
		    
		  Case Else
		    
		    Dim e As New RuntimeException()
		    e.Message = "Unknown match mode: " + Format(Me.Mode, "-#")
		    Raise e
		    
		    Return False
		    
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Mode As UInt8
	#tag EndProperty

	#tag Property, Flags = &h0
		Pattern As String
	#tag EndProperty


	#tag Constant, Name = ModeExactString, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ModeRegularExpression, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
