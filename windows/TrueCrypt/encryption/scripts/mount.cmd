REM @ECHO OFF

PUSHD ..\..

SET TRUECRYPT_FOLDER_NAME=%CD%\Encryption\truecrypt\windows
SET TRUECRYPT_PROGRAM_NAME=%TRUECRYPT_FOLDER_NAME%\TrueCrypt.exe
SET CONTAINER_FILENAME=%CD%\file

REM Get the password.
REM SET /P PASSWORD=Please enter the password: 

ECHO Using TrueCrypt Executable "%TRUECRYPT_PROGRAM_NAME%"...

ECHO Mounting "%CONTAINER_FILENAME%"...

START /WAIT "Mounting..." "%TRUECRYPT_PROGRAM_NAME%" "%CONTAINER_FILENAME%" /lx /a /e /b /q 2>&1

POPD