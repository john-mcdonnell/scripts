@echo off

SET CommandFilename="Database List Document Types.sql"
SET CommandOutputFilename="Database List Document Types.out"

IF EXIST %CommandOutputFilename% del %CommandOutputFilename%

osql -w 1000 -S (local) -E -d casedata -i %CommandFilename% -o %CommandOutputFilename%

start notepad %CommandOutputFilename%