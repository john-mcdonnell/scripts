// LeapYear.js,  Version 1.01 for Windows Script Host
// Check if the specified year is a leap year.
//
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Parse command line
objArgs = WScript.Arguments;
if ( objArgs.length == 0 ) {
	// Default is current year
	objToday = new Date();
	myYear = objToday.getFullYear();
};
if ( objArgs.length == 1 ) {
	// Check datatype and range of argument
	myYear = objArgs(0).valueOf( );
	if ( isNaN( myYear ) ) Syntax( );
	if ( myYear <    0 )   Syntax( );
	if ( myYear > 9999 )   Syntax( );
};
if ( objArgs.length > 1 ) Syntax( );

isLeapYear = 0;
if ( myYear %   4 == 0 ) isLeapYear = 1;
if ( myYear % 100 == 0 ) isLeapYear = 0;
if ( myYear % 400 == 0 ) isLeapYear = 1;

if ( isLeapYear == 1 ) {
	strIs = " IS";
} else {
	strIs = " is NOT";
};
WScript.Echo( myYear + strIs + " a leap year" );

// Done
WScript.Quit( isLeapYear );


function Syntax( ) {
WScript.Echo( );
WScript.Echo( "LeapYear.js,  Version 1.01 for WSH" );
WScript.Echo( "Check if the specified year is a leap year." );
WScript.Echo( );
WScript.Echo( "Usage:   CScript  LEAPYEAR.JS  [ year ]" );
WScript.Echo( );
WScript.Echo( "Where:   'year' should be within the range of 0 through 9999." );
WScript.Echo( "         Default is the current year, if none is specified." );
WScript.Echo( );
WScript.Echo( "Returns: 0  if NOT a leap year" );
WScript.Echo( "         1  on leap years" );
WScript.Echo( "         2  on syntax errors" );
WScript.Echo( );
WScript.Echo( "Written by Rob van der Woude" );
WScript.Echo( "http://www.robvanderwoude.com" );
WScript.Quit(2);
}
