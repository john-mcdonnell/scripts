@ECHO OFF

REM Write the log file header
ECHO ******** Cleanup Started %date%%time% ******** >>FileCleanup.log 2>&1

IF NOT EXIST %SystemRoot%\MEMORY.DMP GOTO NO_DEBUGGING_INFORMATION
ECHO. >>FileCleanup.log 2>&1
ECHO Deleting old Debugging Information ( ie. "memory dumps") created by Windows during system/program crashes..... >>FileCleanup.log 2>&1
del %SystemRoot%\MEMORY.DMP /f /s /q >>FileCleanup.log 2>&1

:NO_DEBUGGING_INFORMATION

ECHO.

ECHO. >>FileCleanup.log 2>&1
ECHO Deleting Windows Temporary Files (if any exist)..... >>FileCleanup.log 2>&1
FOR /R %temp% %%F IN (*.*) DO del "%%F" /f /s /q >>FileCleanup.log 2>&1
ECHO. >>FileCleanup.log 2>&1
ECHO Deleting Windows Temporary Directories (if any exist)..... >>FileCleanup.log 2>&1
FOR /D %%D IN (%temp%\*.*) DO rd "%%D" /s /q >>FileCleanup.log 2>&1

ECHO. >>FileCleanup.log 2>&1
ECHO Deleting ASP.NET Temporary Files (if any exist)..... >>FileCleanup.log 2>&1
FOR /R "%WINDIR%\Microsoft.NET\Framework\v1.1.4322\Temporary ASP.NET Files" %%F IN (*.*) DO del "%%F" /f /s /q >>FileCleanup.log 2>&1
ECHO. >>FileCleanup.log 2>&1
ECHO Deleting ASP.NET Temporary Directories (if any exist)..... >>FileCleanup.log 2>&1
FOR /D %%D IN ("%WINDIR%\Microsoft.NET\Framework\v1.1.4322\Temporary ASP.NET Files\*.*") DO rd "%%D" /s /q >>FileCleanup.log 2>&1

REM Write the log file footer
ECHO. >>FileCleanup.log 2>&1
ECHO ******** Cleanup Ended %date%%time% ******** >>FileCleanup.log 2>&1
ECHO. >>FileCleanup.log 2>&1
ECHO. >>FileCleanup.log 2>&1
ECHO. >>FileCleanup.log 2>&1
ECHO Please see the most recent entries in the FileCleanup.log (found in the current directory) for details of what files/folders (if any) have been deleted.
PAUSE