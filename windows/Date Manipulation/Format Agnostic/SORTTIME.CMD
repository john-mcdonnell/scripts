/* Display time in HHMMSS */

sorthour = right( time( "H" ), 2, "0" )
sortmins = right( time( "M" ) - ( 60 * time( "H" ) ), 2, "0" )
sortsecs = right( time( "S" ) - ( 60 * time( "M" ) ), 2, "0" )
sorttime = sorthour||sortmins||sortsecs
say sorttime
