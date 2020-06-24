@echo on
set LOGFILE=batch.log
call :LOG > %LOGFILE%
exit /B

:LOG

title Barnabas Ardublock Install For Windows
echo Version 1.5

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%
echo Current time is %mydate%:%mytime%

wmic os get osarchitecture
:: start at root
CD \
:: if 32 bit on 64 arch (x86) folder should exist
IF EXIST "Program Files (x86)"\ ( cd "Program Files (x86)") ELSE ( cd "Program Files")
CD "Barnabas Robotics"\"Barnabas Robotics Software and Drivers"
:: install driver
CD CH341SER
START /w setup.exe /s
CD .. 

: Create libraries and tools folders
set LIBPATH=Documents\Arduino\libraries
set ARDUPATH=Documents\Arduino\tools\ArdublockTool\tool

: Copy Ardublock file and libraries for all windows users (including subdirectories)
for /d %%a in (C:\Users\*) do (

    @echo:
    echo Copying files for %%a
    @echo: 

    IF NOT EXIST "%%a\%LIBPATH%" (
        md "%%a\%LIBPATH%"
    )
    IF NOT EXIST "%%a\%ARDUPATH%" (
        md "%%a\%ARDUPATH%"
    )
    
    xcopy /y %CD%\libraries\* "%%a\%LIBPATH%" /s /i
    xcopy /y %CD%\tools\ArduBlockTool\tool\* "%%a\%ARDUPATH%" /s /i
)