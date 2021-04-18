@echo off
:: Enable DNS Client
sc config dnscache start= auto
:: Start DNS Client
net start dnscache
:: Exit batch file
exit