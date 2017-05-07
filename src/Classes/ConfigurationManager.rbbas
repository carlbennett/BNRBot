#tag Class
Protected Class ConfigurationManager
	#tag Method, Flags = &h0
		Sub AddFile(file As FolderItem)
		  
		  Me.files.Append(file)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFile(path As String)
		  
		  Me.AddFile(GetFolderItem(path))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  Try
		    
		    Me.AddFile(SpecialFolder.ApplicationData.Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.ApplicationData.Child(App.ProjectName()).Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.SharedApplicationData.Child(App.ProjectName() + ".dat"))
		    Me.AddFile(SpecialFolder.SharedApplicationData.Child(App.ProjectName()).Child(App.ProjectName() + ".dat"))
		    
		    #If Not TargetWin32 Then
		      Me.AddFile("/etc/" + App.ProjectName() + ".dat")
		      Me.AddFile("/etc/" + App.ProjectName() + "/" + App.ProjectName() + ".dat")
		    #EndIf
		    
		    Me.AddFile(App.ExecutableFile.Parent.Child(App.ProjectName() + ".dat"))
		    
		    #If DebugBuild Then
		      Me.AddFile(App.ExecutableFile.Parent.Parent.Child(App.ProjectName() + ".dat"))
		      Me.AddFile(App.ExecutableFile.Parent.Parent.Parent.Child(App.ProjectName() + ".dat"))
		    #EndIf
		    
		  Catch error As NilObjectException
		    
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAllConfigs()
		  
		  Logger.WriteLine(True, "Reading user configuration...")
		  
		  For Each file As FolderItem In Me.files
		    Me.ProcessConfigFile(file)
		  Next
		  
		  Logger.WriteLine(True, "User configuration has been read")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessConfigFile(file As FolderItem)
		  
		  If file = Nil Then Return
		  
		  If file.Exists = False Then
		    Logger.WriteLine(True, "File does not exist [" + file.AbsolutePath + "]")
		    Return
		  End If
		  
		  If file.IsReadable = False Then
		    Logger.WriteLine(True, "File not readable [" + file.AbsolutePath + "]")
		    Return
		  End If
		  
		  Logger.WriteLine(True, "Opening file [" + file.AbsolutePath + "]...")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFile(file As FolderItem)
		  
		  Dim i As Integer = UBound(Me.files)
		  While i >= 0
		    If Me.files(i) = file Then
		      Me.files.Remove(i)
		      Exit While
		    End If
		    i = i - 1
		  Wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveFile(path As String)
		  
		  Me.RemoveFile(GetFolderItem(path))
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private configs() As Configuration
	#tag EndProperty

	#tag Property, Flags = &h21
		Private files() As FolderItem
	#tag EndProperty


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
