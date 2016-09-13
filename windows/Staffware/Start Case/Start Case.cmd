@ECHO OFF

SET StaffwareFolder=D:\swserver
SET ABOXFilename=%CD%\ABOX.abox
SET StaffwareNodeFolder=%StaffwareFolder%\lvswpredev
SET StaffwareBinFolder=%StaffwareFolder%\lvswpredev\Bin
SET StaffwareSWUtilProgramFilename=%StaffwareFolder%\lvswpredev\Bin\swutil.exe

PUSHD %StaffwareBinFolder%
"%StaffwareSWUtilProgramFilename%" DCSTART LPMGEN01 "John McDonnell Test Case" "%ABOXFilename%"
POPD

PAUSE.
