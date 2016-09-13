' Yesterday.vbs,  Version 1.01 for Windows Script Host 2.00
' Display today's and yesterday's date in two formats
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

' Specify header
strHead    = "Format:     YYYYMMDD  (DD/MM/YYYY)" & Chr(13) & Chr(10) & _
             "==================================" & Chr(13) & Chr(10)


' Get current year
strYear = DatePart("yyyy",Date)

' Get current month, add leading zero if necessary
If DatePart("m",Date) < 10 Then
	strMonth = 0 & DatePart("m",Date)
Else
	strMonth = DatePart("m",Date)
End If

' Get current day, add leading zero if necessary
If DatePart("d",Date) < 10 Then
	strDay = 0 & DatePart("d",Date)
Else
	strDay = DatePart("d",Date)
End If

' Format output for today
strToday = "Today:      " & strYear & strMonth & strDay & "  (" & _
           strDay & "/" & strMonth & "/" & strYear & ")" & Chr(13) & Chr(10)

' Calculate yesterday's date
dtmYesterday = DateAdd("d",-1,Date)

' Get yesterday's year
strYear      = DatePart("yyyy",dtmYesterday)

' Get yesterday's month, add leading zero if necessary
If DatePart("m",dtmYesterday) < 10 Then
	strMonth = 0 & DatePart("m",dtmYesterday)
Else
	strMonth = DatePart("m",dtmYesterday)
End If

' Get yesterday's day, add leading zero if necessary
If DatePart("d",dtmYesterday) < 10 Then
	strDay = 0 & DatePart("d",dtmYesterday)
Else
	strDay = DatePart("d",dtmYesterday)
End If

' Format output for yesterday
strYest = "Yesterday:  " & strYear & strMonth & strDay & "  (" & _
          strDay & "/" & strMonth & "/" & strYear & ")"

' Display the result
Wscript.Echo( strHead & strToday & strYest )
