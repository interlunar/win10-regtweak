@echo off
rem Windows 10 migration uninstall
start /w wusa.exe /uninstall /kb:3021917
for /L %%i in (1,1,6) do start /w wusa.exe /uninstall /kb:3035583
start /w wusa.exe /uninstall /kb:2990214
start /w wusa.exe /uninstall /kb:3050265
start /w wusa.exe /uninstall /kb:3065987
start /w wusa.exe /uninstall /kb:3075851
start /w wusa.exe /uninstall /kb:3083324
start /w wusa.exe /uninstall /kb:3083710
start /w wusa.exe /uninstall /kb:3102810
start /w wusa.exe /uninstall /kb:3112343
for /L %%i in (1,1,16) do start /w wusa.exe /uninstall /kb:2952664
start /w wusa.exe /uninstall /kb:2977759
start /w wusa.exe /uninstall /kb:3135445
start /w wusa.exe /uninstall /kb:3123862
rem Telemetry service uninstall
start /w wusa.exe /uninstall /kb:2882822
start /w wusa.exe /uninstall /kb:3022345
start /w wusa.exe /uninstall /kb:3068708
start /w wusa.exe /uninstall /kb:3080149
start /w wusa.exe /uninstall /kb:3075249
start /w wusa.exe /uninstall /kb:3081954 