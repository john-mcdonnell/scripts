@ECHO OFF
:: Windows NT 4 and later only
IF NOT "%OS%"=="Windows_NT" GOTO Syntax

SETLOCAL
:: Use current year as default
IF [%1]==[] GOTO ThisYear
:: Only 1 parameter allowed
IF NOT [%2]==[] GOTO Syntax
:: Check for ?
ECHO.%1 | FIND "?" >NUL
IF NOT ERRORLEVEL 1 GOTO Syntax
:: Check if parameter is a number
IF 1%1 LSS 2 GOTO Syntax
:: Check if the number is within range
IF 1%1 LSS 10 GOTO Syntax
IF 1%1 GTR 19999 GOTO Syntax
:: OK, continue
SET yy=%1
GOTO Calculate

:ThisYear
:: Code to extract day, month and year by Simon Sheppard
:: http://www.ss64.com
FOR /f "tokens=2-4 skip=1 delims=(/-)" %%G IN ('ECHO.^|DATE') DO (
	FOR /f "tokens=2 delims= " %%A IN ('DATE /T') DO (
		SET v_first=%%G
		SET v_second=%%H
		SET v_third=%%I
		SET v_all=%%A
	)
)
SET %v_first%=%v_all:~0,2%
SET %v_second%=%v_all:~3,2%
SET %v_third%=%v_all:~6,4%

:Calculate
:: Default to not a leap year
SET LeapYear=0
:: If year is a multiple of 4 then it is a leap year ...
SET /A test = %yy% / 4
SET /A test = %test% * 4
IF %test% EQU %yy% SET LeapYear=1
:: ... except if it is a multiple of 100 ...
SET /A test = %yy% / 100
SET /A test = %test% * 100
IF %test% EQU %yy% SET LeapYear=0
:: ... unless it is a multiple of 400!
SET /A test = %yy% / 400
SET /A test = %test% * 400
IF %test% EQU %yy% SET LeapYear=1

:: Display the result
SET is=IS
IF %LeapYear%==0 SET is=is NOT
ECHO %yy% %is% a leap year

:: Done
ENDLOCAL
GOTO End

:Syntax
ECHO.
ECHO LeapYear.bat, Version 1.01 for Windows NT 4 / 2000 / XP
ECHO Check if the specified year is a leap year or not.
ECHO.
ECHO Usage:  LEAPYEAR  [ year ]
ECHO Where:  "year" is a year between 0 and 9999.
ECHO         If no year is specified, the current year is assumed.
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO.
ECHO Code to extract the current year written by Simon Sheppard
ECHO http://www.ss64.com

:End
