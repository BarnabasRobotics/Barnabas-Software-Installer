@ECHO OFF 
TITLE Barnabas Driver and ArduBlock

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
:: copy ardublock
UserProfileFileCopy Arduino Documents
PAUSE