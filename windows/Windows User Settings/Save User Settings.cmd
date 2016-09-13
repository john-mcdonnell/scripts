@ECHO OFF

SET UserNameToBackup=%USERNAME%
SET SaveUserSettingsLogFileName=SaveUserSettingsLogFileName.Log
SET ScanStateLogFileName=%DestinationFolderName%\ScanState.Log
SET CreateFolderCommandFileName=Create Folder.cmd
SET DestinationFolderName=H:\User Settings\%USERDOMAIN%_%COMPUTERNAME%_%UserNameToBackup%
SET UserStateMigrationToolSaveSettingsProgramFileName=D:\USMT\Bin\ScanState.EXE

REM Write the log file header
ECHO ******** Saviving User Settings Started %date%%time% ******** >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1

CALL "%CreateFolderCommandFileName%" "%DestinationFolderName%" "%SaveUserSettingsLogFileName%" 2>&1

ECHO Backing up the Files and Settings of user "%UserNameToBackup%" to the folder "%DestinationFolderName%"... >>"%SaveUserSettingsLogFileName%" 2>&1
%UserStateMigrationToolSaveSettingsProgramFileName% /c /v:7 /o "%DestinationFolderName%" >>"%SaveUserSettingsLogFileName%" 2>&1

REM Write the log file footer
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO ******** Saviving User Settings Finished %date%%time% ******** >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1
ECHO. >>"%SaveUserSettingsLogFileName%" 2>&1

PAUSE