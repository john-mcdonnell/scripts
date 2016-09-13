@echo off

SET CommandFilename="Drop All User Tables.sql"
SET CommandOutputFilename="Drop All User Tables.out"

IF EXIST %CommandOutputFilename% del %CommandOutputFilename%

osql -w 1000 -S (local) -E -d SPM3100 -i %CommandFilename% -o %CommandOutputFilename%

START /wait notepad %CommandOutputFilename%


EXIT