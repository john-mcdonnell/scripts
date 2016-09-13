#! perl

# SortDate.pl,  Version 1.00
# Display "sorted" date (YYYYMMDD)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Parse time string
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

# Add "base year"
$year = $year + 1900;

# Add 1, since moth seems to be zero based
$mon  = $mon  + 1;

# Add leading zeroes if necessary
if ($mon < 10) {
	$mon = "0".$mon
}
if ($mday < 10) {
	$mday = "0".$mday
}

# Concatenate substrings
$sortdate = $year.$mon.$mday;

# Display result
print "\nSortDate = $sortdate\n";
