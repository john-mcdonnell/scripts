@ECHO OFF

SET FilterListProgramFilename=Filter List.cmd
SET LogFilename=%1
SET SPMImportLogFilename=%ppm_home%\log\%LogFilename%.txt
SET SPMImportLogFilenameLocalErrors=%LogFilename%_errors.txt
SET SPMImportLogFilenameLocalwarnings=%LogFilename%_warnings.txt
SET FilteredFilename=%LogFilename%_filtered.txt
SET FilteredFilenameTemp=%LogFilename%_filtered_temp.txt

REM Housekeeping
IF EXIST %SPMImportLogFilenameLocalErrors% DEL %SPMImportLogFilenameLocalErrors%
IF EXIST %FilteredFilename% DEL %FilteredFilename%

REM Get errors
COPY %SPMImportLogFilename% %SPMImportLogFilenameLocalErrors%
CALL "%FilterListProgramFilename%" "%SPMImportLogFilenameLocalErrors%" "E: "

REM Get warnings
COPY %SPMImportLogFilename% %SPMImportLogFilenameLocalWarnings%
CALL "%FilterListProgramFilename%" "%SPMImportLogFilenameLocalWarnings%" "W: "