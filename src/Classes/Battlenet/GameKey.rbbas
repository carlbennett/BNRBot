#tag Class
Protected Class GameKey
Implements Serializable
	#tag Method, Flags = &h0
		Sub Constructor(Key As String)
		  
		  Dim gameKey    As String
		  Dim productVal As UInt32
		  Dim publicVal  As UInt32
		  Dim privateVal As MemoryBlock
		  
		  gameKey = Battlenet.strToGameKey(Key)
		  
		  If Battlenet.getKeyData(gameKey, productVal, publicVal, privateVal) = False Then
		    
		    Raise New InvalidGameKeyException(Key, Nil)
		    
		  End If
		  
		  Me.Key        = gameKey
		  Me.ProductVal = productVal
		  Me.PublicVal  = publicVal
		  Me.PrivateVal = privateVal
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyString() As String
		  
		  Return Me.Key
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrivateValue() As MemoryBlock
		  
		  Dim mb As MemoryBlock
		  
		  mb = New MemoryBlock(Me.PrivateVal.Size)
		  
		  mb.StringValue(0, mb.Size) = Me.PrivateVal.StringValue(0, mb.Size)
		  
		  Return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProductValue() As UInt32
		  
		  Return Me.ProductVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PublicValue() As UInt32
		  
		  Return Me.PublicVal
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Serialize() As String
		  // Part of the Serializable interface.
		  
		  Dim mb As New MemoryBlock( 8 + Me.PrivateVal.Size )
		  
		  mb.LittleEndian = True
		  
		  mb.UInt32Value( 0 ) = Me.ProductVal
		  mb.UInt32Value( 4 ) = Me.PublicVal
		  mb.StringValue( 8, Me.PrivateVal.Size ) = Me.PrivateVal
		  
		  Return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unserialize(value As String)
		  // Part of the Serializable interface.
		  
		  Dim mb As MemoryBlock = value
		  
		  mb.LittleEndian = True
		  
		  Me.ProductVal = mb.UInt32Value( 0 )
		  Me.PublicVal = mb.UInt32Value( 4 )
		  Me.PrivateVal = mb.StringValue( 8, mb.Size - 8 )
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Key As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PrivateVal As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ProductVal As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PublicVal As UInt32
	#tag EndProperty


	#tag ViewBehavior
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
