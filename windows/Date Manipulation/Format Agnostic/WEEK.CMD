/* Week.cmd,  Version 2.00        */
/* Display week number using Rexx */
/* Written by Rob van der Woude   */
/* http://www.robvanderwoude.com  */

/* Translate day of week to number */
select
	when date( "W" ) = "Saturday"  then ndow = 6
	when date( "W" ) = "Friday"    then ndow = 5
	when date( "W" ) = "Thursday"  then ndow = 4
	when date( "W" ) = "Wednesday" then ndow = 3
	when date( "W" ) = "Tuesday"   then ndow = 2
	when date( "W" ) = "Monday"    then ndow = 1
	otherwise ndow = 0
end

/* Calculate number of WHOLE weeks this year (Sundays to Saturdays) */
weeks = ( date( "D" ) - ndow ) % 7

/* Add one more if today isn't Saturday */
if ndow < 6 then weeks = weeks + 1

/* Display the result */
say
say "Week "||weeks
