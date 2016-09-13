@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMLogFolder=%SPMFolder%\log

ECHO Deleting All Log Files (i.e. *.log and *.txt) from folder .....
ECHO.
ECHO.
ECHO.

del "%SPMLogFolder%\*.log"
del "%SPMLogFolder%\*.txt"

PAUSE.