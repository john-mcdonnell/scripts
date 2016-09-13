@ECHO OFF
:: Delims is a TAB followed by a space
FOR /F "TOKENS=2* DELIMS=	 " %%A IN ('REG QUERY "HKEY_CURRENT_USER\Control Panel\International\sTime"') DO SET sTime=%%B
ECHO HKEY_CURRENT_USER\Control Panel\International\sTime=%sTime%
