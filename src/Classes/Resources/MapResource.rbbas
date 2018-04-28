#tag Class
Protected Class MapResource
Inherits Resource
	#tag Method, Flags = &h0
		Function Cell(row As Integer, column As Integer) As String
		  
		  Dim row_count, column_count As Integer
		  
		  row_count = UBound( Me.m_rows )
		  
		  If row < 0 Or row > row_count Then
		    // Out of bounds by row
		    Return ""
		  End If
		  
		  Dim columns() As String
		  
		  columns = Me.m_rows( row )
		  
		  column_count = UBound( columns )
		  
		  If column < 0 Or column > column_count Then
		    // Out of bounds by column
		    Return ""
		  End If
		  
		  Return columns( column )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  
		  ReDim Me.m_rows( -1 )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(File As FolderItem)
		  
		  If Right( File.Name, 4 ) <> ".csv" Then
		    Dim err As New BotException( "Unable to read resource map: " + File.Name )
		    Raise err
		  End If
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor( File, Me.StreamTypeText )
		  
		  Dim line As String
		  Dim columns() As String
		  
		  While Not Me.m_textStream.EOF()
		    line = Me.m_textStream.ReadLine( Encodings.UTF8 )
		    
		    columns = Split( line, "," )
		    
		    Me.m_rows.Append( columns )
		  Wend
		  
		  Me.m_textStream.Close()
		  Me.m_textStream = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  
		  Return ( 1 + UBound( Me.m_rows ))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(row As Integer) As String()
		  
		  If row < 0 Or row > UBound( Me.m_rows ) Then
		    Dim suberr As New OutOfBoundsException()
		    Dim err As New BotException( "Index out of bounds in map resource", 0, suberr )
		    Raise err
		  End If
		  
		  Return Me.m_rows( row )
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected m_rows() As Variant
	#tag EndProperty


End Class
#tag EndClass
