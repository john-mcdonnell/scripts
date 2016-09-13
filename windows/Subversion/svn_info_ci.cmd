@ECHO OFF

REM The "ssh=plink.exe" entry must be in the "%appdata%\Subversion\config" file, and 
REM pageant must be logged into the user and host below, in order for this to work.

SET user_and_host=john@weblog.mcdonnell.org.uk
SET configuration_item=%~1

REM plink -agent -load john@weblog.mcdonnell.org.uk
REM set SVN_SSH=plink.exe

ECHO Getting information about "%user_and_host%%configuration_item%" Configuration Item (CI)...
svn info svn+ssh://%user_and_host%/svn%configuration_item%

PAUSE.