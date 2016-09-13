@echo off

SET CommandFilename="DeleteALLImportData.sql"
SET CommandOutputFilename="DeleteALLImportData.out"

IF EXIST %CommandOutputFilename% del %CommandOutputFilename%

osql -w 1000 -S 168.185.5.241 -U sa -P password -d workware -i %CommandFilename% -o %CommandOutputFilename%

start notepad %CommandOutputFilename%