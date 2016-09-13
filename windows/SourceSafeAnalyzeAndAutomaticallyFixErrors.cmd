@echo off

SET SorceSafeAnalyzeProgramFilename="%programfiles%\Microsoft Visual Studio\Common\VSS\win32\analyze.exe"
SET SorceSafeDataPath=%programfiles%\Microsoft Visual Studio\Common\VSS\Data
SET SorceSafeCorruptedFilesList="%CD%\SourceSafeAnalyzeCleanAndCompress"
SET SorceSafeCorruptedFilesList="%SorceSafeDataPath%\backup\"

IF EXIST %SorceSafeCorruptedFilesList% rd /S /Q %SorceSafeCorruptedFilesList%

%SorceSafeAnalyzeProgramFilename% -F "%SorceSafeDataPath%"

IF NOT EXIST "%CD%\SourceSafeAnalyzeCleanAndCompress" GOTO CORRUPTEDFILELISTFOLDERDOESNOTEXISTS
rd /S /Q "%CD%\SourceSafeAnalyzeCleanAndCompress"
:CORRUPTEDFILELISTFOLDERDOESNOTEXISTS