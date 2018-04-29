#tag Window
Begin Window AboutWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   380
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   350
   MinimizeButton  =   True
   MinWidth        =   390
   Placement       =   0
   Resizeable      =   False
   Title           =   "About"
   Visible         =   True
   Width           =   390
   Begin Canvas Icon
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   16
      UseFocusRing    =   True
      Visible         =   True
      Width           =   64
   End
   Begin Label ProjectNameLabel
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   92
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "<Project>"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   15
      TextUnit        =   0
      Top             =   18
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   282
   End
   Begin Label VersionLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   92
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "<Version>"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   40
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   282
   End
   Begin Label AuthorLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   92
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   True
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "<Author>"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   58
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   282
   End
   Begin Separator Separators
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   4
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   8
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   322
      Visible         =   True
      Width           =   374
   End
   Begin Label LegalLabel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   214
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   16
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   True
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "<Project>, a Classic Battle.net(TM) chat bot\r\nCopyright (C) <Year> <Author>\r\n\r\nThis program is free software: you can redistribute it and/or modify\r\nit under the terms of the GNU General Public License as published by\r\nthe Free Software Foundation, either version 3 of the License, or\r\n(at your option) any later version.\r\n\r\nThis program is distributed in the hope that it will be useful,\r\nbut WITHOUT ANY WARRANTY; without even the implied warranty of\r\nMERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\r\nGNU General Public License for more details.\r\n\r\nYou should have received a copy of the GNU General Public License\r\nalong with this program.  If not, see <http://www.gnu.org/licenses/>."
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "Arial"
      TextSize        =   11
      TextUnit        =   0
      Top             =   96
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   358
   End
   Begin PushButton CloseButtonCtl
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "&Close"
      Default         =   True
      Enabled         =   True
      Height          =   24
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   290
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Arial"
      TextSize        =   12
      TextUnit        =   0
      Top             =   340
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Self.ProjectNameLabel.Text = Me.FilterString( Self.ProjectNameLabel.Text )
		  Self.VersionLabel.Text = Me.FilterString( Self.VersionLabel.Text )
		  Self.AuthorLabel.Text = Me.FilterString( Self.AuthorLabel.Text )
		  Self.LegalLabel.Text = Me.FilterString( Self.LegalLabel.Text )
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function FilterString(value As String) As String
		  
		  Dim buf As String = value
		  Dim buildId As Integer = App.NonReleaseVersion
		  
		  buf = ReplaceAll( buf, "<Project>", App.ProjectName() )
		  buf = ReplaceAll( buf, "<Author>", "Carl Bennett" )
		  buf = ReplaceAll( buf, "<Year>", "2018" )
		  
		  #If DebugBuild Then
		    buildId = buildId + 1
		  #EndIf
		  
		  buf = ReplaceAll( buf, "<Version>", Format( App.MajorVersion, "-#" ) + "." _
		  + Format( App.MinorVersion, "-#" ) + "." _
		  + Format( App.BugVersion, "-#" ) + " Build " _
		  + Format( buildId, "-#" ) + " (<VersionStage>)" )
		  
		  #If DebugBuild Then
		    
		    buf = ReplaceAll( buf, "<VersionStage>", "Debug" )
		    
		  #Else
		    
		    Select Case App.StageCode
		      
		    Case Application.Development
		      buf = ReplaceAll( buf, "<VersionStage>", "Development" )
		      
		    Case Application.Alpha
		      buf = ReplaceAll( buf, "<VersionStage>", "Alpha" )
		      
		    Case Application.Beta
		      buf = ReplaceAll( buf, "<VersionStage>", "Beta" )
		      
		    Case Application.Final
		      buf = ReplaceAll( buf, "<VersionStage>", "Final" )
		      
		    Case Else
		      buf = ReplaceAll( buf, "<VersionStage>", "Unknown " + Format( App.StageCode, "-#" ))
		      
		    End Select
		    
		  #EndIf
		  
		  Return buf
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events Icon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  #pragma Unused areas
		  
		  g.ForeColor = &cFFFFFF
		  g.FillRect( 0, 0, g.Width, g.Height )
		  
		  g.ForeColor = App.config.colors.DefaultFrameColor
		  g.DrawRect( 0, 0, g.Width, g.Height )
		  
		  g.ForeColor = &cF00000
		  g.DrawLine( 4, 4, g.Width - 6, g.Height - 6 )
		  g.DrawLine( 4, g.Height - 6, g.Width - 6, 4 )
		  
		  g.DrawString( "TODO", g.Width / 2 - 17, g.TextAscent )
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseButtonCtl
	#tag Event
		Sub Action()
		  
		  Self.Close()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
