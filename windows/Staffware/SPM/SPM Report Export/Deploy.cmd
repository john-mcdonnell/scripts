@ECHO OFF

REM ###############################################################################################################
REM #
REM # DO NOT EDIT THIS COMMENT BLOCK. IT IS MAINTAINED AUTOMATICALLY ON CHECK-IN/CHECK-OUT BY MICROSOFT SOURCESAFE
REM # 
REM # $Revision: 2 $
REM # $Date: 5/10/04 13:13 $
REM # $Archive: /Liverpool Victoria/Staffware/SPM/SPMExport/Deploy.cmd $
REM # 
REM ###############################################################################################################

SET SPMReportExportDestinationRootFolderName=D:\SPM Report Export
SET FileCopyExcludeListFileName=DeployExclude.lst

REM If the destination folder does exist, create it
IF EXIST "%SPMReportExportDestinationRootFolderName%" GOTO SPM_REPORT_EXPORT_DESTINATION_FOLDER_ALREADY_EXISTS
ECHO Creating destination folder "%SPMReportExportDestinationRootFolderName%" ...
MD "%SPMReportExportDestinationRootFolderName%"
ECHO.
ECHO.
:SPM_REPORT_EXPORT_DESTINATION_FOLDER_ALREADY_EXISTS

XCOPY "%CD%\*.*" "%SPMReportExportDestinationRootFolderName%" /V /C /F /R /K /Y /EXCLUDE:%FileCopyExcludeListFileName%

ATTRIB "%SPMReportExportDestinationRootFolderName%\*.*" -r

ECHO.
PAUSE
EXIT