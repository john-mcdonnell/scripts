@ECHO OFF

SET ReportSourceFileNameFullPath=%~1
SET ReportArchiveFolderNameFullPath=%~2

IF EXIST "%ReportArchiveFolderNameFullPath%" GOTO REPORT_OUTPUT_ARCHIVE_FOLDER_ALREADY_EXISTS
ECHO Creating the Report archive folder "%ReportArchiveFolderNameFullPath%"...
md "%ReportArchiveFolderNameFullPath%"
:REPORT_OUTPUT_ARCHIVE_FOLDER_ALREADY_EXISTS
ECHO Archiving the report output "%ReportSourceFileNameFullPath%" to the "%ReportArchiveFolderNameFullPath%" folder...
copy "%ReportSourceFileNameFullPath%" "%ReportArchiveFolderNameFullPath%"
