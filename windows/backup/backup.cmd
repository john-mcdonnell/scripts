@ECHO OFF

setlocal EnableDelayedExpansion

CALL "%~dp0\env.cmd" "%~1" "%~2"

SET SCRIPT_FILE=%~n0
SET SOURCE_TO_BACKUP_FOLDER=%~dp1
SET SOURCE_TO_BACKUP_FILE=%~nx1

::Display help only.
IF "%HELP_ONLY%"=="1" GOTO HELP

ECHO.
ECHO.
ECHO.

ECHO SCRIPT_FILE:%SCRIPT_FILE%.
ECHO SOURCE_TO_BACKUP_FOLDER:%SOURCE_TO_BACKUP_FOLDER%.
ECHO SOURCE_TO_BACKUP_FILE:%SOURCE_TO_BACKUP_FILE%.

TITLE %SCRIPT_FILE%

CALL %SCRIPT_FOLDER%\is-directory.cmd "%BACKUP_FOLDER%"
SET RETURN_CODE=%errorlevel%

ECHO.
ECHO.
ECHO.

ECHO RETURN_CODE:%RETURN_CODE%.

::1 is a directory. 2 is a file. 3 is unknown file or directory.
IF %RETURN_CODE%==2 (
	ECHO.
	ECHO.
	ECHO.

	ECHO The backup destination "%BACKUP_FOLDER%" is a file instead of a folder.
	
	GOTO EXIT
)

IF NOT EXIST "%BACKUP_FOLDER%" (
	ECHO.
	ECHO.
	ECHO.

	ECHO Creating the folder "%BACKUP_FOLDER%"...
	MKDIR "%BACKUP_FOLDER%"
)

CALL %SCRIPT_FOLDER%\is-directory.cmd "%SOURCE_TO_BACKUP%"
SET RETURN_CODE=%errorlevel%

ECHO.
ECHO.
ECHO.

ECHO RETURN_CODE:%RETURN_CODE%.

::1 is a directory. 2 is a file. 3 is unknown file or directory.
IF %RETURN_CODE%==1 (
	ECHO.
	ECHO.
	ECHO.

	ECHO Backing up the directory "%SOURCE_TO_BACKUP%" to "%ARCHIVE_FILE%"...
	%BACKUP_PROGRAM% "%ARCHIVE_FILE%" "%SOURCE_TO_BACKUP%"
) ELSE IF %RETURN_CODE%==2 (
	ECHO.
	ECHO.
	ECHO.

	ECHO Backing up the file "%SOURCE_TO_BACKUP%" to "%ARCHIVE_FILE%"...
	%BACKUP_PROGRAM% "%ARCHIVE_FILE%" "%SOURCE_TO_BACKUP%"
) ELSE IF %RETURN_CODE%==3 (
	ECHO.
	ECHO.
	ECHO.

	ECHO ERROR: Unknown file or directory "%SOURCE_TO_BACKUP%".
	GOTO EXIT
) ELSE (
	ECHO.
	ECHO.
	ECHO.

	ECHO ERROR: Unknown return code "%RETURN_CODE%".
	GOTO EXIT
)

GOTO EXIT

:HELP

ECHO Backup a file or directory (including subdirectories) to a TAR archive file.
ECHO.
ECHO Usage: %SCRIPT_FILE% [File or Directory] [Directory to write TAR to]
ECHO If no parameters are specified, the parent directory of the directory containing the script "%~nx0" (i.e. currently %SOURCE_TO_BACKUP%) will be backed up to a directoy called "%BACKUP_FOLDER_NAME%" on the same drive as the script (i.e. currently "%BACKUP_FOLDER%").
ECHO.
ECHO Examples:
ECHO    %~nx0
ECHO    %~nx0 c:\myfolder
ECHO    %~nx0 c:\myfolder d:\mybackup-files
:EXIT

ECHO.
ECHO.
ECHO.

IF _%INTERACTIVE%_==_0_ PAUSE

EXIT /B