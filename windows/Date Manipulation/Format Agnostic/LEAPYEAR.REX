/* LeapYear.rex                               */
/* Check if the specified year is a leap year */
/* Written by Rob van der Woude               */
/* http://www.robvanderwoude.com              */

parse arg year dummy .
if dummy <> "" then call Syntax
if year  <> "" then do
	if pos( "?", year ) >    0 then call Syntax
	if year             <    0 then call Syntax
	if year             > 9999 then call Syntax
end
else do
	year = substr( date("S"), 1, 4 )
end

leapyear = 0
if year //   4 = 0 then leapyear = 1
if year // 100 = 0 then leapyear = 0
if year // 400 = 0 then leapyear = 1

if leapyear = 1 then do
	msg = year||" IS "
end
else do
	msg = year||" is NOT "
end
msg = msg||"a leap year"
say
say msg
exit 0


Syntax:
	say
	say "LeapYear.rex,  Version 1.00"
	say "Check if the specified year is a leap year"
	say
	say "Usage:  <REXX>  LEAPYEAR.REX  [ year ]"
	say
	say 'Where:  "<REXX>" is your Rexx interpreter:'
	say "                 - Windows:  REGINA.EXE or REXX.EXE, whichever you installed"
	say "                 - OS/2:     no need to specify, just rename script to *.cmd"
	say '        "year"   is any year between 0 and 9999'
	say
	say "Written by Rob van der Woude"
	say "http://www.robvanderwoude.com"
	exit 1
return
