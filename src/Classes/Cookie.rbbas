#tag Class
Protected Class Cookie
	#tag Method, Flags = &h0
		Sub Constructor(Type As Byte)
		  
		  Me.mType = Type
		  Me.mValues = New Dictionary()
		  
		  Do
		    Me.mCookie = Globals.GenerateDWORD()
		  Loop Until Not Globals.Cookies.HasKey(Me.mCookie)
		  Globals.Cookies.Value(Me.mCookie) = Me
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  If Globals.Cookies = Nil Then Return
		  If Globals.Cookies.HasKey(Me.mCookie) = True Then
		    Globals.Cookies.Remove(Me.mCookie)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Lookup(iCookie As UInt32, Prune As Boolean = False) As Cookie
		  
		  Dim oCookie As Cookie
		  
		  oCookie = Globals.Cookies.Lookup(iCookie, Nil)
		  
		  If Prune = True And Globals.Cookies.HasKey(iCookie) = True Then
		    Globals.Cookies.Remove(iCookie)
		  End If
		  
		  Return oCookie
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key As String, nullValue As Variant = Nil) As Variant
		  
		  Return Me.mValues.Lookup(key, nullValue)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key As String, Assigns value As Variant)
		  
		  Me.mValues.Value(key) = value
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mCookie
			  
			End Get
		#tag EndGetter
		Cookie As UInt32
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mCookie As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mType As Byte
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mValues As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mType
			  
			End Get
		#tag EndGetter
		Type As Byte
	#tag EndComputedProperty


	#tag Constant, Name = TypeClanDisband, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeClanMemberInfo, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeClanMemberInvite, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeClanMemberRankChange, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeClanMemberRemove, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeExtendedAccount, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TypeProfile, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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
