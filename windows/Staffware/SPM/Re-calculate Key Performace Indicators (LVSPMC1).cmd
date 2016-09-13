@ECHO OFF

REM ###############################################################################################################
REM #
REM # DO NOT EDIT THIS COMMENT BLOCK. IT IS MAINTAINED AUTOMATICALLY ON CHECK-IN/CHECK-OUT BY MICROSOFT SOURCESAFE
REM # 
REM # $Revision: 2 $
REM # $Date: 22/06/06 14:25 $
REM # $Archive: /Liverpool Victoria/Staffware/SPM/SPM/xml/Re-calculate Key Performace Indicators (LVSPMC1).cmd $
REM # 
REM ###############################################################################################################

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET PPMImportLogFilename=..\log\re-import_ppmimport.log

PUSHD %SPMFolder%\bin

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Re-calculating Key Performance Indicator values...
ECHO.
ECHO Re-calculating Key Performance Indicator values started at %date% %time%
ECHO.
@ECHO ON
CALL %PPM_HOME%\bin\runppmimport -user system -password manager -client %PPM_CLIENT% -keyindicator new -protocolfile %PPMImportLogFilename%
@ECHO OFF
ECHO.
ECHO Re-calculating Key Performance Indicator values ended at %date% %time%
ECHO.

POPD

PAUSE.