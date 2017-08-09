@echo off
cls

:main
cls
echo ==================================================
echo = This script is intended for academic use only. =
echo ==================================================
echo Select option:
echo [1] Local Machine information
echo [2] Exit
set /p operation=Option: 
if %operation%==1 (call :local) else (if %operation%==2 (call :exit) else (call :main))
EXIT /B 0

:local
cls
echo ==================================
echo = Local Machine Information Menu =
echo ==================================
echo Select an option below:
echo [1] Name, Date and Time
echo [2] DNS Cache
echo [3] System Information
echo [4] Machine SID
echo [5] Back
set /p operation=Option:  
if %operation%==1 goto local_name_date_time
if %operation%==2 goto local_dns
if %operation%==3 goto local_system_information
if %operation%==4 goto local_SID
if %operation%==5 goto main

:local_name_date_time
cls
echo =============================
echo = Menu: Name, Date and Time =
echo =============================
set /p operation=Write the destination file name: 
echo "PC Host Name" > %operation%.txt
CALL hostname>> %operation%.txt
echo "System date" >> %operation%.txt
date /T >> %operation%.txt
echo "System hour" >> %operation%.txt
time /T >> %operation%.txt
goto local

:local_dns
cls
echo ===================
echo = Menu: DNS Cache =
echo ===================
set /p operation=Write the destination file name: 
echo "DNS Cache Information" > %operation%.txt
ipconfig /displaydns >> %operation%.txt
goto local

:local_system_information
cls
echo ============================
echo = Menu: System Information =
echo ============================
set /p operation=Write the destination file name: 
echo "System Information" > %operation%.txt
psinfo >> %operation%.txt
goto begin
