The following tweaks are not needed anymore:
-------------------

* PowerShell.exe Set-NetTCPSettings -Settings internet -AutoTuningLevelLocal normal (default: normal)
* PowerShell.exe Set-NetTCPSettings -Settings internet -ScalingHeuristics disabled (default: default, based on hardware) 
* netsh int tcp set supplemental internet congestionprovider=ctcp (default: driver usually uses ctcp already)
* netsh int tcp set global rsc=enabled (default: default, based on hardware but handled by OS)
* netsh int tcp set global rss=enabled (default: default, based on hardware but handled by OS)
* PowerShell.exe Disable-NetAdapterLso - Name * (Large Send Offload can be controlled by the Driver itself + it's Advance Options based on needs)
* PowerShell.exe Enable-NetAdapterChecksumOffload - Name * (Checksum Offload can be controlled by the Driver itself + it's Advance Options based on needs)
* MaxConnectionsPer_0Server affects only explorer.exe + iexplorer.exe (Default 4) RFC 2616
* MaxConnectionsPerServer affects only explorer.exe + iexplorer.exe (Default 2) RFC 2616
* Toggling the Windows Game Mode status (Windows 1803+).


### Priority tweaks

This is handled internally now by the OS. 
```
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider 
"Class"=dword:00000008
"DnsPriority"=dword:00000006
"HostsPriority"=dword:00000005
"LocalPriority"=dword:00000004
"NetbtPriority"=dword:00000007
```


### Only until <= Windows 7
* MaxNegativeCacheTtl
* NegativeCacheTime
* NetFailureCacheTime
* NegativeSOACacheTime
* Disabling Nagle's Algorithm (Windows 10 uses a more efficient algorithm called "CUBIC" and "NewReno")

