@echo off

CALL "Service Start.cmd" IISAdmin
CALL "Service Start.cmd" W3SVC
REM CALL "Service Start.cmd" SMTPSVC