@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin
SET SPMSystemBackupFolder=%SPMFolder%\SystemBackup

ECHO Exporting SPM System to the '%SPMSystemBackupFolder%' Folder.....
ECHO.
ECHO.
ECHO.

REM Create the backup folder if it does not exist.
IF EXIST "%SPMSystemBackupFolder%" GOTO SYSTEM_BACKUP_FOLDER_FOUND
ECHO Creating "%SPMSystemBackupFolder%" Folder.....
ECHO.
ECHO.
ECHO.
md "%SPMSystemBackupFolder%"
:SYSTEM_BACKUP_FOLDER_FOUND

PUSHD %SPMBinFolder%
START "Exporting SPM Users to the '%SPMSystemBackupFolder%' Data File....." /wait runppmconfig -user system -password manager -client %PPM_CLIENT% -mode export -system %SPMSystemBackupFolder% 
POPD

explorer "%SPMSystemBackupFolder%"