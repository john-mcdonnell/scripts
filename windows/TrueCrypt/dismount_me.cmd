@ECHO OFF

PUSHD "%CD%\encryption\scripts\"

CALL dismount.cmd 2>&1

POPD

PAUSE.

REM EXIT