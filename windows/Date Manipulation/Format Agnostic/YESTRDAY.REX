/* Yesterday.rex,  Version 1.00 for Regina Rexx */
/* Show yesterday's date in YYYYMMDD format     */
/* Written by Rob van der Woude                 */
/* http://www.robvanderwoude.com                */

say
say "Yesterday="||date( "S", date( "B" ) - 1, "B" )
