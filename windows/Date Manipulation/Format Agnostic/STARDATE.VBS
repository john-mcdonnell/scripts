' Check for command line arguments (none required)
If WScript.Arguments.Count Then Syntax

' Current year
strYear = DatePart( "yyyy", Date )

' Calculate fraction of current year
ydays = DatePart("y",Date)

' Check for leap year
leapyear = 0
If strYear Mod   4 = 0 Then leapyear = 1
If strYear Mod 100 = 0 Then leapyear = 0
If strYear Mod 400 = 0 Then leapyear = 1

' Calculate fraction of current day
dmins = 60 * DatePart( "h", Time ) + DatePart( "n", Time )

' Calculate actual starsate
stardate = "" & ( strYear - 2323 ) _
         & Int( 1000 * ydays / ( 365 + leapyear ) ) _
         & "." & Int( dmins / 144 )

' Display the result
WScript.Echo vbCrLf & "Stardate today is " & stardate


Sub Syntax( )
	strMsg = vbCrLf _
	       & "StarDate.vbs,  Version 1.00" & vbCrLf _
	       & "Convert current date and time to stardate" _
	       & vbCrLf  & vbCrLf _
	       & "Usage:  CSCRIPT.EXE  STARDATE.VBS" _
	       & vbCrLf  & vbCrLf _
	       & "Based on an algorithm found on The StarTrek Gallery" _
	       & vbCrLf _
	       & "http://www.trainerscity.com/startrek/" _
	       & vbCrLf  & vbCrLf _
	       & "Written by Rob van der Woude" & vbCrLf _
	       & "http://www.robvanderwoude.com" & vbCrLf
	WScript.Echo strMsg
End Sub
