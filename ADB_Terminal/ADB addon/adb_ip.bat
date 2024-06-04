@echo off
cd "%SystemDrive%\platform-tools"
title ADB Wireless

REM Check if ADB server is running
tasklist | findstr /i "adb.exe" > nul
if %errorlevel% equ 0 (
    echo ADB server is running, restarting it...
    adb kill-server
    adb start-server
    echo ADB server restarted.
) else (
    echo ADB server is not running, starting it...
    adb start-server
    echo ADB server started.
)

echo Please enter the IP address of the Android device:
set /p ip_address=
adb connect %ip_address%
pause