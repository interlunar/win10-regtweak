@echo off
"%windir%\system32\lodctr.exe" /e:wsearchidxpi 
"%windir%\system32\lodctr.exe" /e:wmiaprpl
"%windir%\system32\lodctr.exe" /e:usbhub
"%windir%\system32\lodctr.exe" /e:ugthrsvc
"%windir%\system32\lodctr.exe" /e:ugatherer
"%windir%\system32\lodctr.exe" /e:termservice
"%windir%\system32\lodctr.exe" /e:tcpip
"%windir%\system32\lodctr.exe" /e:spooler
"%windir%\system32\lodctr.exe" /e:"smsvchost 5.0.0.0"
"%windir%\system32\lodctr.exe" /e:"smsvchost 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:"smsvchost 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:"servicemodelservice 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:tapisrv
"%windir%\system32\lodctr.exe" /e:"windows workflow foundation 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:"windows workflow foundation 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:"windows workflow foundation 5.0.0.0"
"%windir%\system32\lodctr.exe" /e:"servicemodeloperation 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:"servicemodeloperation 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:"servicemodelendpoint 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:"servicemodelendpoint 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:rdyboost
"%windir%\system32\lodctr.exe" /e:perfproc
"%windir%\system32\lodctr.exe" /e:perfos
"%windir%\system32\lodctr.exe" /e:perfnet
"%windir%\system32\lodctr.exe" /e:perfdisk
"%windir%\system32\lodctr.exe" /e:outlook
"%windir%\system32\lodctr.exe" /e:msscntrs
"%windir%\system32\lodctr.exe" /e:"msdtc bridge 5.0.0.0"
"%windir%\system32\lodctr.exe" /e:"msdtc bridge 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:"msdtc bridge 3.0.0.0"
"%windir%\system32\lodctr.exe" /e:msdtc
"%windir%\system32\lodctr.exe" /e:lsa
"%windir%\system32\lodctr.exe" /e:esent
"%windir%\system32\lodctr.exe" /e:remoteaccess
"%windir%\system32\lodctr.exe" /e:bits
"%windir%\system32\lodctr.exe" /e:aspnet_state
"%windir%\system32\lodctr.exe" /e:asp.net_4.0.30319
"%windir%\system32\lodctr.exe" /e:asp.net
"%windir%\system32\lodctr.exe" /e:".netframework"
"%windir%\system32\lodctr.exe" /e:".NET CLR Data"
"%windir%\system32\lodctr.exe" /e:".NET CLR Networking"
"%windir%\system32\lodctr.exe" /e:".NET CLR Networking 5.0.0.0"
"%windir%\system32\lodctr.exe" /e:".NET CLR Networking 4.0.0.0"
"%windir%\system32\lodctr.exe" /e:".NET Data Provider for Oracle"
"%windir%\system32\lodctr.exe" /e:".NET Data Provider for SqlServer"
"%windir%\system32\lodctr.exe" /e:".NET Memory Cache 4.0"
"%windir%\system32\lodctr.exe" /e:".NET Memory Cache 4.1"
echo Done! 'Standard' performance counters enabled.
echo.
echo.
echo Press any key to exit...
pause >nul