@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMReportListFilenameFullPath=Report List.lst
SET RunReportCommandFileName=Export Report (%PPM_CLIENT%).cmd
SET ArchiveReportCommandFileName=Archive Report.cmd

ECHO Exporting SPM Reports...
ECHO.
ECHO.
ECHO.

FOR /F "usebackq eol=# tokens=1,2 delims=," %%i IN ("%SPMReportListFilenameFullPath%") DO CALL "%RunReportCommandFileName%" "%PPM_CLIENT%" "%%i" "%%j"
ECHO.
ECHO.
ECHO.

:: Store current date in a variable in YYYYMMDD format
:: Export registry settings to a temporary file
START /W REGEDIT /E %TEMP%.\_TEMP.REG "HKEY_CURRENT_USER\Control Panel\International"
:: Read the exported data
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "iDate"') DO SET iDate=%%B
FOR /F "tokens=1* delims==" %%A IN ('TYPE %TEMP%.\_TEMP.REG ^| FIND /I "sDate"') DO SET sDate=%%B
DEL %TEMP%.\_TEMP.REG
:: Remove quotes
SET iDate=%iDate:"=%
SET sDate=%sDate:"=%

:: Parse today's date depending on registry's date format settings
IF %iDate%==0 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%A
	SET Day=%%B
)
IF %iDate%==1 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%C
	SET Month=%%B
	SET Day=%%A
)
IF %iDate%==2 FOR /F "TOKENS=1-4* DELIMS=%sDate%" %%A IN ('DATE/T') DO (
	SET Year=%%A
	SET Month=%%B
	SET Day=%%C
)
:: Remove the day of week if applicable
FOR %%A IN (%Year%)  DO SET Year=%%A
FOR %%A IN (%Month%) DO SET Month=%%A
FOR %%A IN (%Day%)   DO SET Day=%%A

SET ReportArchiveFolderName=%Year% %Month%
FOR /F "usebackq eol=# tokens=2,3 delims=," %%i IN ("%SPMReportListFilenameFullPath%") DO (
	"%ArchiveReportCommandFileName%" "%%i" "%%j\%ReportArchiveFolderName%"
)

pause.