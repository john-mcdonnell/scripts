' Week.vbs,  Version 1.00 for Windows Script Host 2.00
' Display current week number.
'
' Assumptions: [1] First day of the week is Sunday
'              [2] Week 1 is the first week of the year with at least 4 days
' You can modify this by using other VBScript constants (parameters 3 and 4)
' in the DatePart() function.
'
' Written by Rob van der Woude
' http://www.robvanderwoude.com

Wscript.Echo("Week=" & DatePart("ww",Date,vbSunday,vbFirstFourDays))
