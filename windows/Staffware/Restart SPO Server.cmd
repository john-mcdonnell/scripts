@ECHO OFF

SET StaffwareFolderName=D:\Staffware
SET StaffwareNodeName=staffw_nod1
SET StaffwareNodeFolderName=%StaffwareFolderName%\%StaffwareNodeName%
SET StaffwareUtilFolderName=%StaffwareFolderName%\%StaffwareNodeName%\Util
SET StaffwareSPOServerProcessName=SPO

IF NOT EXIST "%StaffwareNodeFolderName%" GOTO STAFFWARE_NODE_FOLDER_NOT_FOUND

PUSHD %StaffwareUtilFolderName%
ECHO Stopping the "%StaffwareSPOServerProcessName%" Staffware Process
swadm DELETE_PROCESS 1 %StaffwareSPOServerProcessName% 1
ECHO Delay execution for 30 seconds to allow the Staffware SPO Server to stop completely.
sleep 30
ECHO Starting the "%StaffwareSPOServerProcessName%" Staffware Process
swadm ADD_PROCESS 1 %StaffwareSPOServerProcessName% Y
ECHO.
ECHO.
ECHO.
ECHO NOTE: - Staffware SPO Server will not be completely started until the "SWEntObjSvDB.exe" process is started.
POPD

PAUSE.

GOTO EXIT

:STAFFWARE_NODE_FOLDER_NOT_FOUND
ECHO The Staffware Folder "%StaffwareNodeFolderName%" was not found.
PAUSE.
GOTO EXIT

:EXIT