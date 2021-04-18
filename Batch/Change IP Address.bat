@echo off
ipconfig /flushdns
ipconfig /release
netsh interface ip set address "Local Area Connection" static 1.1.1.1 255.0.0.0 192.168.0.1 1
netsh interface set interface "Local Area Connection" disable
netsh interface ip set dns "Local Area Connection" dhcp
netsh interface ip set address "Local Area Connection" dhcp
echo Wait 1 minute...
ping -n 60 -w 1000 0.0.0.1 > nul
netsh interface set interface "Local Area Connection" enable