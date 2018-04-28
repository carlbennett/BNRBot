#tag Class
Protected Class ProductIcon
	#tag Method, Flags = &h0
		Sub Constructor(product As UInt32)
		  
		  Me.m_product = product
		  
		  Me.m_bitmap = Me.getIcon()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetCachedIcon(product As UInt32) As Picture
		  
		  If ProductIcon.Icons = Nil Then
		    ProductIcon.Icons = New Dictionary()
		  End If
		  
		  Dim result As Picture = Nil
		  
		  If result = Nil Then
		    
		    result = ProductIcon.Icons.Lookup( product, Nil )
		    
		  End If
		  
		  If result = Nil Then
		    
		    Dim icon As ProductIcon = New ProductIcon( product )
		    
		    result = icon.Bitmap
		    
		    If result <> Nil Then
		      ProductIcon.Icons.Value( product ) = result
		    End If
		    
		  End If
		  
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getIcon() As Picture
		  
		  Dim dir, file As FolderItem
		  Dim map As MapResource
		  Dim iterator, count As Integer
		  Dim cells(), s_file, s_x, s_y, s_w, s_h, s_p As String
		  Dim m_p As MemoryBlock
		  
		  file = SpecialFolder.CurrentWorkingDirectory
		  
		  #If DebugBuild Then
		    file = file.Child( "src" )
		  #EndIf
		  
		  file = file.Child( "Resources" )
		  
		  If file = Nil Or Not file.Exists Or Not file.Directory Then
		    Dim err As New BotException( "Resources directory is invalid" )
		    Raise err
		  End If
		  
		  dir = file
		  file = file.Child( "ProductMap.csv" )
		  
		  If file = Nil Or Not file.Exists Or Not file.IsReadable Then
		    Dim err As New BotException( "Product map resource is invalid" )
		    Raise err
		  End If
		  
		  map = New MapResource( file )
		  
		  iterator = 0
		  count = map.Count()
		  
		  m_p = New MemoryBlock( 4 )
		  m_p.LittleEndian = False // allows matching as an example, internal "RATS" to user input "STAR"
		  
		  While iterator < count
		    
		    cells = map.Item( iterator )
		    
		    If UBound( cells ) >= 5 Then
		      
		      s_file = cells( 0 )
		      s_x    = cells( 1 )
		      s_y    = cells( 2 )
		      s_w    = cells( 3 )
		      s_h    = cells( 4 )
		      s_p    = cells( 5 )
		      
		      m_p.StringValue( 0, 4 ) = s_p
		      
		      If m_p.UInt32Value( 0 ) = Me.m_product Then
		        
		        Return Me._getIconCoords( dir.Child( s_file ), Val( s_x ), Val( s_y ), Val( s_w ), Val( s_h ))
		        
		      End If
		      
		    End If
		    
		    iterator = iterator + 1
		    
		  Wend
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _getIconCoords(file As FolderItem, x As Integer, y As Integer, w As Integer, h As Integer) As Picture
		  
		  If file = Nil Or Not file.Exists Then
		    Return Nil
		  End If
		  
		  Dim bitmap As BitmapResource = New BitmapResource( file )
		  
		  Dim image As Picture = bitmap.Bitmap
		  
		  Dim buffer As New Picture( w, h, 32 )
		  
		  buffer.Graphics.DrawPicture( image, 0, 0, w, h, x, y, w, h )
		  
		  Return buffer
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  If Me.m_bitmap = Nil Then
			    Me.m_bitmap = Me.getIcon()
			  End If
			  
			  Return Me.m_bitmap
			  
			End Get
		#tag EndGetter
		Bitmap As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared Icons As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_bitmap As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected m_product As UInt32
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.m_product
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.m_product = value
			  
			  Me.m_bitmap = Me.getIcon()
			  
			End Set
		#tag EndSetter
		Product As UInt32
	#tag EndComputedProperty


End Class
#tag EndClass
