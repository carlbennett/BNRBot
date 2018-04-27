#tag Class
Protected Class Logger
	#tag Method, Flags = &h0
		 Shared Sub Close()
		  
		  Logger.stream.Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Flush()
		  
		  Logger.stream.Flush()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Initialize()
		  
		  Dim today As New Date()
		  Dim filename As String
		  
		  filename = Format(today.Year, "#0000") + "-" + _
		  Format(today.Month, "#00") + "-" + _
		  Format(today.Day, "#00") + "_" + _
		  Format(today.Hour, "#00") + _
		  Format(today.Minute, "#00") + _
		  ".log"
		  
		  Logger.file = Nil
		  
		  #If Not DebugBuild Then
		    #If TargetWin32 Then
		      Logger.file = SpecialFolder.ApplicationData.Child(App.ProjectName()).Child(filename)
		    #ElseIf TargetLinux Then
		      Logger.file = SpecialFolder.VarLog.Child(App.ProjectName()).Child(filename)
		    #EndIf
		  #Else
		    Try
		      App.ExecutableFile.Parent.Parent.Parent.Child("log").CreateAsFolder()
		    Catch err As IOException
		    Catch err As NilObjectException
		    End Try
		    Logger.file = App.ExecutableFile.Parent.Parent.Parent.Child("log").Child(filename)
		  #EndIf
		  
		  If Logger.file = Nil Or Logger.file.IsWriteable = False Then
		    Logger.file = App.ExecutableFile.Parent.Child(filename)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Open()
		  
		  Logger.stream = TextOutputStream.Append(Logger.file)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function Timestamp() As String
		  
		  Dim today As New Date()
		  
		  Return Format(today.Year, "#0000") + "-" + _
		  Format(today.Month, "#00") + "-" + _
		  Format(today.Day, "#00") + " " + _
		  Format(today.Hour, "#00") + ":" + _
		  Format(today.Minute, "#00") + ":" + _
		  Format(today.Second, "#00")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub Write(timestamp As Boolean, text As String)
		  
		  If Timestamp Then Logger.WriteTimestamp()
		  
		  Logger.stream.Write(text)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteLine(timestamp As Boolean, text As String)
		  
		  If Timestamp Then Logger.WriteTimestamp()
		  
		  Logger.stream.WriteLine(text)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteTimestamp()
		  
		  Logger.stream.Write("[" + Logger.Timestamp() + "] ")
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Logger.stream.Delimiter
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  Logger.stream.Delimiter = value
			  
			End Set
		#tag EndSetter
		Shared Delimiter As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared file As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Logger.stream.LastErrorCode
			  
			End Get
		#tag EndGetter
		Shared LastErrorCode As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared stream As TextOutputStream
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Logger.stream.WriteError
			  
			End Get
		#tag EndGetter
		Shared WriteError As Boolean
	#tag EndComputedProperty


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
