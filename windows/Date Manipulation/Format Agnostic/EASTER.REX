/* Easter.rex,  Version 1.00 for Regina Rexx */
/* Calculate Easter Day for a specified year */
/* Written by Rob van der Woude              */
/* http://www.robvanderwoude.com             */

/* Check command line parameters */
Parse Arg year dummy
If dummy <> "" Then Call Syntax
thisYear = Substr( Date( "S" ), 1, 4 )
If year = "" Then year = thisYear
If DataType( year, "W" ) = 0 Then Call Syntax
If year < 1752 Then Call Syntax
If year > 3000 Then Call Syntax

/* Calculate Easter Day using the instructions found at  */
/* Simon Kershaw's "KEEPING THE FEAST"                   */
/* http://www.oremus.org/liturgy/etc/ktf/app/easter.html */
G  = year // 19 + 1
S  = ( year - 1600 ) % 100 - ( year - 1600 ) % 400
L  = ( ( ( year - 1400 ) % 100 ) * 8 ) % 25
P1 = ( 30003 - 11 * G + S - L ) // 30
P  = P1
If P = 28 Then If G > 11 Then P = 27
If P = 29 Then P = 28
D  = ( year + ( year % 4 ) - ( year % 100 ) + ( year % 400 )) // 7
D1 = ( 8 - D ) // 7
P2 = ( 70003 + P ) // 7
X  = ( ( 70004 - D - P ) // 7 ) + 1
E  = P + X
If E < 11 Then Do
	ED = E + 21
	EM = "March"
End
Else Do
	ED = E - 10
	EM = "April"
End
If year < thisYear Then is = "was"
If year = thisYear Then is = "is"
If year > thisYear Then is = "will be"

/* Display the result */
Say "In "||year||" Easter Day "||is||" "||EM||" "||ED

/* Computer, end program */
Exit 0

Syntax:
	Say
	Say "Easter.rex,  Version 1.00 for Regina Rexx"
	Say "Calculate the date of Easter Day for the specified year."
	Say
	Say "Usage:  Regina  EASTER.REX  [ year ]"
	Say
	Say "Where:  year should be within the range of 1752 through 3000"
	Say
	Say "Written by Rob van der Woude"
	Say "http://www.robvanderwoude.com"
	Say
	Say "Based on the instructions found at"
	Say "Simon Kershaw's "||'"KEEPING THE FEAST"'
	Say "http://www.oremus.org/liturgy/etc/ktf/app/easter.html"
	Exit 1
Return
