#tag Class
Protected Class BitmapResource
Inherits Resource
	#tag Method, Flags = &h1000
		Sub Constructor(File As FolderItem)
		  // Calling the overridden superclass constructor.
		  Super.Constructor( File, Me.StreamTypeNull )
		  
		  Me.m_bitmap = Picture.Open( File )
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.m_bitmap
			  
			End Get
		#tag EndGetter
		Bitmap As Picture
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected m_bitmap As Picture
	#tag EndProperty


End Class
#tag EndClass
