@ECHO OFF

SET StartupFolder=D:\Staffware\staffw_nod1\bin

%windir%\System32\runas.exe /user:swadmin "cmd /k pushd %StartupFolder%"