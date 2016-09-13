@ECHO OFF

ECHO Stoping SPM Service.....
ECHO.
ECHO.
ECHO.
NET STOP "SPM-Server (lvspmc1)"
NET STOP "SPM-RMI Registry"

PAUSE.