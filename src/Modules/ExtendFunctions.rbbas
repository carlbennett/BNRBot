#tag Module
Protected Module ExtendFunctions
	#tag Method, Flags = &h0
		Function Hex(Extends c As Color) As String
		  
		  Dim a As String = ""
		  
		  If c.Alpha <> 0 Then
		    a = Right( "0" + Hex( c.Alpha ), 2 )
		  End If
		  
		  Return Right( "0" + Hex( c.Red ), 2 ) + Right( "0" + Hex( c.Green ), 2 ) + Right( "0" + Hex( c.Blue ), 2 ) + a
		  
		End Function
	#tag EndMethod

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
