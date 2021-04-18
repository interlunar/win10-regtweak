@echo off
echo Uninstalling KB3021917 (Get Windows 10 preparation & telemetry for Win7)
wusa /uninstall /KB:3021917 /norestart /quiet
echo Uninstalling KB3050265 (update for "Windows Update" on Win7 Jun.2015)
wusa /uninstall /KB:3050265 /norestart /quiet
echo Uninstalling KB3035583 (Get Windows 10 for Win7sp1/8.1)
wusa /uninstall /KB:3035583 /norestart /quiet
echo Uninstalling KB2952664 (Get Windows 10 assistant)
wusa /uninstall /KB:2952664 /norestart /quiet
echo Uninstalling KB2952664 (Get Windows 10 assistant)
for /L %%i in (1,1,13) do start /w wusa.exe /uninstall /kb:2952664
echo Uninstalling KB2990214 (Get Windows 10 for Win7 without sp1)
wusa /uninstall /KB:2990214 /norestart /quiet
echo Uninstalling KB3068708 (telemetry)
wusa /uninstall /KB:3068708 /norestart /quiet
echo Uninstalling KB3022345 (telemetry & replaced the update KB3068708)
wusa /uninstall /KB:3022345 /norestart /quiet

echo Uninstalling KB3075851 (update for "Windows Update" on Win7/Server 2008R2 Aug.2015 replace KB 3065987)
wusa /uninstall /KB:3075851 /norestart /quiet
echo Uninstalling KB3045999 (MS15-038)
wusa /uninstall /KB:3045999 /norestart /quiet

echo Uninstalling KB3065987 (update for "Windows Update" on Win7/Server 2008R2 Jul.2015 KB3050265)
wusa /uninstall /KB:3065987 /norestart /quiet
echo Uninstalling KB2976978 (Get Windows 10 preparation for Win8/8.1)
wusa /uninstall /KB:2976978 /norestart /quiet

echo Uninstalling KB2919355 (ie11 for Win8.1RT/8.1/Server2012r2 Apr.2015
wusa /uninstall /KB:2919355 /norestart /quiet

echo Uninstalling KB2977759 (Get Windows 10 preparation for Win7 RTM)
wusa /uninstall /KB:2977759 /norestart /quiet

echo Uninstalling KB3075249 (telemetry for Win7/8.1)
wusa /uninstall /KB:3075249 /norestart /quiet
echo Uninstalling KB3080149 (telemetry for Win7/8.1)
start /w wusa.exe /uninstall /kb:3080149 /quiet /norestart

echo Uninstalling KB3044374 (Get Windows 10 for Win8.1)
wusa /uninstall /KB:3044374 /norestart /quiet

wusa /uninstall /KB3075851 /norestart /quiet
echo Uninstalling KB3050265 (update for "Windows Update" Group Police on Win7 Jun.2015 replace 2990214)
wusa /uninstall /kb:3050265 /norestart /quiet
echo Uninstalling KB3083324 (update for "Windows Update" on Win7sp1/Server 2008R2sp1 Sep.2015)
wusa /uninstall /kb:3083324 /norestart /quiet
echo Uninstalling KB2882822 (telemetry "ITraceRelogger" to Embedded Standard7sp1/Win7sp1/Server2008r2Sp1)
wusa /uninstall /kb:2882822 /norestart /quiet
echo Uninstalling KB3075249 (telemetry on Win8.1/RT8.1/Server2012r2/Win7sp1/Server2008r2Sp1)
wusa /uninstall /kb:3075249 /norestart /quiet
echo Uninstalling KB3083325 (update for "Windows Update" on Win8.1/Server2012r2 Sep.2015)
wusa /uninstall /kb:3083325 /quiet /norestart
echo Uninstalling KB3075853 (update for "Windows Update" on Win8.1/Server 2012R2 Aug.2015 replace KB3075851)
wusa /uninstall /kb:3075853 /quiet /norestart
echo Uninstalling KB2902907 (Microsoft Security Essentials)
wusa /uninstall /kb:2902907 /quiet /norestart
echo Uninstalling KB3068708 (telemetry "CEIP" on Win8.1/Server2012r2/Win7sp1/Server2008r2Sp1
wusa /uninstall /kb:3068708 /quiet /norestart
echo Uninstalling KB971033 (license validation)
wusa /uninstall /kb:971033 /quiet /norestart
echo Uninstalling KB2976987 (description not available)
start /w wusa.exe /uninstall /kb:2976987 /quiet /norestart
ECHO OFF
ECHO All done. Press any key to exit.

PAUSE

EXIT