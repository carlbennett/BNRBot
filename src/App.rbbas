#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Me.AutoQuit = True
		  Me.uptimeConstant = Microseconds()
		  
		  Me.colors                        = New ColorSwatch()
		  Me.colors.ChatBackColor          = &cFFFFFF
		  Me.colors.ChatEventUserJoin      = &c00C000
		  Me.colors.ChatEventUserLeave     = &cC00000
		  Me.colors.DefaultBackColor       = REALbasic.FillColor()
		  Me.colors.DefaultFrameColor      = REALbasic.FrameColor()
		  Me.colors.DefaultHighlightColor  = REALbasic.HighlightColor()
		  Me.colors.DefaultTextColor       = REALbasic.TextColor()
		  Me.colors.InternalDebug          = &c808000
		  Me.colors.InternalError          = &cC00000
		  Me.colors.InternalInfo           = &cC0C000
		  Me.colors.InternalSuccess        = &c00C000
		  Me.colors.InternalNetworkDebug   = &c808080
		  Me.colors.InternalNetworkError   = &cC00000
		  Me.colors.InternalNetworkInfo    = &cC0C000
		  Me.colors.InternalNetworkSuccess = &c00C000
		  
		  Dim w As New ChatWindow()
		  w.Show()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ColorToUInt32(value As Color) As UInt32
		  
		  Dim m As New MemoryBlock(4)
		  
		  m.Byte(3) = value.Red
		  m.Byte(2) = value.Green
		  m.Byte(1) = value.Blue
		  m.Byte(0) = value.Alpha
		  
		  Return m.UInt32Value(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlatformName() As String
		  
		  #If TargetWin32 Then
		    Return "Windows"
		  #ElseIf TargetLinux Then
		    Return "Linux"
		  #ElseIf TargetMacOS Then
		    Return "Mac OS X"
		  #Else
		    Return "Unknown"
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlatformVersion() As String
		  
		  #If TargetWin32 Then
		    
		    Soft Declare Function GetVersion Lib "Kernel32" () As UInt32
		    
		    Dim mb As New MemoryBlock(4)
		    mb.UInt32Value(0) = GetVersion()
		    
		    Dim dwMajorVersion As Integer = mb.Int8Value(0)
		    Dim dwMinorVersion As Integer = mb.Int8Value(1)
		    Dim dwBuild        As Integer = mb.Int16Value(2)
		    
		    Dim dblVersion As Double = Val(Format(dwMajorVersion, "#") + "." + Format(dwMinorVersion, "#"))
		    Dim strVersion As String = Format(dblVersion, "0.0####") + " Build " + Format(dwBuild, "000#")
		    
		    Select Case dblVersion
		    Case 5.0
		      Return "2000 (" + strVersion + ")"
		    Case 5.1
		      Return "XP (" + strVersion + ")"
		    Case 5.2
		      Return "Server 2003 (" + strVersion + ")"
		    Case 6.0
		      Return "Vista (" + strVersion + ")"
		    Case 6.1
		      Return "7 (" + strVersion + ")"
		    Case 6.2
		      Return "8 (" + strVersion + ")"
		    Case 6.3
		      Return "8.1 (" + strVersion + ")"
		    Case 10.0
		      Return "10 (" + strVersion + ")"
		    Case Else
		      Return strVersion
		    End Select
		    
		  #ElseIf TargetLinux Then
		    
		    Dim kernelString As String = ""
		    Dim sh As New Shell()
		    
		    // All but the node name (hostname)
		    sh.Execute("uname -r -v -m -p -i -o")
		    
		    If sh.ErrorCode = 0 Then
		      kernelString = ReplaceLineEndings(sh.Result, " ")
		    Else
		      kernelString = App.PlatformName()
		    End If
		    
		    sh.Close()
		    
		    Return kernelString
		    
		  #ElseIf TargetMacOS Then
		    
		    // TODO
		    Return ""
		    
		  #Else
		    
		    Return ""
		    
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrefixLines(value As String, prefix As String) As String
		  
		  Dim lines() As String
		  Dim i, j As Integer
		  
		  lines = Split(ReplaceLineEndings(value, EndOfLine), EndOfLine)
		  i     = 0
		  j     = UBound(lines)
		  
		  If j = -1 Then Return prefix + value
		  
		  While i <= j
		    lines(i) = prefix + lines(i)
		    i = i + 1
		  Wend
		  
		  Return Join(lines, EndOfLine)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProjectName() As String
		  
		  Return "BNRBot"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomString(length As Integer, mask As String) As String
		  
		  Dim buf As String
		  Dim maskLen As Integer
		  
		  maskLen = Len(mask)
		  
		  While Len(buf) < length
		    buf = buf + Mid(mask, 1 + Floor(Rnd() * maskLen), 1)
		  Wend
		  
		  Return buf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SystemUptime() As Double
		  
		  // Returns system uptime in seconds, double-precision in case we have
		  // a higher prevision available
		  
		  #If TargetWin32 = True Then
		    
		    Return Microseconds() / 1000000
		    
		  #ElseIf TargetLinux = True Then
		    
		    Soft Declare Function sysinfo Lib "libc" (sysinfo As Ptr) As Integer
		    
		    Dim mb As New MemoryBlock(64)
		    If sysinfo(mb) <> 0 Then
		      Return 0
		    End If
		    
		    Return mb.Long(0) // See sysinfo struct on Linux (glibc sys/sysinfo.h)
		    
		  #Else
		    
		    Return Ticks() / 60 // Hope for the best
		    
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TimeString(Period As UInt64, Fullstring As Boolean = False, ShortLegend As Boolean = False) As String
		  
		  Dim Buffer As String = ""
		  Dim Years, Days, Hours, Minutes, Seconds As UInt64
		  Dim LYear, LDay, LHour, LMinute, LSecond As String
		  
		  If ShortLegend = False Then
		    LYear = "year"
		    LDay = "day"
		    LHour = "hour"
		    LMinute = "minute"
		    LSecond = "second"
		  Else
		    LYear = "y"
		    LDay = "d"
		    LHour = "h"
		    LMinute = "m"
		    LSecond = "s"
		  End If
		  
		  // BEGIN CONVERSIONS
		  
		  // Period is in seconds:
		  Seconds = Period
		  
		  // 60 seconds in 1 minute:
		  Minutes = Seconds \ 60
		  Seconds = Seconds Mod 60
		  
		  // 60 minutes in 1 hour:
		  Hours = Minutes \ 60
		  Minutes = Minutes Mod 60
		  
		  // 24 hours in 1 day:
		  Days = Hours \ 24
		  Hours = Hours Mod 24
		  
		  // 365 days in 1 year:
		  Years = Days \ 365
		  Days = Days Mod 365
		  
		  // END CONVERSIONS
		  
		  If Fullstring = True Then
		    // Return something like "5 days, 0 hours, 1 minute, 13 seconds"
		    If ShortLegend = False Then
		      Buffer = Buffer + Str(Years) + " " + LYear
		      If Years <> 1 Then Buffer = Buffer + "s"
		      Buffer = Buffer + Str(Days) + " " + LDay
		      If Days <> 1 Then Buffer = Buffer + "s"
		      Buffer = Buffer + ", " + Str(Hours) + " " + LHour
		      If Hours <> 1 Then Buffer = Buffer + "s"
		      Buffer = Buffer + ", " + Str(Minutes) + " " + LMinute
		      If Minutes <> 1 Then Buffer = Buffer + "s"
		      Buffer = Buffer + ", " + Str(Seconds) + " " + LSecond
		      If Seconds <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Years) + LYear + " " + Str(Days) + LDay + " " _
		      + Str(Hours) + LHour + " " + Str(Minutes) + LMinute + " " _
		      + Str(Seconds) + LSecond
		    End If
		    Return Buffer
		  End If
		  
		  // Return something like "5 days, 1 minute, 13 seconds"
		  
		  If Years <> 0 Then
		    If ShortLegend = False Then
		      Buffer = Buffer + ", " + Str(Years) + " " + LYear
		      If Years <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Years) + LYear + " "
		    End If
		  End If
		  
		  If Days <> 0 Then
		    If ShortLegend = False Then
		      Buffer = Buffer + ", " + Str(Days) + " " + LDay
		      If Days <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Days) + LDay + " "
		    End If
		  End If
		  
		  If Hours <> 0 Then
		    If ShortLegend = False Then
		      Buffer = Buffer + ", " + Str(Hours) + " " + LHour
		      If Hours <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Hours) + LHour + " "
		    End If
		  End If
		  
		  If Minutes <> 0 Then
		    If ShortLegend = False Then
		      Buffer = Buffer + ", " + Str(Minutes) + " " + LMinute
		      If Minutes <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Minutes) + LMinute + " "
		    End If
		  End If
		  
		  If Seconds <> 0 Then
		    If ShortLegend = False Then
		      Buffer = Buffer + ", " + Str(Seconds) + " " + LSecond
		      If Seconds <> 1 Then Buffer = Buffer + "s"
		    Else
		      Buffer = Buffer + Str(Seconds) + LSecond + " "
		    End If
		  End If
		  
		  If Seconds = 0 And Minutes = 0 And Hours = 0 And Days = 0 And Years = 0 Then
		    If ShortLegend = False Then
		      Buffer = ", 0 seconds"
		    Else
		      Buffer = "0s"
		    End If
		  End If
		  
		  If Left(Buffer, 2) = ", " Then
		    Return Mid(Buffer, 3)
		  ElseIf Right(Buffer, 1) = " " Then
		    Return Mid(Buffer, 1, Len(Buffer) - 1)
		  Else
		    Return Buffer
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UInt32ToColor(value As UInt32) As Color
		  
		  Dim m As New MemoryBlock(4)
		  
		  m.UInt32Value(0) = value
		  
		  Return RGB(m.Byte(3), m.Byte(2), m.Byte(1), m.Byte(0))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VersionString() As String
		  
		  Dim verstr As String
		  
		  #If DebugBuild Then
		    verstr = Format(Me.NonReleaseVersion, "-#")
		  #Else
		    verstr = Format(Me.NonReleaseVersion + 1, "-#")
		  #EndIf
		  
		  verstr = Format(Me.MajorVersion, "-#") + "." + _
		  Format(Me.MinorVersion, "-#") + "." + _
		  Format(Me.BugVersion, "-#") + "." + _
		  verstr
		  
		  Return verstr
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		clients() As BNETClient
	#tag EndProperty

	#tag Property, Flags = &h0
		colors As ColorSwatch
	#tag EndProperty

	#tag Property, Flags = &h0
		configFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		trigger As String
	#tag EndProperty

	#tag Property, Flags = &h0
		uptimeConstant As Double
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
