@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET SPMConfigFolderName=%SPMFolder%\config
SET SPMClientConfigFolderName=%SPMConfigFolderName%\%PPM_CLIENT%

ECHO Installing SPM Windows Service.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMConfigFolderName%
jsl -install
POPD

PUSHD %SPMClientConfigFolderName%
jsl -install
POPD

PAUSE.

