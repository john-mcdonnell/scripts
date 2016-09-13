@ECHO OFF

SET DefragmentationProgramFilename="defrag.exe"
SET DefragmentationLogFilename="DefragmentDrive.log"

SET HeaderDescription=Defragmention of Drive "%1" Started %DATE% @%TIME%
ECHO %HeaderDescription% >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
%DefragmentationProgramFilename% %1 -f -v >> %DefragmentationLogFilename%

ECHO. >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
SET FooterDescription=Defragmention of Drive "%1" Finished %DATE% @%TIME%
ECHO %FooterDescription% >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
ECHO ******************************************************************************** >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%
ECHO. >> %DefragmentationLogFilename%