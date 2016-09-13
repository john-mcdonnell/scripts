#! perl

# Week.pl,  Version 2.00
# Display week number using Perl
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Parse time string
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

# Calculate number of full weeks this year
$week = int( ( $yday + 1 - $wday ) / 7 );

# Add 1 if today isn't Saturday
if ($wday < 6) {
	$week = $week + 1
}

# Display the result
print "Week $week\n";
