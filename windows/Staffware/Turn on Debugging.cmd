@ECHO OFF

SET StartupFolder=D:\Staffware\staffw_nod1\util

REM swadm show_servers ->> machine_id
%StartupFolder%\swadm set_attribute 1 spo 0 debug ALL=255,q=57,F=7,TIME=ABS,FLAGS=U,TID=1
REM swadm delete_attribute 1 spo 0 debug

pause.