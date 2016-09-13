#! perl

# Tomorrow.pl,  Version 1.00
# Display tomorrow's "sorted" date (YYYYMMDD)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Specify function library
use Time::Local;

# Convert today to epoch seconds
$today = timelocal(localtime);

# Add 1 day
@tomorrow = localtime($today + (24 * 60 * 60));

# Extract year, month and day, and correct base offsets
$year  = (@tomorrow)[5] + 1900;
$month = (@tomorrow)[4] + 1;
$day   = (@tomorrow)[3];

# Display the result, correctly formated
printf("\nTomorrow = %04d%02d%02d\n", $year, $month, $day);
