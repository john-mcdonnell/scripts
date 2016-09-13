@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin
SET SPMDataFile=%SPMBinFolder%\%PPM_CLIENT%ProcessTree.xml

ECHO Exporting SPM Process Tree to the '%SPMDataFile%' Data File.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMBinFolder%
START "Exporting Process Tree to the '%SPMDataFile%' Data File....." /wait runppmconfig -client %PPM_CLIENT% -user system -password manager -mode export -processtree "%SPMDataFile%"
POPD
PAUSE.