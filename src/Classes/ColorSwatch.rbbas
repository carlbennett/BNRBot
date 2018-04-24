#tag Class
Protected Class ColorSwatch
Implements Serializable
	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Me.ChatBackColor               = &c36393E
		  
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
		  
		  Me.DefaultBackColor            = &c2F3136
		  Me.DefaultFrameColor           = &c686878
		  Me.DefaultHighlightBackColor   = &c42464D
		  Me.DefaultHighlightTextColor   = &cADBAC2
		  Me.DefaultTextColor            = &cADBAC2
		  
		  Me.InternalDebug               = &cDD7928
		  Me.InternalError               = &cBB4F5F
		  Me.InternalInfo                = &cF1BF26
		  
		  Me.InternalNetworkDebug        = &cDD7928
		  Me.InternalNetworkError        = &cBB4F5F
		  Me.InternalNetworkInfo         = &cF1BF26
		  Me.InternalNetworkSuccess      = &c18DEBF
		  
		  Me.InternalSuccess             = &c18DEBF
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Serialize() As String
		  // Part of the Serializable interface.
		  
		  Dim mb As New MemoryBlock( &H006C )
		  
		  mb.LittleEndian = True
		  
		  mb.ColorValue( &H0000, 32 ) = Me.ChatBackColor
		  mb.ColorValue( &H0004, 32 ) = Me.ChatEventBroadcastMessage
		  mb.ColorValue( &H0008, 32 ) = Me.ChatEventBroadcastName
		  mb.ColorValue( &H000C, 32 ) = Me.ChatEventChannelJoin
		  
		  mb.ColorValue( &H0010, 32 ) = Me.ChatEventError
		  mb.ColorValue( &H0014, 32 ) = Me.ChatEventInfo
		  mb.ColorValue( &H0018, 32 ) = Me.ChatEventUserEmoteMessage
		  mb.ColorValue( &H001C, 32 ) = Me.ChatEventUserEmoteName
		  
		  mb.ColorValue( &H0020, 32 ) = Me.ChatEventUserJoin
		  mb.ColorValue( &H0024, 32 ) = Me.ChatEventUserLeave
		  mb.ColorValue( &H0028, 32 ) = Me.ChatEventUserTalkMessage
		  mb.ColorValue( &H002C, 32 ) = Me.ChatEventUserTalkName
		  
		  mb.ColorValue( &H0030, 32 ) = Me.ChatEventUserWhisperMessage
		  mb.ColorValue( &H0034, 32 ) = Me.ChatEventUserWhisperName
		  mb.ColorValue( &H0038, 32 ) = Me.DefaultBackColor
		  mb.ColorValue( &H003C, 32 ) = Me.DefaultFrameColor
		  
		  mb.ColorValue( &H0040, 32 ) = Me.DefaultHighlightBackColor
		  mb.ColorValue( &H0044, 32 ) = Me.DefaultTextColor
		  mb.ColorValue( &H0048, 32 ) = Me.InternalDebug
		  mb.ColorValue( &H004C, 32 ) = Me.InternalError
		  
		  mb.ColorValue( &H0050, 32 ) = Me.InternalInfo
		  mb.ColorValue( &H0054, 32 ) = Me.InternalNetworkDebug
		  mb.ColorValue( &H0058, 32 ) = Me.InternalNetworkError
		  mb.ColorValue( &H005C, 32 ) = Me.InternalNetworkInfo
		  
		  mb.ColorValue( &H0060, 32 ) = Me.InternalNetworkSuccess
		  mb.ColorValue( &H0064, 32 ) = Me.InternalSuccess
		  mb.ColorValue( &H0068, 32 ) = Me.DefaultHighlightTextColor
		  
		  Return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unserialize(value As String)
		  // Part of the Serializable interface.
		  
		  Dim mb As MemoryBlock = value
		  
		  mb.LittleEndian = True
		  
		  Try
		    Me.ChatBackColor               = mb.ColorValue( &H0000, 32 )
		    Me.ChatEventBroadcastMessage   = mb.ColorValue( &H0004, 32 )
		    Me.ChatEventBroadcastName      = mb.ColorValue( &H0008, 32 )
		    Me.ChatEventChannelJoin        = mb.ColorValue( &H000C, 32 )
		    
		    Me.ChatEventError              = mb.ColorValue( &H0010, 32 )
		    Me.ChatEventInfo               = mb.ColorValue( &H0014, 32 )
		    Me.ChatEventUserEmoteMessage   = mb.ColorValue( &H0018, 32 )
		    Me.ChatEventUserEmoteName      = mb.ColorValue( &H001C, 32 )
		    
		    Me.ChatEventUserJoin           = mb.ColorValue( &H0020, 32 )
		    Me.ChatEventUserLeave          = mb.ColorValue( &H0024, 32 )
		    Me.ChatEventUserTalkMessage    = mb.ColorValue( &H0028, 32 )
		    Me.ChatEventUserTalkName       = mb.ColorValue( &H002C, 32 )
		    
		    Me.ChatEventUserWhisperMessage = mb.ColorValue( &H0030, 32 )
		    Me.ChatEventUserWhisperName    = mb.ColorValue( &H0034, 32 )
		    Me.DefaultBackColor            = mb.ColorValue( &H0038, 32 )
		    Me.DefaultFrameColor           = mb.ColorValue( &H003C, 32 )
		    
		    Me.DefaultHighlightBackColor   = mb.ColorValue( &H0040, 32 )
		    Me.DefaultTextColor            = mb.ColorValue( &H0044, 32 )
		    Me.InternalDebug               = mb.ColorValue( &H0048, 32 )
		    Me.InternalError               = mb.ColorValue( &H004C, 32 )
		    
		    Me.InternalInfo                = mb.ColorValue( &H0050, 32 )
		    Me.InternalNetworkDebug        = mb.ColorValue( &H0054, 32 )
		    Me.InternalNetworkError        = mb.ColorValue( &H0058, 32 )
		    Me.InternalNetworkInfo         = mb.ColorValue( &H005C, 32 )
		    
		    Me.InternalNetworkSuccess      = mb.ColorValue( &H0060, 32 )
		    Me.InternalSuccess             = mb.ColorValue( &H0064, 32 )
		    Me.DefaultHighlightTextColor   = mb.ColorValue( &H0068, 32 )
		    
		  Catch err As OutOfBoundsException
		    
		    // insufficient bytes to load one or more colors
		    // assume we loaded defaults via Constructor() and exit here
		    Return
		    
		  End Try
		  
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
		ChatEventInfo As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserEmoteMessage As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserEmoteName As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserJoin As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserLeave As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		ChatEventUserTalkMessage As Color
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
		DefaultHighlightBackColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultHighlightTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		DefaultTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalDebug As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalError As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalInfo As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkDebug As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkError As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkInfo As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalNetworkSuccess As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalSuccess As Color
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
