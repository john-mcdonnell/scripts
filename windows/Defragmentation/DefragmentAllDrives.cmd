@ECHO OFF

SET DefragmentationCommandFilename=DefragmentDrive.cmd
SET DefragmentationLogFilename=DefragmentDrive.log
SET DefragmentationDriveListFilename=DefragmentAllDrives.lst

ECHO Defragmenting Drives...
ECHO.
ECHO.

IF EXIST "%DefragmentationDriveListFilename%" GOTO DRIVE_LIST_FOUND
ECHO Drive list file "%DefragmentationDriveListFilename%" not found. >> "%DefragmentationLogFilename%"
ECHO Defragmentation will not be attempted for any drives (%DATE% @%TIME%). >> "%DefragmentationLogFilename%"
GOTO DRIVE_LIST_NOT_FOUND
:DRIVE_LIST_FOUND

FOR /F "usebackq" %%F IN ("%DefragmentationDriveListFilename%") DO "%DefragmentationCommandFilename%" %%F

GOTO FINISH

:DRIVE_LIST_NOT_FOUND

ECHO. >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
ECHO ******************************************************************************** >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%

:FINISH

IF EXIST "%DefragmentationLogFilename%" notepad.exe "%DefragmentationLogFilename%"