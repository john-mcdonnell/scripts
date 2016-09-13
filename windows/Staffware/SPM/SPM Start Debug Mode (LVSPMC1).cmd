@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMBinFolder=%SPMFolder%\bin

ECHO Starting SPM in Debug Mode.....
ECHO.
ECHO.
ECHO.
pushd %SPMBinFolder%
START "SPM RMI" runppmregistry.bat
START "SPM 3.1(0.0)" runppmserver_%PPM_CLIENT%.bat

popd