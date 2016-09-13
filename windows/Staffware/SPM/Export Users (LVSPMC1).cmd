@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin
SET SPMDataFile=%SPMBinFolder%\Users.xml

ECHO Exporting SPM Users to the '%SPMDataFile%' Data File.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMBinFolder%
START "Exporting SPM Users to the '%SPMDataFile%' Data File....." /wait runppmconfig -user system -password manager -client %PPM_CLIENT% -users %SPMDataFile% -mode export
POPD

PAUSE.