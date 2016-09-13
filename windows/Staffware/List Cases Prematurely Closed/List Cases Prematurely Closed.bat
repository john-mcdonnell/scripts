@ECHO OFF

SET ProcedureName=LPMGEN01
SET StaffwareNodeName=lvsw_n1
SET StaffwareNodeFolder=D:\swserver\%StaffwareNodeName%
SET StaffwareNodeUtilFolder=%StaffwareNodeFolder%\util
SET StaffwarePListProgramFilename=%StaffwareNodeUtilFolder%\plist.exe
SET AuditTrailListFileName=%CD%\%ProcedureName%.txt
SET FilterListProgramFilename=Filter List.cmd
SET ActiveTaskFilterString=Term Premswadmin@%StaffwareNodeName%
REM SET ActiveTaskFilterString=Rules generated globalsEAI Call-Out InitiatedEAI_SRM
SET WindowsNotepadProgramFilename=notepad.exe

CALL "%StaffwarePListProgramFilename%" -a %ProcedureName% 106 -x > "%AuditTrailListFileName%"

CALL "%FilterListProgramFilename%" "%AuditTrailListFileName%" "%ActiveTaskFilterString%"

ECHO.
ECHO.
ECHO Opening "%AuditTrailListFileName%" in "%WindowsNotepadProgramFilename%"
"%WindowsNotepadProgramFilename%" "%AuditTrailListFileName%"