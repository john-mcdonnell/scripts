@echo off

CALL "Service Start.cmd" MSSQLSERVER
CALL "Service Start.cmd" SQLSERVERAGENT
CALL "Service Start.cmd" MSDTC
CALL "Service Start.cmd" MSSQL$SQLEXPRESS
CALL "Service Start.cmd" SQLBrowser
CALL "Service Start.cmd" SQLWriter