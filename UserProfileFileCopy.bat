@ECHO OFF
FOR /f "tokens=*" %%G in ('dir /b /a:d-s-l "%SystemDrive%\Users"') DO (
  IF /I NOT "%%G"=="Public" (
    IF NOT EXIST "%SystemDrive%\Users\%%G\%~2\%~1" md "%SystemDrive%\Users\%%G\%~2\%~1"
    xcopy.exe "%~dp0%~1" "%SystemDrive%\Users\%%G\%~2\%~1" /E /C /I /Q /H /R /K /Y
  )
)