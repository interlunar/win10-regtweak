::Execute as Admin
takeown /F C:\Windows.old\* /R /A
pause
cacls C:\Windows.old\*.* /T /grant administrators:F
pause
rmdir /S /Q C:\Windows.old\
pause