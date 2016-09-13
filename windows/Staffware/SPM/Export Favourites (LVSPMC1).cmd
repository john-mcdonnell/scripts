@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin
SET SPMDataFile=%SPMBinFolder%\%PPM_CLIENT%_favourites.xml

ECHO Exporting SPM Users to the '%SPMDataFile%' Data File.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMBinFolder%
START "Exporting Favourites to the '%SPMDataFile%' Data File....." /wait runppmconfig -client %PPM_CLIENT% -user system -password manager -mode export -favorites "%SPMDataFile%"
POPD
PAUSE.