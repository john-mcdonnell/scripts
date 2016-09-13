' SortTime.vbs,  Version 1.00 for Windows Script Host 2.00
' Display current time in HHmm format
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

If DatePart("h",Time) < 10 Then
	strSortTime = "0" & DatePart("h",Time)
Else
	strSortTime = DatePart("h",Time)
End If
If DatePart("n",Time) < 10 Then
	strSortTime = strSortTime & "0"
End If
strSortTime = strSortTime & DatePart("n",Time)

Wscript.Echo("SortTime=" & strSortTime)
