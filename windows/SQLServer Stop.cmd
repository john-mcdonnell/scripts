@echo off

CALL "Service Stop.cmd" MSDTC
CALL "Service Stop.cmd" SQLSERVERAGENT
CALL "Service Stop.cmd" MSSQLSERVER
CALL "Service Stop.cmd" SQLBrowser
CALL "Service Stop.cmd" SQLWriter
CALL "Service Stop.cmd" MSSQL$SQLEXPRESS