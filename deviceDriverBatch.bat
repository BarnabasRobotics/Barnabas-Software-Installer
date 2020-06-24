@echo off
set LOGFILE=deviceDriverBatch.log
call :LOG > %LOGFILE%
exit /B

:LOG

title Barnabas Ardublock Install For Windows
echo Version 1.5

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo Current time is %mydate%:%mytime%

: start at root
cd \

:if 32 bit on 64 arch (x86) folder should exist
IF EXIST "Program Files (x86)"\ ( set INSTALLPATH="Program Files (x86)\Barnabas Robotics\Barnabas Robotics Software and Drivers") ELSE ( INSTALLPATH="Program Files\Barnabas Robotics\Barnabas Robotics Software and Drivers")

echo Installer directory is: %INSTALLPATH%

cd %INSTALLPATH%

: install driver
cd CH341SER
START /w setup.exe /s
cd .. 

echo Installing libraries....

set DEST=Documents\Arduino\libraries
set SRC=Arduino\libraries

FOR /f "tokens=*" %%G in ('dir /b /a:d-s-l "%SystemDrive%\Users"') DO (
  IF /I NOT "%%G"=="Public" (

    echo Copying Files For: %%G

    IF NOT EXIST "%SystemDrive%\Users\%%G\%DEST%" md "%SystemDrive%\Users\%%G\%DEST%"

    xcopy.exe "%~dp0%SRC%" "%SystemDrive%\Users\%%G\%DEST%" /E /C /I /Q /H /R /K /Y
  )
)

echo Installing Ardublock folder....

set DEST=Documents\Arduino\tools
set SRC=Arduino\tools

FOR /f "tokens=*" %%G in ('dir /b /a:d-s-l "%SystemDrive%\Users"') DO (
  IF /I NOT "%%G"=="Public" (

    echo Copying Files For: %%G

    : remove old versions of ardublock
    IF EXIST "%SystemDrive%\Users\%%G\%DEST%" rmdir "%SystemDrive%\Users\%%G\%DEST%" /s /q

    IF NOT EXIST "%SystemDrive%\Users\%%G\%DEST%" md "%SystemDrive%\Users\%%G\%DEST%"
     
    xcopy.exe "%~dp0%SRC%" "%SystemDrive%\Users\%%G\%DEST%" /E /C /I /Q /H /R /K /Y
  )
)


