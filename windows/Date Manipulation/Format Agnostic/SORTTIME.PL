#! perl

# SortTime.pl,  Version 1.10
# Display "sorted" time (HHmmSS)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Parse time string
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

# Add leading zeroes if necessary
if ($hour < 10) {
	$hour = "0".$hour
}
if ($min < 10) {
	$min = "0".$min
}
if ($sec < 10) {
	$sec = "0".$sec
}

# Concatenate substrings
$sorttime = $hour.$min.$sec;

# Display result
print "\nSortTime = $sorttime\n";
