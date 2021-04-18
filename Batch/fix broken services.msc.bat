@Echo Off & Cls

::   Check if batch script executed with administrators privilege. 
Call  :IsAdmin

:: Check version of the Windows OS.
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows XP" >Nul
If Not Errorlevel 1 ( 
Goto Win_XP
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows Vista" >Nul
If Not Errorlevel 1 ( 
Goto Win_Vista
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 7" >Nul
If Not Errorlevel 1 (
Goto Win_7
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 8" >Nul
If Not Errorlevel 1 (
Goto Win_8
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 8.1" >Nul
If Not Errorlevel 1 (
Goto Win_8_1
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 10" >Nul
If Not Errorlevel 1 (
Goto Win_10
) Else (	
Goto NotSupported	
) ) ) ) ) )



:: Restore Windows services to default settings.
:Win_10
sc config AJRouter start= demand
sc config ALG start= demand
sc config AppHostSvc start= Auto
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config aspnet_state start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config BthHFSrv start= demand
sc config bthserv start= demand
sc config c2wts start= demand
sc config CDPSvc start= demand
sc config CertPropSvc start= demand
sc config ClipSVC start= demand
sc config COMSysApp start= demand
sc config CoreMessagingRegistrar start= Auto
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config DcpSvc start= demand
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config DevQueryBroker start= demand
sc config Dhcp start= Auto
sc config diagnosticshub.standardcollector.service start= demand
sc config DiagTrack start= Auto
sc config DmEnrollmentSvc start= demand
sc config dmwappushservice start= Auto
sc config Dnscache start= Auto
sc config DoSvc start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsRoleSvc start= demand
sc config DsSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config embeddedmode start= demand
sc config EntAppSvc start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config ftpsvc start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config HvHost start= Auto
sc config icssvc start= demand
sc config IEEtwCollectorService start= demand
sc config IISADMIN start= Auto
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config iprip start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config LicenseManager start= demand
sc config lltdsvc start= demand
sc config lmhosts start= demand
sc config LPDSVC start= Auto
sc config LSM start= Auto
sc config MapsBroker start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MSMQ start= Auto
sc config MSMQTriggers start= Auto
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config NetMsmqActivator start= Auto
sc config NetPipeActivator start= Auto
sc config netprofm start= demand
sc config NetSetupSvc start= demand
sc config NetTcpActivator start= Auto
sc config NetTcpPortSharing start= demand
sc config NgcCtnrSvc start= demand
sc config NgcSvc start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RetailDemo start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensorDataService start= demand
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= demand
sc config ShellHWDetection start= Auto
sc config simptcp start= Auto
sc config smphost start= demand
sc config SmsRouter start= demand
sc config SNMP start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config StateRepository start= demand
sc config stisvc start= demand
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config tiledatamodelsvc start= Auto
sc config TimeBroker start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UserManager start= Auto
sc config UsoSvc start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvmsession start= demand
sc config vmicvss start= demand
sc config vmms start= Auto
sc config vmvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config w3logsvc start= demand
sc config W3SVC start= Auto
sc config WalletService start= demand
sc config WAS start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config Wms start= Auto
sc config WmsRepair start= Auto
sc config WMSVC start= demand
sc config workfolderssvc start= demand
sc config WPDBusEnum start= demand
sc config WpnService start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= Auto
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxNetApiSvc start= demand

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title  - Finnish -
Echo.
Echo.
Echo    Windows Services  Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b

:Win_8_1
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppHostSvc start= Auto
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config aspnet_state start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config BthHFSrv start= demand
sc config bthserv start= demand
sc config c2wts start= demand
sc config CertPropSvc start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config Dhcp start= Auto
sc config diagtrack start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsRoleSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config ehRecvr start= demand
sc config ehSched start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config ftpsvc start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config IEEtwCollectorService start= demand
sc config IISADMIN start= Auto
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config iprip start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config LPDSVC start= Auto
sc config LSM start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MsKeyboardFilter start= Disabled
sc config MSMQ start= Auto
sc config MSMQTriggers start= Auto
sc config napagent start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config NetMsmqActivator start= Auto
sc config NetPipeActivator start= Auto
sc config netprofm start= demand
sc config NetTcpActivator start= Auto
sc config NetTcpPortSharing start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config simptcp start= Auto
sc config smphost start= demand
sc config SNMP start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= demand
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= demand
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TimeBroker start= demand
sc config TlntSvr start= Disabled
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvss start= demand
sc config vmvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config w3logsvc start= demand
sc config W3SVC start= Auto
sc config WAS start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WMSVC start= demand
sc config workfolderssvc start= demand
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= Auto

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title  - Finnish -
Echo.
Echo.
Echo    Windows Services  Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b


:Win_8
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppHostSvc start= Auto
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config aspnet_state start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config BthHFSrv start= demand
sc config bthserv start= demand
sc config c2wts start= demand
sc config CertPropSvc start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config Dhcp start= Auto
sc config diagtrack start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsRoleSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config ehRecvr start= demand
sc config ehSched start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config ftpsvc start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config IEEtwCollectorService start= demand
sc config IISADMIN start= Auto
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config iprip start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config LPDSVC start= Auto
sc config LSM start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MsKeyboardFilter start= Disabled
sc config MSMQ start= Auto
sc config MSMQTriggers start= Auto
sc config napagent start= demand
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config NetMsmqActivator start= Auto
sc config NetPipeActivator start= Auto
sc config netprofm start= demand
sc config NetTcpActivator start= Auto
sc config NetTcpPortSharing start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config simptcp start= Auto
sc config smphost start= demand
sc config SNMP start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= demand
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= demand
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TimeBroker start= demand
sc config TlntSvr start= Disabled
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvss start= demand
sc config vmvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config w3logsvc start= demand
sc config W3SVC start= Auto
sc config WAS start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WMSVC start= demand
sc config workfolderssvc start= demand
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= Auto

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title  - Finnish -
Echo.
Echo.
Echo    Windows Services  Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b


:Win_7
sc config AeLookupSvc start= demand
sc config ALG start= demand
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AudioEndpointBuilder start= Auto
sc config AudioSrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config Browser start= demand
sc config bthserv start= demand
sc config CertPropSvc start= demand
sc config clr_optimization_v2.0.50727_32 start= Auto
sc config clr_optimization_v2.0.50727_64 start= Auto
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= Auto
sc config DcomLaunch start= Auto
sc config defragsvc start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config EapHost start= demand
sc config EFS start= demand
sc config ehRecvr start= Auto
sc config ehSched start= Auto
sc config eventlog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= Auto
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config idsvc start= demand
sc config IKEEXT start= Auto
sc config IPBusEnum start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config napagent start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= demand
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= Auto
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config ProfSvc start= Auto
sc config ProtectedStorage start= demand
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config sppuinotify start= demand
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config swprv start= demand
sc config SysMain start= Auto
sc config TabletInputService start= demand
sc config TapiSrv start= demand
sc config TBS start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UxSms start= Auto
sc config VaultSvc start= demand
sc config vds start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config Wlansvc start= Auto
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WPCSvc start= demand
sc config WPDBusEnum start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config wuauserv start= Auto
sc config wudfsvc start= demand
sc config WwanSvc start= Auto

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title  - Finnish -
Echo.
Echo.
Echo    Windows Services  Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b


:Win_Vista
sc config AeLookupSvc start= Auto
sc config ALG start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AudioEndpointBuilder start= Auto
sc config AudioSrv start= Auto
sc config BFE start= Auto
sc config BITS start= Auto
sc config Browser start= Auto
sc config CertPropSvc start= demand
sc config clr_optimization_v2.0.50727_32 start= demand
sc config clr_optimization_v2.0.50727_64 start= demand
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config CscService start= Auto
sc config DcomLaunch start= Auto
sc config DFSR start= demand
sc config Dhcp start= Auto
sc config Dnscache start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config EapHost start= demand
sc config ehRecvr start= Auto
sc config ehSched start= Auto
sc config ehstart start= Auto
sc config EMDMgmt start= Auto
sc config Eventlog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= Auto
sc config FontCache3.0.0.0 start= demand
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config hkmsvc start= demand
sc config idsvc start= demand
sc config IKEEXT start= Auto
sc config IPBusEnum start= demand
sc config iphlpsvc start= Auto
sc config KeyIso start= demand
sc config KtmRm start= Auto
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lltdsvc start= demand
sc config lmhosts start= Auto
sc config Mcx2Svc start= Disabled
sc config MMCSS start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config napagent start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config netprofm start= Auto
sc config NetTcpPortSharing start= Disabled
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= Auto
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= Auto
sc config ProfSvc start= Auto
sc config ProtectedStorage start= demand
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= demand
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= Auto
sc config SENS start= Auto
sc config SessionEnv start= demand
sc config SharedAccess start= Disabled
sc config ShellHWDetection start= Auto
sc config slsvc start= Auto
sc config SLUINotify start= demand
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config stisvc start= Auto
sc config swprv start= demand
sc config SysMain start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TBS start= Auto
sc config TermService start= Auto
sc config Themes start= Auto
sc config THREADORDER start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= Auto
sc config UxSms start= Auto
sc config vds start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config wbengine start= demand
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WebClient start= Auto
sc config Wecsvc start= demand
sc config wercplsupport start= demand
sc config WerSvc start= Auto
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config Wlansvc start= Auto
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config WPCSvc start= demand
sc config WPDBusEnum start= Auto
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config wuauserv start= Auto
sc config wudfsvc start= demand

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title  - Finnish -
Echo.
Echo.
Echo    Windows Services  Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b

:Win_XP
sc config Alerter start= Disabled
sc config ALG start= demand
sc config AppMgmt start= demand
sc config AudioSrv start= Auto
sc config BITS start= demand
sc config Browser start= Auto
sc config CiSvc start= demand
sc config ClipSrv start= Disabled
sc config COMSysApp start= demand
sc config CryptSvc start= Auto
sc config DcomLaunch start= Auto
sc config Dhcp start= Auto
sc config dmadmin start= demand
sc config dmserver start= Auto
sc config Dnscache start= Auto
sc config Dot3svc start= demand
sc config EapHost start= demand
sc config ERSvc start= Auto
sc config Eventlog start= Auto
sc config EventSystem start= demand
sc config FastUserSwitchingCompatibility start= demand
sc config helpsvc start= Auto
sc config HidServ start= Disabled
sc config hkmsvc start= demand
sc config HTTPFilter start= demand
sc config ImapiService start= demand
sc config LanmanServer start= Auto
sc config lanmanworkstation start= Auto
sc config LmHosts start= Auto
sc config Messenger start= Disabled
sc config mnmsrvc start= demand
sc config MSDTC start= demand
sc config MSIServer start= demand
sc config napagent start= demand
sc config NetDDE start= Disabled
sc config NetDDEdsdm start= Disabled
sc config Netlogon start= Auto
sc config Netman start= demand
sc config Nla start= demand
sc config NtLmSsp start= demand
sc config NtmsSvc start= demand
sc config PlugPlay start= Auto
sc config PolicyAgent start= Auto
sc config ProtectedStorage start= Auto
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RDSessMgr start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config RSVP start= demand
sc config SamSs start= Auto
sc config SCardSvr start= demand
sc config Schedule start= Auto
sc config seclogon start= Auto
sc config SENS start= Auto
sc config SharedAccess start= Auto
sc config ShellHWDetection start= Auto
sc config Spooler start= Auto
sc config srservice start= Auto
sc config SSDPSRV start= demand
sc config stisvc start= Auto
sc config SwPrv start= demand
sc config SysmonLog start= demand
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config TlntSvr start= Disabled
sc config TrkWks start= Auto
sc config upnphost start= demand
sc config UPS start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config WebClient start= Auto
sc config winmgmt start= Auto
sc config WmdmPmSN start= demand
sc config Wmi start= demand
sc config WmiApSrv start= demand
sc config wscsvc start= Auto
sc config wuauserv start= Auto
sc config WZCSVC start= Auto
sc config xmlprov start= demand

Cls & Mode CON  LINES=5 COLS=48 & Color 0B & Title Created By FreeBooter 
Echo.
Echo.
Echo    Windows Services Defult Settings Restored
Ping  -n  10  localhost > Nul
Exit  /b


:NotSupported	
Cls
Cls & Mode CON  LINES=5 COLS=48 & Color 0C & Title   -  Not Supported  -
Echo.
Echo      OPERATING SYSTEM IS NOT SUPPORTED
ping -n 10  localhost > Nul
Exit  /b


:: Check if batch script executed with administrators privilege. 
:IsAdmin
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Mode CON  LINES=5 COLS=48 & Color 0C & Title - WARNING -
 Echo.
 Echo. 
 Echo  YOU MUST HAVE ADMINISTRATOR RIGHTS TO CONTINUE 
 Pause >Nul & Exit
)
Cls
Goto :EOF