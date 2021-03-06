@ECHO OFF
:: Week.bat, Version 1.00 for Windows NT
:: Display the number of the current week
::
:: Written by Rob van der Woude
:: http://www.robvanderwoude.com


:: Use local copy of environment and enable command extensions
VERIFY OTHER 2>nul
SETLOCAL ENABLEEXTENSIONS
IF ERRORLEVEL 1 (
	ECHO Unable to enable command extensions
	GOTO End
)

:: Export registry settings for date format to a temporary file
START /W REGEDIT /E %TEMP%.\_TEMP.REG "HKEY_CURRENT_USER\Control Panel\International"
:: Read date format from the exported data
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "sDate"') DO SET sDate=%%B
DEL %TEMP%.\_TEMP.REG
:: Remove quotes
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%

:: Convert current date to number of days passed this year,
:: taking into account the date format read from the registry
IF %iDate%==0 FOR /F "tokens=2-4* delims=%sDate% " %%A IN ('DATE/T') DO CALL :DoY %%B %%A %%C
IF %iDate%==1 FOR /F "tokens=2-4* delims=%sDate% " %%A IN ('DATE/T') DO CALL :DoY %%A %%B %%C
IF %iDate%==2 FOR /F "tokens=2-4* delims=%sDate% " %%A IN ('DATE/T') DO CALL :DoY %%C %%B %%A

:: Convert day of week to number
FOR /F "tokens=1 delims= " %%A IN ('DATE/T') DO CALL :DoW %%A

:: Calculate number of full weeks passed this year
SET /A Week = %DoY% - %DoW% + 7
SET /A Week /= 7

SET Week
GOTO End


:DoW
SETLOCAL
:: Convert day of week to number (language dependent, modify if necessary!)
IF "%1"=="Mon" SET DoW=1
IF "%1"=="Tue" SET DoW=2
IF "%1"=="Wed" SET DoW=3
IF "%1"=="Thu" SET DoW=4
IF "%1"=="Fri" SET DoW=5
IF "%1"=="Sat" SET DoW=6
IF "%1"=="Sun" SET DoW=7
ENDLOCAL & SET DoW=%DoW%
GOTO:EOF


:DoY
SETLOCAL
SET DoM=%1
:: Remove leading zero
IF "%DoM:~0,1%"=="0" IF %DoM% GTR 0 SET /A DoM = 1%DoM% - 100
SET Month=%2
:: Remove leading zero
IF "%Month:~0,1%"=="0" IF %Month% GTR 0 SET /A Month = 1%Month% - 100
SET Year=%3

:: Determine leap day
SET LeapYear=0
SET /A Leap = %Year% %% 4
IF %Leap% EQU 0 SET LeapYear=1
SET /A Leap = %Year% %% 100
IF %Leap% EQU 0 SET LeapYear=0
SET /A Leap = %Year% %% 400
IF %Leap% EQU 0 SET LeapYear=1

:: Add the days of each full month passed
IF %Month% GEQ  1 SET /A Days2Add  =  0
IF %Month% GEQ  2 SET /A Days2Add += 31
IF %Month% GEQ  3 SET /A Days2Add += 28
IF %Month% GEQ  3 SET /A Days2Add += %LeapYear%
IF %Month% GEQ  4 SET /A Days2Add += 31
IF %Month% GEQ  5 SET /A Days2Add += 30
IF %Month% GEQ  6 SET /A Days2Add += 31
IF %Month% GEQ  7 SET /A Days2Add += 30
IF %Month% GEQ  8 SET /A Days2Add += 31
IF %Month% GEQ  9 SET /A Days2Add += 31
IF %Month% GEQ  0 SET /A Days2Add += 30
IF %Month% GEQ 11 SET /A Days2Add += 31
IF %Month% GEQ 12 SET /A Days2Add += 30

:: Add it all up and return the calculated value
SET /A DoY = %Days2Add% + %DoM%
ENDLOCAL & SET DoY=%DoY%
GOTO:EOF


:End
ENDLOCAL
