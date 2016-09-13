@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolderName=%PPM_HOME%
SET SPMBinFolder=%SPMFolderName%\bin
SET SPMDataFiles=%SPMFolderName%\Data\Imported\*.xml
SET SPMLogFolderName=%SPMFolderName%\log

ECHO Importing "%SPMDataFiles%" Data Files.....
ECHO.
ECHO.
ECHO.

IF EXIST "%SPMDataFiles%" GOTO FILES_FOUND
ECHO "%SPMDataFiles%" files not found.
GOTO EXIT
:FILES_FOUND

PUSHD %SPMBinFolder%
START "Importing '%SPMDataFiles%' Data Files....." /wait runxmlimport -client %PPM_CLIENT% -user system -password manager -i %SPMDataFiles% -protocolfile %SPMLogFolderName%\xmlimport.txt
START "Completing Import of Data Files....." /wait runppmimport -client %PPM_CLIENT% -user system -password manager -protocolfile %SPMLogFolderName%\ppmimport.txt
POPD

:EXIT
PAUSE.