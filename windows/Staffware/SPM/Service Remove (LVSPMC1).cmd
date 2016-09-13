@ECHO OFF

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
sSET SPMConfigFolderName=%SPMFolder%\config
SET SPMClientConfigFolderName=%SPMConfigFolderName%\%PPM_CLIENT%

ECHO Removing SPM Windows Service.....
ECHO.
ECHO.
ECHO.

PUSHD %SPMConfigFolderName%
jsl -remove
POPD

PUSHD %SPMClientConfigFolderName%
jsl -remove
POPD

PAUSE.

