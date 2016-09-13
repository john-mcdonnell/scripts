' SortDate.vbs,  Version 1.00 for Windows Script Host 2.00
' Display today's date in YYYYMMDD format
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

strSortDate = DatePart("yyyy",Date)
If DatePart("m",Date) < 10 Then
	strSortDate = strSortDate & "0"
End If
strSortDate = strSortDate & DatePart("m",Date)
If DatePart("d",Date) < 10 Then
	strSortDate = strSortDate & "0"
End If
strSortDate = strSortDate & DatePart("d",Date)

Wscript.Echo("SortDate=" & strSortDate)
