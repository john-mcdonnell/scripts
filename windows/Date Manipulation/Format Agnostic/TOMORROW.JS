// Tomorrow.js,  Version 1.00 for Windows Script Host 2.00
// Display today's, yesterday's and tomorrow's date in two formats
//
// Written by Rob van der Woude
// http://www.robvanderwoude.com

// Specify header
strHead1 = "Format:     YYYYMMDD  (DD/MM/YYYY)";
strHead2 = "==================================";

// Create Date object
objToday = new Date();

// Get today's year, month and day
year  = objToday.getFullYear();
month = objToday.getMonth() + 1;
if ( month < 10 )
	{
	month = "0" + month;
	};
day   = objToday.getDate();
if ( day < 10 )
	{
	day = "0" + day;
	};

// Format output for today
strToday = "Today:      " + year + month + day + "  (" + day;
strToday = strToday + "/" + month + "/" + year + ")";

// Get current date in milliseconds since January 1, 1970
today = objToday.valueOf();

// Subtract 1 day
oneDay = 1000 * 24 * 60 * 60;
yesterday = today - oneDay;
objToday.setTime(yesterday);

// Get yesterday's year, month and day
year  = objToday.getFullYear();
month = objToday.getMonth() + 1;
if ( month < 10 )
	{
	month = "0" + month;
	};
day   = objToday.getDate();
if ( day < 10 )
	{
	day = "0" + day;
	};

// Format output for yesterday
strYest = "Yesterday:  " + year + month + day + "  (" + day;
strYest = strYest + "/" + month + "/" + year + ")";

// Add 1 day
oneDay = 1000 * 24 * 60 * 60;
tomorrow = today + oneDay;
objToday.setTime(tomorrow);

// Get tomorrow's year, month and day
year  = objToday.getFullYear();
month = objToday.getMonth() + 1;
if ( month < 10 )
	{
	month = "0" + month;
	};
day   = objToday.getDate();
if ( day < 10 )
	{
	day = "0" + day;
	};

// Format output for tomorrow
strTomor = "Tomorrow:   " + year + month + day + "  (" + day;
strTomor = strTomor + "/" + month + "/" + year + ")";

// Display the result
WScript.Echo( strHead1 );
WScript.Echo( strHead2 );
WScript.Echo( strYest );
WScript.Echo( strToday );
WScript.Echo( strTomor );
