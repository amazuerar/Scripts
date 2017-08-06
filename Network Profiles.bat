@echo off 

call :main
EXIT /B %ERRORLEVEL%

:main
cls
echo ====================================================
echo = This script is intended for academic use only.   =
echo ====================================================
echo "These are the Wi-fi profiles on this machine... (The operation takes a few seconds)"
netsh wlan show profile
echo "[1] If you want to export the entire information, press 1 then the Enter key"
echo "[2] If you want to export a single profile, press 2 then the Enter key"
echo "[3] Exit"
set /p id="Option: "
if %id%==1 (call :export_all) else (if %id%==2 (call :export_single) else (if %id%==3 (goto exit) else (call :main)))
EXIT /B 0

:export_all
netsh wlan export profile key=clear folder=%cd%
echo "Profiles exportation succeed"
pause
EXIT /B 0

:export_single
echo "Write below the profile you desire to export"
set /p pro="Profile name: "
netsh wlan export profile name=%pro% key=clear %cd%
pause
EXIT /B 0
