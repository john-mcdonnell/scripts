@ECHO OFF
:: Windows NT 4 or later only
IF NOT "%OS%"=="Windows_NT" GOTO Syntax
:: No command line arguments required
IF NOT [%1]==[] GOTO Syntax

:: Keep variables local
SETLOCAL

:: Store current date in a variable in default Locale format
FOR /F "TOKENS=1* DELIMS= " %%A IN ('DATE/T') DO SET DATE=%%B
ECHO It is %DATE% today

:: Store current date in a variable in YYYYMMDD format
:: Export registry settings to a temporary file
START /W REGEDIT /E %TEMP%.\_TEMP.REG "HKEY_CURRENT_USER\Control Panel\International"
:: Read the exported data
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "sDate"') DO SET sDate=%%B
DEL %TEMP%.\_TEMP.REG
:: Remove quotes
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%

:: Parse today's date depending on registry's date format settings
IF %iDate%==0 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%A
	SET Day=%%B
)
IF %iDate%==1 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%B
	SET Day=%%A
)
IF %iDate%==2 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%A
	SET Month=%%B
	SET Day=%%C
)
:: Remove the day of week if applicable
FOR %%A IN (%Year%)  DO SET Year=%%A
FOR %%A IN (%Month%) DO SET Month=%%A
FOR %%A IN (%Day%)   DO SET Day=%%A

:: Today's date in YYYYMMDD format
SET SortDate=%Year%%Month%%Day%
ECHO For sorting purposes: %SortDate%

:: Done
ENDLOCAL & SET SortDate=%SortDate%
GOTO:EOF


:Syntax
ECHO.
ECHO SortDate, Version 3.10 for Windows NT 4 / 2000 / XP
ECHO Save date and "sorted" date in environment variables.
ECHO.
ECHO Usage:  %0
ECHO.
ECHO This batch file will always display the same results,
ECHO independent of "International" settings.
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO Adapted for Windows XP with help from Kailash Chanduka
