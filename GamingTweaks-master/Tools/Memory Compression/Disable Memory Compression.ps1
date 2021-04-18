#Requires -RunAsAdministrator

# Disable Memory Compression
Disable-MMAgent -mc

# Get current Compresion Status 
#Get-MMAgent

# Kill Sysmain if present (former Superfetch)
Get-Service "SysMain" | Set-Service -StartupType Disabled -PassThru | Stop-Service
