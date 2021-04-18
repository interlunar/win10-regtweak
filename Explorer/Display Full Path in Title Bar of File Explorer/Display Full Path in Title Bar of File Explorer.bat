@echo off

REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /V FullPath /T REG_DWORD /D 1 /F

taskkill /f /im explorer.exe
start explorer.exe