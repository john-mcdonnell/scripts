@echo off

REM CALL "Service Stop.cmd" SMTPSVC
CALL "Service Stop.cmd" W3SVC
CALL "Service Stop.cmd" IISAdmin