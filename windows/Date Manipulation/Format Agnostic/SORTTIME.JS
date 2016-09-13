// SortTime.js,  Version 1.00 for Windows Script Host 1.00
// Show current time in HHmmss format
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Get and parse current time
now     = new Date();
hours   = now.getHours();
minutes = now.getMinutes();
seconds = now.getSeconds();

// Add leading spaces if necessary
if ( hours   < 10 ) hours   = "0" + hours;
if ( minutes < 10 ) minutes = "0" + minutes;
if ( seconds < 10 ) seconds = "0" + seconds;

// Concatenate strings and display the result
WScript.Echo( "SortTime=" + hours + "" + minutes + "" + seconds );
