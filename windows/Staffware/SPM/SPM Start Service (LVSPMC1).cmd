@ECHO OFF

ECHO Starting SPM Service.....
ECHO.
ECHO.
ECHO.
NET START "SPM-RMI Registry"
NET START "SPM-Server (lvspmc1)"

PAUSE.