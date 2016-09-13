@ECHO OFF

SET SWDIR=D:\staffware\staffw_nod1
SET SWDIR_BIN=%SWDIR%\bin

REM CALL "%USERPROFILE%\My Documents\Admin\Service Stop.cmd" "Staffware staffw_nod1 Process Sentinels "

ECHO Stopping Staffware.....
ECHO.
ECHO.
ECHO.
pushd %SWDIR_BIN%
CALL swstop.bat -p
popd

PAUSE.
EXIT