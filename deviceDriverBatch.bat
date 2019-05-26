FOR /F "skip=2 tokens=2,*" %%A IN ('reg.exe query "HKCU\Volatile Environment" /v "USERPROFILE"') DO set "UserPath=%%B"
ECHO New variable UserPath = %UserPath%

: CREATE DIRECTORY
md "%UserPath%\My Documents\Arduino\tools\ArduBlockTool\tool"

: MOVE FILE
xcopy /y "%CD%\ArduBlock\ardublock-all-201610.jar" "%UserPath%\My Documents\Arduino\tools\ArduBlockTool\tool"

: INSTALL DRIVER
cd "%CD%\CH341SER\"
setup /s