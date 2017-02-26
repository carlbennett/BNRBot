#tag Class
Protected Class UserIcon
	#tag Method, Flags = &h0
		Sub Constructor(Product As UInt32, Flags As UInt32, ExtraData As UInt32)
		  
		  Me.Product = Product
		  Me.Flags = Flags
		  Me.ExtraData = ExtraData
		  Me.Bitmap = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Product As UInt32, Flags As UInt32, ExtraData As UInt32, Bitmap As Picture)
		  
		  Me.Product = Product
		  Me.Flags = Flags
		  Me.ExtraData = ExtraData
		  Me.Bitmap = Bitmap
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Product As UInt32, Flags As UInt32, ExtraData As UInt32, BitmapMask As Picture, Row As Integer, Column As Integer)
		  
		  Me.Product = Product
		  Me.Flags = Flags
		  Me.ExtraData = ExtraData
		  Me.Bitmap = UserIcon.IconFromImage(BitmapMask, Row, Column)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IconFromImage(MaskBitmap As Picture, Row As Integer, Column As Integer) As Picture
		  
		  If MaskBitmap = Nil Then Return Nil
		  Dim X, Y, W, H As Integer
		  
		  W = 28
		  H = 14
		  X = W * Column
		  Y = H * Row
		  
		  Dim Buffer As Picture = New Picture(W, H, 24)
		  Buffer.Graphics.DrawPicture(MaskBitmap, 0, 0, W, H, X, Y, W, H)
		  Return Buffer
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Bitmap As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ExtraData As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Flags As UInt32
	#tag EndProperty

	#tag Property, Flags = &h0
		Product As UInt32
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bitmap"
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
