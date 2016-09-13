#! perl

# SortTime.pl,  Version 2.00
# Display "sorted" time (HHmmSS)
# Written by Rob van der Woude
# http://www.robvanderwoude.com

# Parse time string
($sec,$min,$hour) = (localtime)[0,1,2];

# Display result, correctly formated
printf("\nSortTime = %02d%02d%02d\n", $hour, $min, $sec);
