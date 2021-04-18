@echo off

REG Delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoPropertiesRecycleBin /F

REG Delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /V NoPropertiesRecycleBin /F

taskkill /f /im explorer.exe
start explorer.exe