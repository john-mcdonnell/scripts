@ECHO OFF
:: Delims is a TAB followed by a space
FOR /F "TOKENS=2* DELIMS=	 " %%A IN ('REG QUERY "HKEY_CURRENT_USER\Control Panel\International\iTime"') DO SET iTime=%%B
ECHO HKEY_CURRENT_USER\Control Panel\International\iTime=%iTime%
