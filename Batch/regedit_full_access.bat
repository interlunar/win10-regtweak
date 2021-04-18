@echo off
::needs PsExec.exe from Sysinternals Suite
Start "" "C:\Program Files (x86)\Sysinternals Suite\PsExec.exe" -a -i -d -s C:\Windows\regedit.exe
