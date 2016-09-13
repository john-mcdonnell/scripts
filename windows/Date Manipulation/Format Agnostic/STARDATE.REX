/* Convert current date and time to stardate */

If Arg( 1, "E" ) Then Do
	Say
	Say "StarDate.rex,  Version 1.00"
	Say "Convert current date and time to stardate"
	Say
	Say "Usage:  <REXX>  STARDATE.REX"
	Say
	Say 'Where:  "<REXX>" is your Rexx interpreter:'
	Say "              - Windows:  REGINA.EXE or REXX.EXE, whichever is installed"
	Say "              - OS/2:     no need to specify, just rename script to *.cmd"
	Say
	Say "Based on an algorithm found on The StarTrek Gallery"
	Say "http://www.trainerscity.com/startrek/"
	Say
	Say "Written by Rob van der Woude"
	Say "http://www.robvanderwoude.com"
	Say
End

/* Current year */
year = Left( Date( "S" ), 4 )

/* Calculate fraction of current year */
ydays = Date( "D" )

/* Check for leap year */
leapyear = 0
If ( year //   4 ) = 0 Then leapyear = 1
If ( year // 100 ) = 0 Then leapyear = 0
If ( year // 400 ) = 0 Then leapyear = 1

/* Calculate actual starsate */
stardate = ( year - 2323 )||1000 * ydays % ( 365 + leapyear )||"."||Time( "M" ) % 144

/* Display the result */
Say
Say "Stardate today is "||stardate
