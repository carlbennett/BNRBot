#tag Class
Protected Class ColorSwatch
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.ChatBackColor               = &cFFFFFF
		  Me.ChatEventBroadcastMessage   = &cC00000
		  Me.ChatEventBroadcastName      = &cF00000
		  Me.ChatEventChannelJoin        = &c00C0C0
		  Me.ChatEventError              = &cF02020
		  Me.ChatEventInfo               = &cF0F020
		  Me.ChatEventUserEmoteMessage   = &cC0C000
		  Me.ChatEventUserEmoteName      = &cF0F020
		  Me.ChatEventUserJoin           = &c00C000
		  Me.ChatEventUserLeave          = &cC00000
		  Me.ChatEventUserTalkMessage    = &cC0C0C0
		  Me.ChatEventUserTalkName       = &cF0F020
		  Me.ChatEventUserWhisperMessage = &cA0A0A0
		  Me.ChatEventUserWhisperName    = &cC0C0C0
		  Me.DefaultBackColor            = REALbasic.FillColor()
		  Me.DefaultFrameColor           = REALbasic.FrameColor()
		  Me.DefaultHighlightColor       = REALbasic.HighlightColor()
		  Me.DefaultTextColor            = REALbasic.TextColor()
		  Me.InternalDebug               = &c808000
		  Me.InternalError               = &cC00000
		  Me.InternalInfo                = &cC0C000
		  Me.InternalNetworkDebug        = &c808080
		  Me.InternalNetworkError        = &cC00000
		  Me.InternalNetworkInfo         = &cC0C000
		  Me.InternalNetworkSuccess      = &c00C000
		  Me.InternalSuccess             = &c00C000
		  
		End Sub
	#tag EndMethod


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
			Name="ChatBackColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventBroadcastMessage"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventBroadcastName"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventChannelJoin"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventError"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventInfo"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserEmoteMessage"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserEmoteName"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserJoin"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserLeave"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserTalkMessage"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserTalkName"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserWhisperMessage"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChatEventUserWhisperName"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultBackColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultFrameColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultHighlightColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
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
