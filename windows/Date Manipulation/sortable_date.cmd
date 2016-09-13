@ECHO OFF

FOR /F "tokens=1-4 delims=/ " %%I IN ('DATE /t') DO SET CURRENT_DATE=%%K-%%J-%%I
FOR /F "tokens=1-2 delims=: " %%I IN ('TIME /t') DO SET CURRENT_TIME=%%I-%%J

ECHO The value is "%CURRENT_DATE%_%CURRENT_TIME%"
ECHO.
ECHO.
ECHO.

ECHO ... but this is better as it is "cleaner" script and a more accurate time (includes milliseconds) ...
:: ----------------------------------------------------------------
:: Format the current TIME and store it in a variable.
:: ----------------------------------------------------------------
SET LOG_CHKTIME=%TIME%
SET LOG_CHKTIME=%LOG_CHKTIME::=%
SET LOG_CHKTIME=%LOG_CHKTIME:.=%
SET LOG_CHKTIME=%LOG_CHKTIME: =0%

:: ----------------------------------------------------------------
:: Format the current DATE and store it in a variable.
:: ----------------------------------------------------------------
SET LOG_YEAR=%DATE:~-4%
SET LOG_MONTH=%DATE:~3,2%
SET LOG_MONTH=%LOG_MONTH: =0%
SET LOG_DAY=%DATE:~-0,2%
SET LOG_DAY=%LOG_DAY: =0%

ECHO %LOG_YEAR%_%LOG_MONTH%_%LOG_DAY%_%LOG_CHKTIME%

PAUSE.