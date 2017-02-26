#tag Module
Protected Module UI
	#tag Constant, Name = ControlBackColor, Type = Color, Dynamic = False, Default = \"&c000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ControlBorderColor, Type = Color, Dynamic = False, Default = \"&cC02346", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ControlTextColor, Type = Color, Dynamic = False, Default = \"&cFFFFFF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ListRowColor, Type = Color, Dynamic = False, Default = \"&cFFFFFF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ListSelectionColor, Type = Color, Dynamic = False, Default = \"&c6080FF", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WindowBackColor, Type = Color, Dynamic = False, Default = \"&c000030", Scope = Protected
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
End Module
#tag EndModule
