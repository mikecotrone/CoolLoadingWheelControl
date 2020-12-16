#tag Class
Protected Class CoolWheelCanvasClass
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
		  g.AntiAliasMode = Global.Graphics.AntiAliasModes.HighQuality
		  g.AntiAlias = True
		  g.PenSize = 1
		  
		  '// DRAW OUTTER RING
		  'Var outterRingXpos as Double = 0
		  'Var outterRingYpos as Double = 0
		  'Var outterRingW as Double = g.Width
		  'Var outterRingH as Double = g.Height
		  'Var outterRingColor as Color = kBlue
		  'g.ForeColor = outterRingColor  
		  'g.DrawOval(outterRingXpos, outterRingYpos, outterRingW, outterRingH)
		  
		  
		  // DRAW POLY WEDGE FILL
		  'incrementValue
		  'Var padding as Double = 1
		  'Var fillXpos as Double = outterRingXpos + padding
		  'Var fillYpos as Double = outterRingYpos + padding
		  'Var fillW as Double = outterRingW - (padding * 2)
		  'Var fillH as Double = outterRingH - (padding * 2)
		  Var fillColor as Color = &c62B7FB
		  
		  Const kPi = 3.1415926535
		  
		  Var path As GraphicsPath
		  Var x, y, radius, startAngle, endAngle As Double
		  Var anticlockwise As Boolean
		  
		  radius = 20 // Arc radius
		  startAngle = 0 // Starting point on circle
		  
		  g.DrawingColor = fillColor
		  
		  For j As Integer = 0 To 2
		    
		    path = New GraphicsPath
		    
		    x = 5 + j * 50 // x coordinate
		    y = 5 + j * 50 // y coordinate
		    endAngle = kPi + (kPi * j) / 2 // End point on circle
		    
		    path.AddArc(x, y, radius, startAngle, endAngle, anticlockwise)
		    g.FillPath(path)
		    
		  Next
		  
		  
		  
		  
		  
		  
		  '// DRAW INNER RING
		  'Var paddingFromOutterRingDbl as Double = RingWidth
		  'Var innerRingXpos as Double = outterRingXpos + paddingFromOutterRingDbl
		  'Var innerRingYpos as Double = outterRingYpos + paddingFromOutterRingDbl
		  'Var innerRingW as Double = outterRingW - (paddingFromOutterRingDbl*2)
		  'Var innerRingH as Double = outterRingH - (paddingFromOutterRingDbl*2)
		  'Var innerRingColor as Color = kBlue
		  'g.DrawingColor = innerRingColor
		  'g.DrawOval(innerRingXpos, innerRingYpos, innerRingW, innerRingH)
		  '
		  '
		  '// DRAW CENTER SOLID RING MASK
		  'Var paddingFromInnerRingDbl as Double = 1
		  'Var maskRingXpos as Double = innerRingXpos + paddingFromInnerRingDbl
		  'Var maskRingYpos as Double = innerRingYpos + paddingFromInnerRingDbl
		  'Var maskRingW as Double = innerRingW - (paddingFromInnerRingDbl*2)
		  'Var maskRingH as Double = innerRingH - (paddingFromInnerRingDbl*2)
		  'Var maskRingColor as Color = &cFFFFFF
		  'g.DrawingColor = maskRingColor
		  'g.FillOval(maskRingXpos, maskRingYpos, maskRingW, maskRingH)
		  '
		  '
		  '//  DRAW STRING
		  'Var CenterStr as String = Me.Caption
		  'g.TextFont = "System"
		  'g.ForeColor = kBlue
		  'g.TextSize = Me.textSize
		  'Var centerStrW as Double = g.TextWidth(CenterStr)
		  'Var centerStrH as Double = g.TextHeight(CenterStr, 100) 
		  'Var centerstrXpos as Integer = innerRingXpos + (innerRingW/2 - centerStrW/2)
		  'Var centerstrYpos as Integer = innerRingYpos + (innerRingH/2 + centerStrH/4)
		  'g.DrawString(CenterStr, centerstrXpos, centerstrYpos)
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
		Caption As STring
	#tag EndProperty

	#tag Property, Flags = &h0
		Direction As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared IncrementValue As Integer
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

	#tag Property, Flags = &h0
		RingWidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SpeedMS As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Single
	#tag EndProperty


	#tag Constant, Name = kBlue, Type = Color, Dynamic = False, Default = \"&c0280E4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLightBlue, Type = Color, Dynamic = False, Default = \"&c92D1FF", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Lap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="percentage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Wheel Control Behavior"
			InitialValue=""
			Type="STring"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RingWidth"
			Visible=true
			Group="Wheel Control Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Wheel Control Behavior"
			InitialValue=""
			Type="Single"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Direction"
			Visible=true
			Group="Wheel Control Behavior"
			InitialValue=""
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Clockwise"
				"1 - Counter Clockwise"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SpeedMS"
			Visible=true
			Group="Wheel Control Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
