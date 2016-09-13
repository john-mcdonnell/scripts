REM @ECHO OFF

REM ###############################################################################################################
REM #
REM # DO NOT EDIT THIS COMMENT BLOCK. IT IS MAINTAINED AUTOMATICALLY ON CHECK-IN/CHECK-OUT BY MICROSOFT SOURCESAFE
REM # 
REM # $Revision: 1 $
REM # $Date: 27/01/05 15:14 $
REM # $Archive: /Liverpool Victoria/Staffware/Shutdown/Filter List.cmd $
REM # 
REM ###############################################################################################################

SET ListFilename=%~1
SET FilterString=%~2
SET TemporaryListFilename=%~n1_TEMP%~x1
SET GrepProgramFilename=%PROGRAMFILES%\Resource Kit\QGREP.EXE

IF EXIST "%GrepProgramFilename%" GOTO GREP_PROGRAM_FILENAME_FOUND
ECHO "%GrepProgramFilename%" not found.
GOTO CRITICAL_ERROR
:GREP_PROGRAM_FILENAME_FOUND

IF EXIST "%TemporaryListFilename%" DEL /F "%TemporaryListFilename%"

ECHO.
ECHO Filtering list file "%ListFilename%" for string "%FilterString%"...
"%GrepProgramFilename%" "%FilterString%" "%ListFilename%">"%TemporaryListFilename%"

DEL "%ListFilename%"
REN "%TemporaryListFilename%" "%ListFilename%"

:CRITICAL_ERROR