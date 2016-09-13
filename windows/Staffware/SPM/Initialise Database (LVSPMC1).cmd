@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin
SET InitDBLogFilename=%PPM_HOME%\log\initdb.log

ECHO Creating Database "User" Objects.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMBinFolder%
REM Create database "user" objects
START "Creating User Database Objects" /wait runinitdb -init -client %PPM_CLIENT% -user system -password manager -protocolfile %InitDBLogFilename%
start /wait notepad.exe  %InitDBLogFilename%
POPD

EXIT