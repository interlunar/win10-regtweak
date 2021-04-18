@echo off
REM Needs administratives privileges!
echo Placing your macros.doskey into your own folders.
xcopy macros.doskey %USERPROFILE% /C /-Y /W
echo Installing the registry key now.
reg add "HKCU\Software\Microsoft\Command Processor" /v Autorun /d "doskey /macrofile=\"%USERPROFILE%\macros.doskey\"" /f
echo Done!