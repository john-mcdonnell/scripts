@echo off

SET CommandFilename="Database List User Tables.sql"
SET CommandOutputFilename="Database List User Tables.out"

IF EXIST %CommandOutputFilename% del %CommandOutputFilename%

osql -w 1000 -S (local) -E -d SPM3100 -i %CommandFilename% -o %CommandOutputFilename%

start notepad %CommandOutputFilename%