@echo off

SET CommandFilename="Database Delete All Case Data.sql"
SET CommandOutputFilename="Database Delete All Case Data.out"

IF EXIST %CommandOutputFilename% del %CommandOutputFilename%

osql -w 1000 -S (local) -E -d casedata -i %CommandFilename% -o %CommandOutputFilename%

start notepad %CommandOutputFilename%