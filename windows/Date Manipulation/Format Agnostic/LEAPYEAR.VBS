' LeapYear.vbs,  Version 1.00 for Windows Script Host
' Check if the specified year is a leap year.
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

Select Case WScript.Arguments.Count
	Case 0
		' Default is current year
		MyYear = Year( Date )
	Case 1
		' Check datatype and range of argument
		On Error Resume Next
		MyYear = CLng( WScript.Arguments(0) )
		If Err.Number Then Syntax
		Err.Clear
		On Error Goto 0
		If MyYear < 0    Then Syntax
		If MyYear > 9999 Then Syntax
	Case Else
		Syntax
End Select

LeapYear = 0
If MyYear Mod   4 = 0 Then LeapYear = 1
If MyYear Mod 100 = 0 Then LeapYear = 0
If MyYear Mod 400 = 0 Then LeapYear = 1

strIs = " IS"
If LeapYear = 0 Then strIs = " is NOT"
WScript.Echo( MyYear & strIs & " a leap year" )

WScript.Quit( LeapYear )


Sub Syntax
msg = vbCrLf & "LeapYear.vbs,  Version 1.00 for WSH 1.0" & vbCrLf & _
      "Check if the specified year is a leap year." & vbCrLf & _
      vbCrLf & "Usage:   CScript  LEAPYEAR.VBS  [ year ]" & vbCrLf & vbCrLf & _
      "Where:   " & Chr(34) & "year" & Chr(34) & _
      " should be within the range of 0 through 9999." & vbCrLf & _
      "         Default is the current year, if none is specified." & _
      vbCrLf & vbCrLf & _
      "Returns: 0  if NOT a leap year" & vbCrLf & _
      "         1  on leap years" & vbCrLf & _
      "         2  on syntax errors" & vbCrLf & vbCrLf & _
      "Written by Rob van der Woude" & vbCrLf & _
      "http://www.robvanderwoude.com"
Wscript.Echo( msg )
WScript.Quit(2)
End Sub
