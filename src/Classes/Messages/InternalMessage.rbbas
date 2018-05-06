#tag Class
Protected Class InternalMessage
Inherits BaseMessage
	#tag Method, Flags = &h1000
		Sub Constructor(Client As BNETClient, Flags As UInt64, Text As String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor( Client, Int32( Super.Ids.InternalEvent ))
		  
		  Me.State = New MemoryBlock( 8 + LenB( Text ))
		  
		  Me.Flags = Flags
		  Me.Text = Text
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.State.UInt64Value( 0 )
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.State.UInt64Value( 0 ) = value
			  
			End Set
		#tag EndSetter
		Flags As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.State.StringValue( 8, Me.State.Size - 8 )
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Me.State.Size = 8 + LenB( value )
			  
			  Me.State.StringValue( 8, Me.State.Size - 8 ) = value
			  
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty


	#tag Constant, Name = FlagDebug, Type = Double, Dynamic = False, Default = \"&H03", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FlagError, Type = Double, Dynamic = False, Default = \"&H02", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FlagInfo, Type = Double, Dynamic = False, Default = \"&H01", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FlagNetwork, Type = Double, Dynamic = False, Default = \"&H08", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FlagSuccess, Type = Double, Dynamic = False, Default = \"&H04", Scope = Public
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
