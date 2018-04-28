#tag Class
Protected Class Resource
	#tag Method, Flags = &h0
		Sub Constructor(File As FolderItem, StreamType As Integer)
		  
		  Me.m_file = File
		  Me.m_streamType = StreamType
		  
		  Me.m_binStream = Nil
		  Me.m_textStream = Nil
		  
		  Select Case Me.m_streamType
		    
		  Case Me.StreamTypeNull
		    // Do nothing
		    
		  Case Me.StreamTypeBinary
		    Me.m_binStream = BinaryStream.Open( Me.m_file, False )
		    
		  Case Me.StreamTypeText
		    Me.m_textStream = TextInputStream.Open( Me.m_file )
		    
		  Case Else
		    Dim err As New BotException( "Unhandled stream type: " + Format( Me.m_streamType, "-#" ))
		    Raise err
		    
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  If Me.m_binStream <> Nil Then
		    Me.m_binStream.Close()
		  End If
		  
		  If Me.m_textStream <> Nil Then
		    Me.m_textStream.Close()
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected m_binStream As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_streamType As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_textStream As TextInputStream
	#tag EndProperty


	#tag Constant, Name = StreamTypeBinary, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StreamTypeNull, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StreamTypeText, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
