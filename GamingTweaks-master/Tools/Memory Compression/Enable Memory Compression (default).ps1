#Requires -RunAsAdministrator

# Disable Memory Compression
Enable-MMAgent -mc

# Get current Compresion Status 
#Get-MMAgent

# Kill Sysmain if present (former Superfetch)
Get-Service "SysMain" | Set-Service -StartupType Enabled -PassThru | Start-Service
