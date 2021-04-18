@echo off
::===============================================================================================================
title Windows 7 - 10 spyware KB remover
::===============================================================================================================
:: GET ADMIN RIGHTS
::(NET FILE||(powershell -command Start-Process '%0' -Verb runAs -ArgumentList '%* '&EXIT /B))>NUL 2>&1
::===============================================================================================================
:: General SYNTAX
::wmic qfe get "HotFixID" /format:table
::wmic qfe list brief /format:texttablewsys >"%Path_of_the_text_file%"
::wusa.exe /kb:%HotfixId% /uninstall /quiet /norestart
::===============================================================================================================

::Delete KB2976978 (telemetry for Win8/8.1)

start /w wusa.exe /uninstall /kb:2976978 /quiet /norestart

::Delete KB3075249 (telemetry for Win7/8.1)
::This update adds telemetry points to the User Account Control (UAC) feature in order to collect data on elevations that come from low integrity levels.

start /w wusa.exe /uninstall /kb:3075249 /quiet /norestart

::Delete KB3080149 (telemetry for Win7/8.1)
::This package updates the Diagnostics and Telemetry tracking service to existing devices.

start /w wusa.exe /uninstall /kb:3080149 /quiet /norestart

::Delete KB3021917 (telemetry for Win7)

start /w wusa.exe /uninstall /kb:3021917 /quiet /norestart

::Delete KB3022345 (telemetry)
::(replaced by KB3068708) – This update adds the Diagnostics and Telemetry tracking service to in-market devices.

start /w wusa.exe /uninstall /kb:3022345 /quiet /norestart

::Delete KB3068708 (telemetry)
::This update introduces the Diagnostics and Telemetry tracking service to existing devices.

start /w wusa.exe /uninstall /kb:3068708 /quiet /norestart

::Delete KB3083324 (telemetry)
::This update introduces the Diagnostics and Telemetry tracking service to existing devices.

start /w wusa.exe /uninstall /kb:KB3083324 /quiet /norestart

::Delete KB3044374 (Get Windows 10 for Win8.1)

start /w wusa.exe /uninstall /kb:3044374 /quiet /norestart

::Delete KB3035583 (Get Windows 10 for Win7sp1/8.1)

start /w wusa.exe /uninstall /kb:3035583 /quiet /norestart

::Delete KB2990214 (Get Windows 10 for Win7 without sp1)

start /w wusa.exe /uninstall /kb:2990214 /quiet /norestart

::Delete KB2990214 (Get Windows 10 for Win7)

start /w wusa.exe /uninstall /kb:2990214 /quiet /norestart

::Delete KB2952664 (Get Windows 10 assistant)

start /w wusa.exe /uninstall /kb:2952664 /quiet /norestart

::Delete KB3075853 (update for "Windows Update" on Win8.1/Server 2012R2)

start /w wusa.exe /uninstall /kb:3075853 /quiet /norestart

::Delete KB3065987 (update for "Windows Update" on Win7/Server 2008R2)

start /w wusa.exe /uninstall /kb:3065987 /quiet /norestart

::Delete KB3050265 (update for "Windows Update" on Win7)

start /w wusa.exe /uninstall /kb:3050265 /quiet /norestart

::Delete KB3075851 (update for "Windows Update" on Win7)

start /w wusa.exe /uninstall /kb:971033 /quiet /norestart

::Delete KB2902907 (description is not available)

start /w wusa.exe /uninstall /kb:2902907 /quiet /norestart

::===============================================================================================================
:: Do this as bath process
for %%a in (
KB2976978
KB3075249
KB3080149
KB3021917
KB3022345
KB3068708
KB3044374
KB2902907
KB3035583
KB2990214
KB2952664
KB3075853
KB3065987
KB3050265
KB971033
KB2902907
KB3083324

) do start "" /w wusa /uninstall /kb:%%a /passive /norestart
