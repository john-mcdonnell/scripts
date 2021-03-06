@ECHO OFF
:: Check OS version and command line arguments
IF NOT "%OS%"=="Windows_NT" GOTO Syntax
IF [%1]==[] GOTO Start

ECHO.
ECHO StarDate.bat,  Version 1.00 for Windows NT
ECHO Display the current stardate
ECHO.
ECHO Usage:  STARDATE
ECHO.
ECHO Algorithm found on The StarTrek Gallery
ECHO http://www.trainerscity.com/startrek/
ECHO.
ECHO Written by Rob van der Woude
ECHO http://www.robvanderwoude.com
ECHO.
IF NOT "%OS%"=="Windows_NT" GOTO End

:Start
SETLOCAL

:: Determine temporary file name
SET TempReg=%Temp:"=%
SET TempReg="%TempReg%.\_Temp.reg"

:: Store current date and time in variables in default Locale format
FOR /F "tokens=1* delims= " %%A IN ('DATE/T') DO SET Today=%%B
FOR /F "tokens=*" %%A IN ('TIME/T') DO SET Now=%%A

:: Export registry settings to a temporary file
START /W REGEDIT /E %TempReg% "HKEY_CURRENT_USER\Control Panel\International"

:: Read date and time format from exported registry file
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TempReg% ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TempReg% ^| FIND /I "sDate"') DO SET sDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TempReg% ^| FIND "iTime" ^| FIND /V "iTimePrefix"') DO SET iTime=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TempReg% ^| FIND "sTime" ^| FIND /V "sTimeFormat"') DO SET sTime=%%B

:: Delete temporary file
DEL %TempReg%

:: Remove quotes from variables
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%
SET iTime=%iTime:"=%
SET sTime=%sTime:"=%

:: Parse date depending on registry settings
IF %iDate%==0 FOR /F "tokens=1-4* delims=%sDate% " %%A IN ('DATE/T') DO (
	SET Day=%%C
	SET Month=%%B
	SET Year=%%D
)
IF %iDate%==1 FOR /F "tokens=1-4* delims=%sDate% " %%A IN ('DATE/T') DO (
	SET Day=%%B
	SET Month=%%C
	SET Year=%%D
)
IF %iDate%==2 FOR /F "tokens=1-4* delims=%sDate% " %%A IN ('DATE/T') DO (
	SET Day=%%D
	SET Month=%%C
	SET Year=%%B
)
IF %Year% LSS 100 SET /A Year = %Year% + 2000

:: Parse time depending on registry settings
FOR /F "tokens=1,2* delims=%sTime% " %%A IN ('ECHO %Now%') DO (
	SET Hour=%%A
	SET Mins=%%B
)
IF %iTime%==1 GOTO Calc
SET AmPm=%Mins:~2,1%
SET Mins=%Mins:~0,2%
IF %Hour% LSS 12 IF /I %AmPm%==P SET /A Hour = %Hour% + 12
IF %Hour% EQU 12 IF /I %AmPm%==A SET Hour=0

:: Calculate stardate according to algorithm found on
:: http://www.trainerscity.com/startrek/stardate.php3?lang=en
:Calc
:: Calculate fraction of day
SET /A dDay = 24 * 60
SET /A fDay = %Mins% + 60 * %Hour%

:: Check if current year is a leap year
SET LeapYear=0
SET /A Test = %Year%/4
SET /A Test = %Test%*4
IF %Test% EQU %Year% SET LeapYear=1
SET /A Test = %Year%/100
SET /A Test = %Test%*100
IF %Test% EQU %Year% SET LeapYear=0
SET /A Test = %Year%/400
SET /A Test = %Test%*400
IF %Test% EQU %Year% SET LeapYear=1

:: Calculate fraction of year
SET /A dYear = 365 + %LeapYear%
SET fYear=%Day%
IF %Month% GTR  1 SET /A fYear = %fYear% + 31
IF %Month% GTR  2 SET /A fYear = %fYear% + 28 + %LeapYear%
IF %Month% GTR  3 SET /A fYear = %fYear% + 31
IF %Month% GTR  4 SET /A fYear = %fYear% + 30
IF %Month% GTR  5 SET /A fYear = %fYear% + 31
IF %Month% GTR  6 SET /A fYear = %fYear% + 30
IF %Month% GTR  7 SET /A fYear = %fYear% + 31
IF %Month% GTR  8 SET /A fYear = %fYear% + 31
IF %Month% GTR  9 SET /A fYear = %fYear% + 30
IF %Month% GTR 10 SET /A fYear = %fYear% + 31
IF %Month% GTR 11 SET /A fYear = %fYear% + 30

:: Calculate stardate from current year and calculated fractions
SET /A sY = %Year% - 2323
SET /A sX = ( 1 + 2000 * %fYear% ) / ( 2 * %dYear% )
SET /A sF = ( 1 + 2 * %fDay% ) / 288
SET StarDate=%sY%%sX%.%sF%

:: Display the result
ECHO.
ECHO Today is stardate %StarDate%

ENDLOCAL
:End
