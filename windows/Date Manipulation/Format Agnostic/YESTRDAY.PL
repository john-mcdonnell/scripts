#! perl

# Yesterday.pl,  Version 1.00
# Display yesterday's "sorted" date (YYYYMMDD)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Specify function library
use Time::Local;

# Convert today to epoch seconds
$today = timelocal(localtime);

# Subtract 1 day
@yesterday = localtime($today - (24 * 60 * 60));

# Extract year, month and day, and correct base offsets
$year  = (@yesterday)[5] + 1900;
$month = (@yesterday)[4] + 1;
$day   = (@yesterday)[3];

# Display the result, correctly formated
printf("\nYesterday = %04d%02d%02d\n", $year, $month, $day);
