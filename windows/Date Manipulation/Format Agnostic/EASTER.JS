// Easter.js,  Version 1.11 for WSH 1.0
// Calculate Easter Day for a specified year
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Define variable to insert CR/LF
jsCrLf = String.fromCharCode( 13, 10 );

// Determine current year
objToday = new Date();
thisYear = objToday.getFullYear();

// Check command line parameters
objArgs = WScript.Arguments;
if ( objArgs.length == 0 ) {
	// Default is current year
	myYear = thisYear;
};
if ( objArgs.length == 1 ) {
	// Check datatype and range of argument
	myYear = objArgs(0).valueOf( );
	if ( isNaN( myYear ) ) Syntax( );
	// Convert argument string to number
	myYear = Math.floor( myYear );
	if ( myYear < 1752 )   Syntax( );
	if ( myYear > 3000 )   Syntax( );
};
if ( objArgs.length > 1 ) Syntax( );


// Calculate Easter Day using the instructions found at
// Simon Kershaw's "KEEPING THE FEAST"
// http://www.oremus.org/liturgy/etc/ktf/app/easter.html
G   = ( myYear % 19 ) + 1;
S   = Math.floor(( myYear - 1600 ) / 100 ) - Math.floor(( myYear - 1600 ) / 400 );
L   = Math.floor(( Math.floor(( myYear - 1400 ) / 100 ) * 8 ) / 25 );
PP  = ( 30003 - ( 11 * G ) + S - L ) % 30;
if ( PP == 28 ) {
	if ( G > 11 ) {
		P = 27;
	}
} else {
	if ( PP == 29 ) {
		P = 28;
	} else {
		P = PP;
	}
}
D   = ( Math.floor( myYear / 4 ) - Math.floor( myYear / 100 ) + Math.floor( myYear / 400 ) + myYear ) % 7;
DD  = ( 8 - D ) % 7;
PPP = ( 70003 + P ) % 7;
X   = (( 70004 - D - P ) % 7 ) + 1;
E   = P + X;
if ( E < 11 ) {
	ED = E + 21;
	EM = "March";
} else {
	ED = E - 10;
	EM = "April";
}
if ( myYear < thisYear ) {
	strIS = "was";
} else {
	if ( myYear == thisYear ) {
		strIS = "is";
	} else {
		strIS = "will be";
	}
}

// Display the result
WScript.Echo( jsCrLf + "In " + myYear + " Easter Day " + strIS + " " + EM + " " + ED );

// Done
WScript.Quit(0);


function Syntax( ) {
	strMsg  = jsCrLf + "Easter.js,  Version 1.11 for WSH 1.0" + jsCrLf;
	strMsg += "Calculate the date of Easter Day for the specified year.";
	strMsg += jsCrLf + jsCrLf;
	strMsg += "Usage:  CSCRIPT  EASTER.JS  [ year ]";
	strMsg += jsCrLf + jsCrLf;
	strMsg += "Where:  year should be within the range 1752 through 3000";
	strMsg += jsCrLf + jsCrLf;
	strMsg += "Written by Rob van der Woude" + jsCrLf;
	strMsg += "http://www.robvanderwoude.com";
	strMsg += jsCrLf + jsCrLf;
	strMsg += "Based on the instructions found at" + jsCrLf;
	strMsg += "Simon Kershaw's 'KEEPING THE FEAST'" + jsCrLf;
	strMsg += "http://www.oremus.org/liturgy/etc/ktf/app/easter.html";
	WScript.Echo( strMsg );
	WScript.Quit(1);
}
