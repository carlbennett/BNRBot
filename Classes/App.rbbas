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
		  
		  #If TargetLinux = True Then
		    Try
		      If App.ExecutableFile.Parent.Child("BNRBot Libs").Child("RBGUIFramework.so").Exists And _
		        Not App.ExecutableFile.Parent.Child("RBGUIFramework.so").Exists Then
		        App.ExecutableFile.Parent.Child("BNRBot Libs").Child("RBGUIFramework.so").MoveFileTo(App.ExecutableFile.Parent)
		      End If
		    Catch err As NilObjectException
		      // Silently ignore our sanity check, let whatever happens fail to the user
		    End Try
		  #EndIf
		  
		  #If TargetWin32 = True Then
		    Me.AppTI = New AppTrayItem()
		  #EndIf
		  
		  Globals.CreateLagIcons()
		  Globals.CreateUserIcons()
		  Globals.ClanCookies = New Dictionary()
		  Globals.Cookies = New Dictionary()
		  Globals.ProfileCookies = New Dictionary()
		  
		  Settings.CheckFiles()
		  Settings.Load(Nil)
		  
		  If Settings.PrefCheckForUpdates = True Or DebugBuild = True Then
		    Dim w As New UpdateWindow()
		    w.StepTransition(UpdateWindow.STEP_CHECK_AUTO)
		    w.ShowModal()
		  End If
		  
		  MainWindow.Show()
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  
		  REALbasic.Beep()
		  
		  Dim w As New ExceptionWindow()
		  w.oException = error
		  w.Process()
		  w.ShowModal()
		  
		  Return True
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetProjectName() As String
		  
		  Return "BNRBot"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionString(httpUserAgent As Boolean = False) As String
		  
		  Dim s As String = Me.GetProjectName()
		  
		  If httpUserAgent = False Then
		    s = s + " v"
		  Else
		    s = s + "/"
		  End If
		  
		  s = s + Format(Me.MajorVersion, "-#") + "."
		  s = s + Format(Me.MinorVersion, "-#") + "."
		  s = s + Format(Me.BugVersion, "-#") + "."
		  
		  #If DebugBuild = True Then
		    s = s + Format(Me.NonReleaseVersion + 1, "-#") + " (Debug)"
		  #Else
		    s = s + Format(Me.NonReleaseVersion, "-#") + " (Release)"
		  #EndIf
		  
		  Return s
		  
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
