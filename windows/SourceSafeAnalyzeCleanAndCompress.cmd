@echo off

SET SorceSafeAnalyzeProgramFilename="%programfiles%\Microsoft Visual Studio\Common\VSS\win32\analyze.exe"
SET SorceSafeDataPath="%programfiles%\Microsoft Visual Studio\Common\VSS\Data"
SET SorceSafeCorruptedFilesList="%CD%\SourceSafeAnalyzeCleanAndCompress"

IF EXIST "%CD%\SourceSafeAnalyzeCleanAndCompress" rd /S /Q "%CD%\SourceSafeAnalyzeCleanAndCompress"
md "%CD%\SourceSafeAnalyzeCleanAndCompress"

%SorceSafeAnalyzeProgramFilename% -B%SorceSafeCorruptedFilesList% -C -D -v4 %SorceSafeDataPath%