' Tomorrow.vbs,  Version 1.00 for Windows Script Host 2.00
' Display today's, yesterday's and tomorrow's date in two formats
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

' Specify header
strHead    = "Format:     YYYYMMDD  (DD/MM/YYYY)" & vbCrLf _
           & "==================================" & vbCrLf


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
strToday = "Today:      " & strYear & strMonth & strDay _
         & "  (" & strDay & "/" & strMonth & "/" & strYear & ")" & vbCrLf

' Calculate yesterday's date
dtmYesterday = DateAdd("d",-1,Date)

' Get yesterday's year
strYear = DatePart("yyyy",dtmYesterday)

' Get yesterday's month, add leading zero if necessary
If DatePart("m",dtmYesterday) < 10 Then
	strMonth = 0 & DatePart("m",dtmYesterday)
Else
	strMonth = DatePart("m",dtmYesterday)
End If

' Get yesterday's day, add leading zero if necessary
If DatePart("d",dtmYesterday) < 10 Then
	strDay = DatePart("d",dtmYesterday)
Else
	strDay = DatePart("d",dtmYesterday)
End If

' Format output for yesterday
strYest = "Yesterday:  " & strYear & strMonth & strDay _
        & "  (" & strDay & "/" & strMonth & "/" & strYear & ")" & vbCrLf

' Calculate tomorrow's date
dtmTomorrow = DateAdd("d",1,Date)

' Get tomorrow's year
strYear = DatePart("yyyy",dtmTomorrow)

' Get tomorrow's month, add leading zero if necessary
If DatePart("m",dtmTomorrow) < 10 Then
	strMonth = 0 & DatePart("m",dtmTomorrow)
Else
	strMonth = DatePart("m",dtmTomorrow)
End If

' Get tomorrow's day, add leading zero if necessary
If DatePart("d",dtmTomorrow) < 10 Then
	strDay = 0 & DatePart("d",dtmTomorrow)
Else
	strDay = DatePart("d",dtmTomorrow)
End If

' Format output for tomorrow
strTomor = "Tomorrow:   " & strYear & strMonth & strDay & "  (" & _
          strDay & "/" & strMonth & "/" & strYear & ")"

' Display the result
Wscript.Echo( strHead & strYest & strToday & strTomor )
