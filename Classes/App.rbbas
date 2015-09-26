#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  
		  Dim i As Integer = UBound(Globals.ProfileDialogs)
		  While i >= 0
		    
		    If Globals.ProfileDialogs(i) <> Nil Then
		      Globals.ProfileDialogs(i).IsRemoving = True
		      Globals.ProfileDialogs(i).Close()
		    End If
		    
		    Globals.ProfileDialogs.Remove(i)
		    
		    i = i - 1
		  Wend
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Globals.TimeStarted = Microseconds()
		  Me.AppTI = New AppTrayItem()
		  Globals.CreateLagIcons()
		  Globals.CreateUserIcons()
		  Globals.ClanCookies = New Dictionary()
		  Globals.ProfileCookies = New Dictionary()
		  Settings.CheckFiles()
		  Settings.Load(Nil)
		  
		  If Settings.PrefCheckForUpdates = True Or DebugBuild = True Then
		    Dim w As New wUpdater()
		    w.StepTransition(wUpdater.STEP_CHECK_AUTO)
		    w.ShowModal()
		  End If
		  
		  wMain.Show()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function VersionString() As String
		  
		  Dim sTmp As String = "BNRBot v"
		  
		  sTmp = sTmp + Str(Me.MajorVersion) + "."
		  sTmp = sTmp + Str(Me.MinorVersion) + "."
		  sTmp = sTmp + Str(Me.BugVersion) + "."
		  
		  #If DebugBuild = True Then
		    sTmp = sTmp + Str(Me.NonReleaseVersion + 1) + " (Debug)"
		  #Else
		    sTmp = sTmp + Str(Me.NonReleaseVersion) + " (Release)"
		  #EndIf
		  
		  Return sTmp
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AppTI As AppTrayItem
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
