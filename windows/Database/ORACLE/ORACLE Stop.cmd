@echo off

SET ServiceStopProgramFilename="..\Service Stop.cmd"

CALL %ServiceStopProgramFilename% OracleMTSRecoveryService
CALL %ServiceStopProgramFilename% OracleOraHome92Agent
CALL %ServiceStopProgramFilename% OracleOraHome92HTTPServer
CALL %ServiceStopProgramFilename% OracleOraHome92TNSListener
CALL %ServiceStopProgramFilename% OracleServiceOEMREP
CALL %ServiceStopProgramFilename% OracleServiceORACLE92

PAUSE.