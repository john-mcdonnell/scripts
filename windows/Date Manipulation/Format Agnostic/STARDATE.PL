#! perl

if ( $ARGV[0] ) {
	print "\nStarDate.pl,  Version 1.00\n",
	      "Convert current day and time to stardate\n\n",
	      "Usage:  STARDATE.PL\n\n",
	      "Based on an algorithm found on The StarTrek Gallery\n",
	      "http://www.trainerscity.com/startrek/\n\n",
	      "Written by Rob van der Woude\n",
	      "http://www.robvanderwoude.com\n\n";
}

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$sY = $year - 423;
# Is current year a leap year?
if ( ( $year % 4 == 0 ) xor ( $year % 100 == 0 ) xor ( $year % 400 == 0 ) ) {
	$leapyear = 1;
} else {
	$leapyear = 0;
}
$sX = int( 1000 * ( $yday + 1 ) / ( 365 + $leapyear ) );
$sF = int( 0.5 + ( $min + 60 * $hour ) / 144 );
$stardate = ( 1000 * $sY ) + $sX + ( $sF / 10 );
print( "\nStardate is now $sY$sX.$sF\n" );
