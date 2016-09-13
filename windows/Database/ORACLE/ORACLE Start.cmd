@echo off

SET ServiceStartProgramFilename="..\Service Start.cmd"

CALL %ServiceStartProgramFilename% OracleMTSRecoveryService
CALL %ServiceStartProgramFilename% OracleOraHome92Agent
CALL %ServiceStartProgramFilename% OracleOraHome92HTTPServer
CALL %ServiceStartProgramFilename% OracleOraHome92TNSListener
CALL %ServiceStartProgramFilename% OracleServiceOEMREP
CALL %ServiceStartProgramFilename% OracleServiceORACLE92

PAUSE.