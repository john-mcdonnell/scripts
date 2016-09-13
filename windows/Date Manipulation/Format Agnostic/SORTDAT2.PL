#! perl

# SortDate.pl,  Version 2.00
# Display "sorted" date (YYYYMMDD)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Parse time string
($day,$month,$year) = (localtime)[3,4,5];

# Add "base year"
$year  = $year  + 1900;

# Add 1, since month is zero based
$month = $month + 1;

# Display result, correctly formated
printf("\nSortDate = %04d%02d%02d\n", $year, $month, $day);
