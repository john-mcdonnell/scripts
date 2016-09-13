@ECHO OFF

REM The "ssh=plink.exe" entry must be in the "%appdata%\Subversion\config" file, and 
REM pageant must be logged into the user and host below, in order for this to work.

SET configuration_item=%~1

REM plink -agent -load john@weblog.mcdonnell.org.uk
REM set SVN_SSH=plink.exe

ECHO You must provide the FULL LOCAL PATH to the file being saved i.e. p:\cvs\project\myfile.zip.
ECHO.
ECHO Adding changes to "%configuration_item%" Configuration Item (CI)...
svn add %configuration_item%
ECHO Committing changes to "%configuration_item%" Configuration Item (CI)...
svn commit %configuration_item% --message ""

PAUSE.