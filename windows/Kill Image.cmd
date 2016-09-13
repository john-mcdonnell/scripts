@ECHO OFF

SET ImageNameToKill=%~1

ECHO Killing "%ImageNameToKill%" Image Name...

taskkill /IM "%ImageNameToKill%" /F