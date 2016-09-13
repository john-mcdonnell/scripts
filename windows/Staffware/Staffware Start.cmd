@ECHO OFF

SET SWDIR=d:\staffware\staffw_nod1
SET SWDIR_BIN=%SWDIR%\bin

REM CALL "%USERPROFILE%\My Documents\Admin\Service Start.cmd" "Staffware staffw_nod1 Process Sentinels "

ECHO Starting Staffware.....
ECHO.
ECHO.
ECHO.
pushd %SWDIR_BIN%
CALL swstart.bat -p
popd

PAUSE.
EXIT