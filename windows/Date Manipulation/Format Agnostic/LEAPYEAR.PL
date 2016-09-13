#! perl

if ( ( index( $ARGV[0], "?" ) > -1 ) or ( $ARGV[1] ) or ( $ARGV[0] < 0 ) or ( $ARGV[0] > 10000 ) or ( ( $ARGV[0] ) and ( $ARGV[0] == NaN ) ) ) {
	print "\nLeapYear.pl,  Version 1.10\n",
	      "Check if the specified year is a leap year\n\n",
	      "Usage:    LEAPYEAR.PL  [ year ]\n\n",
	      "Where:    \"year\" is a year between 1 and 10000\n",
	      "          default is the current year\n\n",
	      "Returns:  message on screen;\n",
	      "          return code 0 if the specified year is not a leap year;\n",
	      "          return code 1 if it is;\n",
	      "          return code 9 for invalid arguments\n\n",
	      "Written by Rob van der Woude\n",
	      "http://www.robvanderwoude.com\n";
	exit 9;
} else {
	$year = abs( $ARGV[0] );
}

# Use default if no (valid) year was specified
if ( ( $year < 0 ) or ( $year > 10000 ) or !( $year ) ) {
	# Parse time string
	($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year = $year + 1900;
}

# Leap years are divisible by 4, but not by 100, unless by 400
if ( ( $year % 4 == 0 ) xor ( $year % 100 == 0 ) xor ( $year % 400 == 0 ) ) {
	print( "\n$year IS a leap year\n" );
	$rc = 1;
} else {
	print( "\n$year is NOT a leap year\n" );
	$rc = 0;
}

# Terminate with return code 1 if the year IS a leap year
exit $rc
