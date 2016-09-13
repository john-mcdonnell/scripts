@ECHO OFF

SET PPM_CLIENT=%~1
SET SPMFolderName=%PPM_HOME%
SET SPMBinFolderName=%SPMFolderName%\bin
SET SPMReportDefinitionFolderName=%SPMFolderName%\config\%PPM_CLIENT%\report\reportdefinitions
SET SPMlogFolderName=%SPMFolderName%\log
SET SPMReportName=%~2
SET SPMReportOutputFileName=%~3
SET SPMReportOutputFolderName=%~d3%~p3
SET RunPPMReportLogFileName=%SPMlogFolderName%\runppmreport.log

IF EXIST "%SPMReportDefinitionFolderName%" GOTO SPM_REPORT_DEFINITION_FOLDER_ALREADY_EXISTS
ECHO SPM Report Definition Folder "%SPMReportDefinitionFolderName%" not found.
GOTO EXIT
:SPM_REPORT_DEFINITION_FOLDER_ALREADY_EXISTS

IF EXIST "%SPMReportDefinitionFolderName%\%SPMReportName%" GOTO SPM_REPORT_DEFINITION_FILE_NOT_FOUND
ECHO SPM Report Definition file "%SPMReportDefinitionFolderName%\%SPMReportName%" not found.
GOTO EXIT
:SPM_REPORT_DEFINITION_FILE_NOT_FOUND

IF NOT EXIST "%SPMReportOutputFileName%" GOTO SPM_REPORT_OUTPUT_FILENAME_NOT_FOUND
ECHO Deleting previous report output filename "%SPMReportOutputFileName%"...
DEL "%SPMReportOutputFileName%"
ECHO.
ECHO.
:SPM_REPORT_OUTPUT_FILENAME_NOT_FOUND

IF NOT EXIST "%SPMReportOutputFolderName%" (
	ECHO Creating the Report ouput folder "%SPMReportOutputFolderName%"
	md "%SPMReportOutputFolderName%"
)

pushd %SPMFolderName%\bin%
ECHO Executing report "%SPMReportDefinitionFolderName%\%SPMReportName%" and saving result to "%SPMReportOutputFileName%" file...
CALL %SPMBinFolderName%\runppmreport.bat -user system -password manager -client lvspmc1 -report "%SPMReportDefinitionFolderName%\%SPMReportName%" -destination "%SPMReportOutputFileName%" -protocolfile %RunPPMReportLogFileName%
@ECHO OFF
popd
ECHO.
ECHO.
ECHO.