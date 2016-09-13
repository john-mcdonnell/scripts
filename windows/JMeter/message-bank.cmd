@ECHO OFF

TITLE jMeter

REM Sleep for a second in order to ensure a unique filename
REM %SLEEP_PROGRAM%

:: ----------------------------------------------------------------
:: Format the current TIME and store it in a variable.
:: ----------------------------------------------------------------
SET LOG_TIME=%TIME%
SET LOG_TIME=%LOG_TIME::=_%
SET LOG_TIME=%LOG_TIME:.=_%
SET LOG_TIME=%LOG_TIME: =0%

:: ----------------------------------------------------------------
:: Format the current DATE and store it in a variable.
:: ----------------------------------------------------------------
SET LOG_YEAR=%DATE:~-4%
SET LOG_MONTH=%DATE:~3,2%
SET LOG_MONTH=%LOG_MONTH: =0%
SET LOG_DAY=%DATE:~-0,2%
SET LOG_DAY=%LOG_DAY: =0%
SET LOG_DATE=%LOG_YEAR%_%LOG_MONTH%_%LOG_DAY%

SET SORTABLE_DATE=%LOG_DATE%_%LOG_TIME%
SET HUMAN_READABLE_DATE=%DATE% %TIME%

SET SCRIPT_FOLDER=%~dp0
SET SCRIPT_FILE=%~n0
SET LOG_FILE=%SCRIPT_FOLDER%\%SCRIPT_FILE%[%SORTABLE_DATE%].log
SET TEST_SCRIPT=%SCRIPT_FOLDER%\%SCRIPT_FILE%.jmx
SET TEST_COMMAND_PROGRAM=jmeter.bat
SET TEST_COMMAND_NONGUI=%TEST_COMMAND_PROGRAM% --nongui 
SET JMETER_FOLDER=C:\apps\development\JMeter\jmeter
SET TAIL_PROGRAM=C:\apps\BareMetal\baretail.exe

REM Open the GUI if required
IF "%1"=="--GUI" (
    START /MIN /D "%JMETER_FOLDER%\bin" %TEST_COMMAND_PROGRAM% --testfile "%TEST_SCRIPT%" --logfile "%LOG_FILE%"

    GOTO END
)

ECHO Logging output to "%LOG_FILE%"...

ECHO. > "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
SET HUMAN_READABLE_DATE=%DATE% %TIME%
ECHO Starting %HUMAN_READABLE_DATE%... >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1

REM Display an active tail of the log file.
START "Logfile Tail" "%TAIL_PROGRAM%" "%LOG_FILE%"

TITLE "%TEST_SCRIPT% running..."
START /WAIT /MIN /D "%JMETER_FOLDER%\bin" %TEST_COMMAND_NONGUI% --testfile "%TEST_SCRIPT%" --logfile "%LOG_FILE%"
TITLE "Command Prompt [%USERNAME%]"

ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
SET HUMAN_READABLE_DATE=%DATE% %TIME%
ECHO Stopping %HUMAN_READABLE_DATE%... >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1
ECHO. >> "%LOG_FILE%" 2>&1

:END

EXIT /B