@echo off

IF EXIST %4 GOTO AlreadyMapped
echo Mapping Drive "%4" to "%~1" as User "%2" .....
net use %4 "%~1" %3 /USER:%2 /PERSISTENT:NO

GOTO :End

:AlreadyMapped
echo Drive "%4" is in use.

:End