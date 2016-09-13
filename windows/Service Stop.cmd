@echo off

sc query "%~1" | FIND /C "[SC] EnumQueryServicesStatus:OpenService FAILED 1060:">null

IF ERRORLEVEL 1 GOTO SERVICE_FOUND
ECHO "%~1" service status could not be detemined (the service "%~1" may not be installed).
GOTO EXIT
:SERVICE_FOUND

sc query "%~1" | FIND /C "RUNNING">null

IF NOT ERRORLEVEL 1 GOTO SERVICE_RUNNING
ECHO "%~1" is not running.
GOTO EXIT

:SERVICE_RUNNING
ECHO Stopping "%~1"...
net stop "%~1"
GOTO EXIT

:EXIT