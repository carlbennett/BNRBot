#tag Class
Protected Class ColorSwatch
	#tag Property, Flags = &h0
		ChatBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventBroadcastMessage As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventBroadcastName As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventChannelJoin As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventError As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventInfo As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserEmoteMessage As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserEmoteName As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserJoin As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserLeave As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserTalkMessage As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserTalkName As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserWhisperMessage As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserWhisperName As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultFrameColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultHighlightColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalDebug As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalError As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalInfo As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkDebug As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkError As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkInfo As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkSuccess As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalSuccess As Color = &c000000
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DefaultTextColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalDebug"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalError"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalInfo"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalNetworkDebug"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalNetworkError"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalNetworkInfo"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalNetworkSuccess"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalSuccess"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
