:FOR /F "skip=2 tokens=2,*" %%A IN ('reg.exe query "HKCU\Volatile Environment" /v "USERPROFILE"') DO set "UserPath=%%B"
: CREATE DIRECTORY
:md %UserPath%\My Documents\Arduino\tools\ArduBlockTool\tool"
: MOVE FILE
:xcopy /y "%CD%\ArduBlock\ardublock-all-201610.jar" "%UserPath%\My Documents\Arduino\tools\ArduBlockTool\tool"

:INSTALL DRIVER
cd "%CD%\CH341SER\"
start /w setup.exe /s

:: new code that installs ardublock on ALL windows profiles
cd..
UserProfileFileCopy Arduino Documents
pause
