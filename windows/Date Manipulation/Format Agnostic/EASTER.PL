#! perl

# Check command line parameters
if ( !$ARGV[0] ) {
	($sec,$min,$hour,$mday,$mon,$ChkYear,$wday,$yday,$isdst) = localtime(time);
	$ChkYear = $ChkYear + 1900;
} else {
	if ( $ARGV[1] ) {
		Syntax( );
	} else {
		$strChkYear = $ARGV[0];
		$ChkYear = abs( $strChkYear );
		if ( $strChkYear != $ChkYear ) {
			Syntax( );
		}
		if ( ( $ChkYear < 1752 ) or ( $ChkYear > 3000 ) ) {
			Syntax( );
		}
	}
}

# Calculate Easter Day using the instructions found at
# Simon Kershaw's "KEEPING THE FEAST"
# http://www.oremus.org/liturgy/etc/ktf/app/easter.html

$G  = ( $ChkYear % 19 ) + 1;
$S  = int( ( $ChkYear - 1600 ) / 100 ) - int( ( $ChkYear - 1600 ) / 400 );
$L  = int( ( int( ( $ChkYear - 1400 ) / 100 ) * 8 ) / 25 );
$PP = ( 30003 - 11 * $G + $S - $L ) % 30;
if ( ( ( $PP == 28 ) and ( $G > 11 ) ) or ( $PP == 29 ) ) {
	$P = $PP - 1;
} else {
	$P = $PP;
}
$D   = ( $ChkYear + int( $ChkYear / 4 ) - int( $ChkYear / 100 ) + int( $ChkYear / 400 )) % 7;
$DD  = ( 8 - $D ) % 7;
$PPP = ( 70003 + $P ) % 7;
$X   = (( 70004 - $D - $P ) % 7 ) + 1;
$E   = $P + $X;
if ( $E < 11 ) {
	$ED = $E + 21;
	$EM = "March";
} else {
	$ED = $E - 10;
	$EM = "April";
}

# Use default if no (valid) year was specified
if ( ( $year < 0 ) or ( $year > 10000 ) or !( $year ) ) {
	# Parse time string
	($s,$m,$h,$md,$mo,$thisYear,$wd,$yd,$isdst) = localtime(time);
	$thisYear = $thisYear + 1900;
}
if ( $ChkYear < $thisYear ) {
	$Is = "was";
} else {
	if ( $ChkYear == $thisYear ) {
		$Is = "is";
	} else {
		$Is = "will be";
	}
}

# Display the result
print( "\nIn $ChkYear Easter Day $Is $EM $ED\n" );

# Done
exit 0;



sub Syntax {
	print "\nEaster.pl,  Version 1.00\n",
	      "Calculate the date of Easter Day for the specified year\n\n",
	      "Usage:  EASTER.PL  [ year ]\n\n",
	      "Where:  year should be within the range of 1752 through 3000",
	      "\n\nWritten by Rob van der Woude\n",
	      "http://www.robvanderwoude.com\n\n",
	      "Based on the instructions found at\n",
	      "Simon Kershaw\'s \"KEEPING THE FEAST\"",
	      "http://www.oremus.org/liturgy/etc/ktf/app/easter.html\n";
	exit 1;
}
