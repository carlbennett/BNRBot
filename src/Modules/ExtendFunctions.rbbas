#tag Module
Protected Module ExtendFunctions
	#tag Method, Flags = &h0
		Function ReadCString(Extends stream As BinaryStream) As String
		  
		  Dim buffer As String
		  Dim char As UInt8
		  
		  Do Until stream.EOF()
		    char = stream.ReadUInt8()
		    If char = 0 Then Exit Do
		    buffer = buffer + ChrB(char)
		  Loop
		  
		  Return buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteCString(Extends stream As BinaryStream, value As String)
		  
		  stream.Write(value + ChrB(0))
		  
		End Sub
	#tag EndMethod


End Module
#tag EndModule
