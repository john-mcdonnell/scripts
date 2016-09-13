// SortDate.js,  Version 1.00 for Windows Script Host 1.00
// Show current date in YYYYMMDD format
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Get and parse current date
now   = new Date();
day   = now.getDate();
month = now.getMonth() + 1;
year  = now.getYear();

// Add leading spaces if necessary
if ( day   < 10 ) day   = "0" + day;
if ( month < 10 ) month = "0" + month;

// Concatenate strings and display the result
WScript.Echo( "SortDate=" + year + "" + month + "" + day );
