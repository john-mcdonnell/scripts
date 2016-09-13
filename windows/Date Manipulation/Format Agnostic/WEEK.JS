// Week.js,  Version 1.00 for Windows Script Host
// Display the current week number.
//
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Check command line parameters (none necessary)
objArgs = WScript.Arguments;
if ( objArgs.length > 0 ) Syntax( );

// Get and parse current date
objToday = new Date();
// Get day of month
numDate  = objToday.getDate( );
// Get day of week
numDay   = objToday.getDay( );
// Get month
numMonth = objToday.getMonth( ) + 1;
// Get year
numYear  = objToday.getFullYear();
// Check if this is a leap year
isLeapYear = 0;
if ( numYear %   4 == 0 ) isLeapYear = 1;
if ( numYear % 100 == 0 ) isLeapYear = 0;
if ( numYear % 400 == 0 ) isLeapYear = 1;
// Calculate the total number of days this year
numYDays = 0;
if ( numMonth >  1 ) numYDays = numYDays + 31;
if ( numMonth >  2 ) numYDays = numYDays + 28 + isLeapYear;
if ( numMonth >  3 ) numYDays = numYDays + 31;
if ( numMonth >  4 ) numYDays = numYDays + 30;
if ( numMonth >  5 ) numYDays = numYDays + 31;
if ( numMonth >  6 ) numYDays = numYDays + 30;
if ( numMonth >  7 ) numYDays = numYDays + 31;
if ( numMonth >  8 ) numYDays = numYDays + 31;
if ( numMonth >  9 ) numYDays = numYDays + 30;
if ( numMonth > 10 ) numYDays = numYDays + 31;
if ( numMonth > 11 ) numYDays = numYDays + 30;
numYDays = numYDays + numDate;
// Calculate total number of days for last Sunday
numYDays = numYDays - numDay;
// Integer divide by 7 to get the number of whole weeks
numWeek = ( numYDays - ( numYDays % 7 ) ) / 7;
// Minimum number of days in week 1
numMinDWeek1 = 4;
if ( ( numYDays ) % 7 > numMinDWeek1 ) numWeek = numWeek + 1;
// Show the results
WScript.Echo( "Week=" + numWeek );
// Quit and return week number
WScript.Quit( numWeek );


function Syntax( ) {
WScript.Echo( );
WScript.Echo( "Week.js,  Version 1.00 for WSH" );
WScript.Echo( "Display the current week number." );
WScript.Echo( );
WScript.Echo( "Usage:   CScript  WEEK.JS" );
WScript.Echo( );
WScript.Echo( "Returns: current week number" );
WScript.Echo( "         or 255 on syntax errors" );
WScript.Echo( );
WScript.Echo( "Assumptions: [1] First day of the week is Sunday" );
WScript.Echo( "             [2] Week 1 is the first week of the year with at least 4 days" );
WScript.Echo( "These assumptions can be changed by modifying the script's source code." );
WScript.Echo( "Read the comments in the source code to find the values to be modified." );
WScript.Echo( );
WScript.Echo( "Written by Rob van der Woude" );
WScript.Echo( "http://www.robvanderwoude.com" );
WScript.Quit(255);
}
