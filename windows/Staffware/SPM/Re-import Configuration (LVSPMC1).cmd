@ECHO OFF

REM ###############################################################################################################
REM #
REM # DO NOT EDIT THIS COMMENT BLOCK. IT IS MAINTAINED AUTOMATICALLY ON CHECK-IN/CHECK-OUT BY MICROSOFT SOURCESAFE
REM # 
REM # $Revision: 2 $
REM # $Date: 21/11/05 18:58 $
REM # $Archive: /Liverpool Victoria/Staffware/SPM/Re-import Configuration (LVSPMC1).bat $
REM # 
REM ###############################################################################################################

SET PPM_CLIENT=LVSPMC1
SET SPMFolder=%PPM_HOME%
SET RecalculateKeyPerformanceIndicators=%1%EmptyStringSuffix%
SET PPMConfigLogFilename=..\log\re-import_ppmconfig.log
SET PPMImportLogFilename=..\log\re-import_ppmimport.log
SET EmptyStringSuffix=XXXXX

PUSHD %SPMFolder%\bin

ECHO Importing Shift Calendar...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -factorycalendar ..\xml\%PPM_CLIENT%FactoryCalendar.xml -overwrite -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing Shift Calendar Transformation Factors...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -transformationfactors ..\xml\%PPM_CLIENT%TransformationFactors.xml -overwrite -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing Attribute Types...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -attributetypes ..\xml\%PPM_CLIENT%AttributeTypes.xml -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing Attribute Names...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -attributenames ..\xml\%PPM_CLIENT%AttributeNames.xml -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing Key Performance Indicator and Dimension Definitions...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -keyindicator ..\xml\%PPM_CLIENT%KeyindicatorConfiguration.xml -overwrite -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing User Defined Key Performance Indicators...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -onlinekis ..\xml\%PPM_CLIENT%OnlineKIConfiguration.xml -overwrite -protocolfile %PPMConfigLogFilename%

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO If no Errors or Warnings have been reported in the "%PPMConfigLogFilename%" file, press any key to continue, otherwise press CTRL-C to stop the installation...
PAUSE.

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Importing Process Tree...
@ECHO ON
CALL %SPMFolder%\bin\runppmconfig -user system -password manager -client %PPM_CLIENT% -mode import -processtree ..\xml\%PPM_CLIENT%ProcessTree.xml -protocolfile %PPMConfigLogFilename%

@ECHO OFF
IF NOT %RecalculateKeyPerformanceIndicators%%EmptyStringSuffix% == Y%EmptyStringSuffix% GOTO SKIP_KEY_PERFORMANCE_INDICATOR_RECALCULATION

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO If you do not wish to continue, press CTRL-C, otherwise press any key...
PAUSE.

@ECHO OFF
POPD
CALL "Re-calculate Key Performace Indicators (LVSPMC1).cmd"
PUSHD %SPMFolder%\bin

:SKIP_KEY_PERFORMANCE_INDICATOR_RECALCULATION

@ECHO OFF
ECHO.
ECHO.
ECHO.
ECHO.
ECHO Delete and Re-create Dimension Indicies...
@ECHO ON
CALL %PPM_HOME%\bin\runppmimport -user system -password manager -client %PPM_CLIENT% -index new -protocolfile %PPMImportLogFilename%

@ECHO OFF
REM ECHO.
REM ECHO.
REM ECHO.
REM ECHO.
REM ECHO Merger, Typify and Calculate Key Performance Indicator values for each Process Instance...
REM @ECHO ON
REM CALL %PPM_HOME%\bin\runppmimport -user system -password manager -client %PPM_CLIENT% -protocolfile %PPMImportLogFilename%

@ECHO OFF

ECHO.
ECHO.
ECHO.
ECHO.
ECHO SEE "%SPMFolder%\bin\%PPMConfigLogFilename%" and "%SPMFolder%\bin\%PPMImportLogFilename%" LOG FILES FOR FULL DETAILS

POPD

PAUSE.