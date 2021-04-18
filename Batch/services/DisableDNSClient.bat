@echo off
:: Stop DNS Client
net stop dnscache
:: Disable DNS Client
sc config dnscache start= disabled
:: Exit batch file
exit