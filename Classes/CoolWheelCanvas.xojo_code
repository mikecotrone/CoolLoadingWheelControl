#tag Class
Protected Class CoolWheelCanvas
Inherits Canvas
	#tag Event
		Sub Open()
		  #IF TargetWin32 Then
		    Me.DoubleBuffer = True
		  #ENDIF
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // ---------- CODE BLOCK THANKS TO WILL SHANK
		  static p As Picture
		  if p = nil or p.Width <> Width or p.Height <> Height then
		    p = new Picture(Width, Height, 32) //Mask
		  end
		  
		  dim gg As Graphics = p.Mask.Graphics
		  gg.ForeColor = &cFFFFFF                //blank mask
		  gg.FillRect(0, 0, Width, Height)
		  
		  gg.ForeColor = &c000000         //draw ring outer
		  gg.FillOval(0, 0, Width, Height)
		  gg.ForeColor = &cFFFFFF         //draw ring inner
		  gg.FillOval(g.width / 4, g.height / 4, Width-g.width / 2, Height-g.height / 2)
		  
		  gg = p.Graphics
		  gg.ForeColor = &cAAAAAA         //fill ring color
		  gg.FillRect(0, 0, Width, Height)
		  
		  dim xy(0), cx, cy, r As integer //build wedge poly
		  cx = Width * 0.5
		  cy = Height * 0.5
		  r = Width
		  xy.Append cx
		  xy.Append cy
		  for i As integer = 0 to percentage
		    xy.Append cx + r * cos(i)
		    xy.Append cx - r * sin(i)
		  next
		  xy.Append cx + r * cos(percentage)
		  xy.Append cx - r * sin(percentage)
		  
		  gg.ForeColor = kBlue //ChangeRingColor()
		  
		  gg.FillPolygon(xy)
		  
		  g.DrawPicture p, 0, 0
		  // ---------- THANKS WILL
		  
		  //  DRAW LOADING STRING
		  Dim CenterString as String = "Loading..."
		  g.TextFont = "System"
		  g.ForeColor = kBlue
		  g.TextSize = me.Width / 10
		  Dim xPos as Integer =  ((self.Width/2)-(g.stringwidth("Loading...")/2))+2
		  Dim yPos as Integer = ((self.Height/2)-(g.textsize/2)) + g.textsize
		  g.DrawString(CenterString, xPos, yPos)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ChangeRingColor() As Color
		  Dim thisColor as Color
		  
		  if Direction = 0 Then
		    thisColor = RingColorArray(0)
		  Elseif Direction = 1 Then
		    thisColor = RingColorArray(1)
		  end if
		  
		  Return thisColor
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  
		  // BEGIN COUNTER CLOCKWISE DIRECTION
		  Direction = 0
		  
		  // LOAD RING FILL COLOR
		  RingColorArray.Append kBlue
		  RingColorArray.Append kLightBlue
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Direction As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Lap As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		percentage As double
	#tag EndProperty

	#tag Property, Flags = &h0
		RingColorArray() As Color
	#tag EndProperty


	#tag Constant, Name = kBlue, Type = Color, Dynamic = False, Default = \"&c0280E4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLightBlue, Type = Color, Dynamic = False, Default = \"&c92D1FF", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Direction"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Lap"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="percentage"
			Group="Behavior"
			Type="double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
