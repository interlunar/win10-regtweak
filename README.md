#PROCEED AT YOUR OWN RISK, I AM NOT RESPONSIBLE FOR ANYTHING. MAKE SURE YOU READ THE FILES(.REG,.PS1,ETC B4 EXECUTING ) .
Bunch of configurations to optimize Windows10
# Network Configuration
## Operating System Specific Configuration
   * Ensure **Network Throttling Index feature is enabled**
     * **Recommendation:** Set a value between **10 and 20 decimal**, e.g. 15mbps-30mbps
     ```HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\NetworkThrottlingIndex``` 
     * See [research on Network Throttling Index](../../RESEARCH/NETWORK/README.md#networkthrottlingindex) and the impacts on NDIS DPC processing latency.
   * **Use a network adapter that supports Message-Signaled Interrupts (MSI/MSI-X)**
     * Most modern network adapters and associated driver configuration files define the use of MSI out of the box, when this is enabled it allows both the interrupt service routines and deferred procedure calls to be allocated to the same CPU cores allowing for better processing efficiency and improved performance.
     * To determine if Windows recognizes your adapter as RSS and MSI-X capable use the following commands, if identified as capable windows will allocate ISR/DPCs to CPU/Cores as specified by the RSS Base and Max core configuration discussed in the next step.
       ``` 
       As administrator run the following commands in powershell.exe
       
       > Get-NetAdapterHardwareInfo | fl
       Name                        : Ethernet 2
       InterfaceDescription        : Intel(R) Gigabit CT Desktop Adapter
       [...]
       LineBasedInterruptSupported : True
       MsiInterruptSupported       : True
       MsiXInterruptSupported      : True
       
       > Get-SmbClientNetworkInterface
       Interface Index RSS Capable RDMA Capable Speed  IpAddresses    Friendly Name
       --------------- ----------- ------------ -----  -----------    -------------
       14              True        False        1 Gbps {192.168.0.3} Ethernet 2
       ```
     * See the [Technical References](../../TECHNICAL%20REFERENCES/README.md) page articles under **Microsoft Windows > Networking** regarding RSS, and RSS with Message Signaled Interrupts. You can also validate this optimization is working not only via performance increase but that the NDIS work is being locked to the predefined CPU cores with tools such as xperf.
   * Consider **binding your Receive Side Scaling (RSS) queue workloads to one or more CPUs**, assuming you have MSI/MSI-X enabled as noted above.
     * There has been notable NDIS DPC latency processing improvements observed (xperf isr/dpc latency analysis) through binding your RSS queues to specific cores. By default Windows primarily allocates much of the process and thread work to Core 0 of your CPU so there may be added benefit moving that workload to less used cores.
     * **Recommendation:** If you have a 4 core CPU, try binding RSS queues to cores 2 and 3 (3rd and 4th core)
     ``` 
         Run the following commands using powershell.exe as administrator
         Get-NetAdapterRSS
             Make note of the name associated with the network adapter e.g. Ethernet
         Set-NetAdapterRSS -Name "Ethernet" -BaseProcessorNumber 2
             Bind the RSS base core value to core 2 (3rd core), if you have 2 RSS queues
             enabled this should allocate work to 3rd and 4th core.
     ```
   * Disable NetBIOS over TCP in Network Adapter IPV4 settings to disable unnecessary SYSTEM listening service
     * **Network & Internet Settings > Change Adapter Options > Adapter Properties > Select TCP/IP v4 > Advanced > WINS tab > Disable NetBIOS over TCP/IP > Press OK**
     * Note: This change is immediate, and also listed in Post Install section but here for completeness.

## Intel Network Adapter Settings
*Offloading* features allows the network card to handle certain functions of the packet handling process reducing the overall cpu consumption, ideally allowing more cpu time for other tasks and your games.

- **Adaptive Inter-Frame Spacing**
   - Disabled
- **Flow Control**
   - Disabled
- **Interrupt Moderation and Moderation Rate**
   - My personal recommendation is to set this to *Medium* or leave it on *Adaptive* (default)
     * Try medium for a week or more then consider changing it if you believe something to be wrong from a network perspective.
     * A Medium interrupt moderataion value provided an acceptable DPC/ISR latency during both fully loaded 1Gbps TCP network simulation and also UDP communications during real world scenarios and during iperf tests which matched the traffic characteristics of the simulated games, Counter-Strike CS:GO and CS 1.6.
     * Many will recommend turning interrupt moderation off (including this one originally) however the increased interrupt rate can impact the users experience (perceived input response) during higher load where there is a combined use of realtime audio, gpu workloads, application and OS dependant cpu usage, usb device input and network throughput. If the intended performance measurement was not primarily reliant on user input response and stricly network/cpu based workload then having interrupt moderataion off would likely be ideal for lowest possible latency.
   - See [Research](../../RESEARCH/README.md#intel-interrupt-moderation)
- **IPv4 Checksum Offload**
   - RX & TX Enabled
- **Jumbo Packet**
   - Disabled
- **Large Send Offload V2 (IPv4)**
   - Disabled
- **Large Send Offload V2 (IPv6)**
   - Disabled
- **Receive Side Scaling**
   - Enabled
- **Maximum Number of RSS Queues**
   - N Queues, Use 2 or more queues when available.
- **Packet Priority & VLAN**
   - Both Enabled
- **Receive Buffers**
   - Increase if you have extra memory to spare, *recommended 1024 or higher.*
   - A lower value will results in dropped packets and decreased performance however a higher value could result in increased buffering during certain workloads, as per Microsoft's Performance Tuning Network Adapters guide.
     - Monitor your dropped packet rates during gameplay and adjust if necessary, a *slightly* higher value from the default should not result in increased buffering unless the traffic conditions reduce the rate at which data can be transmitted, often due to high load or congestion.
- **Transmit Buffers**
   - Increase if you have extra memory to spare, *recommended 1024 or higher.*
   - A lower value will results in dropped packets and decreased performance however a higher value could result in increased buffering during certain workloads, as per Microsoft's Performance Tuning Network Adapters guide
     - Monitor your dropped packet rates during gameplay and adjust if necessary, a *slightly* higher value from the default should not result in increased buffering unless the traffic conditions reduce the rate at which data can be transmitted, often due to high load or congestion.
- **TCP Checksum Offload (IPv4)**
   - Enabled
- **TCP Checksum Offload (IPv6)**
   - Enabled
- **UDP Checksum Offload (IPv4)**
   - Enabled
- **UDP Checksum Offload (IPv6)**
   - Enabled
- **Power Saving Options**
   - Disable all power saving options in drivers and for the adapter, more options are available in the latest Intel drivers sets.

For more information on these settings see the **Intel** and the **Microsoft Performance Tuning Network Adapters, Performance Tuning for Low Latency Packet Processing** support guides in the **Network** section of the [Technical References](../../TECHNICAL%20REFERENCES/README.md) page.

## Realtek Network Adapter Settings
Realtek adapters and their drivers have shown to have worst DPC/ISR latency even after optimizations as noted in the Intel section above, however the Intel recommended settings above still apply to Realtek adapters. Will update this section and related settings if further research and evidence is accumulated to show otherwise.

### SSD

Setting `fsutil behavior set disablelastaccess 1` still needs to be set manually. There is research on this available [here](https://translate.google.com/translate?hl=en&sl=ja&u=http://blog.livedoor.jp/nichepcgamer/archives/1071061265.html&prev=search).

### TRIM

Since Windows 10, the OS usually checks the [TRIM](https://en.wikipedia.org/wiki/Trim_(computing)) status on his own, but in order to verify it simply run `fsutil behavior query DisableDeleteNotify`. If TRIM is running it will return `DisableDeleteNotify=0` or `DisableDeleteNotify=1` if TRIM is not functioning.

### Disk Defragmentation

You  don't need to disable the internal Disk defragmentation program, it detects which kind of storage you use and start/stop the progress on it's own. There was a Bug with >1607 Builds to detect it, but was fixed later by Microsoft. There is no benefit disabling the schedule (Hibernation) via `powercfg -h off`.

### Enable Write Caching for SSDs

Write caching can theoretically improve performance of both SSDs & HDDs. It's usually enabled by default.

### Write-cache Buffer Flushing

Using this is not recommended in case of a power failure you might loose your data.

### Disable Prefetch and Superfetch

SuperFetch (SysMain) indexes your SSD/HDD which means when you search for certain things, the results are showing up faster (in theory). If you use search utilities like [Everything](https://www.voidtools.com/downloads/) you don't need such function.


```bash
EnablePrefetcher (DWORD value doesn't exist by default and to disable it the value must be 0)
EnableSuperfetch (DWORD value defaults to 3, to disable = 0)
HKEY_LOCAL_MACHINE\Current\ControlSet\Control\Session Manager\Memory Management\PrefetchParameters
```

In Windows RS 5 Build 1809 the service is renamed to SysMain (under services.msc). I could not notice any performance difference but [some people reporting that some application might crashing leaving this service enabled](https://www.tenforums.com/general-support/118718-no-superfetch-service-1809-a-post1477496.html?s=eef7013da02a202c620d0f84ec73f88f#post1477496).


### Optimize or Disable Page File for SSDs

Tweaking this is a myth, the OS and some applications handle it (if needed). Some games/applications can [crash if you disable it entirely](https://lifehacker.com/understanding-the-windows-pagefile-and-why-you-shouldnt-5426041).


### Update Drivers and Firmware

This is maybe the best advice you can find because this [not only closes possible security holes](https://techcrunch.com/2018/11/05/crucial-samsung-solid-state-drives-busted-encryption/) it might fixes performance issues. The rest can be covered by observing [S.M.A.R.T](https://en.wikipedia.org/wiki/S.M.A.R.T.) with a simple check (Windows internal tools or external ones) in order to check the health.
## Post Installation Steps

1. In **Windows Device Manager** (devmgmt.msc) go to **Network adapters** and right click each and go to properties, then Power Management and **uncheck Allow the computer to turn off this device to save power**.
2. Disable NetBIOS over TCP in Network Adapter IPV4 settings to disable unnecessary SYSTEM listening service
   * **Network & Internet Settings > Change Adapter Options > Adapter Properties > Select TCP/IP v4 > Advanced > WINS tab > Disable NetBIOS over TCP/IP > Press OK**
   * Note: This change is immediate
3. Right click the desktop and go to Display Settings, ensure that Scale and layout are set to 100% (Recommended)
4. **Add exclusions to Windows Defender**
   - Open **Windows Security** and go to **Virus and Threat Protection > Virus and Threat Protection Settings > Exclusions** and be sure to add each of your games as as **full paths to the executable** vs just using executable name to ensure ideal security with least impact during gameplay. e.g. *D:\Steam Games\steamapps\common\Half-Life\hl.exe vs just hl.exe*
   - Open Powershell as admin and enter the following command to add scanning exclusions for the Steam, NVIDIA Shader Cache folder and Microsoft's recommendations for exclusions to Windows Defender. See [Technical References](../../TECHNICAL%20REFERENCES/README.md) for more information on Microsoft's recommendations.
   - This will help reduce the time spent scanning by Windows Defender as new files are downloaded and those used during gameplay (e.g. textures, sounds).

      ```
      Add-MpPreference -ExclusionPath ${env:ProgramFiles(x86)}"\Steam\"
      Add-MpPreference -ExclusionPath $env:LOCALAPPDATA"\Temp\NVIDIA Corporation\NV_Cache"
      Add-MpPreference -ExclusionPath $env:PROGRAMDATA"\NVIDIA Corporation\NV_Cache"
      Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Datastore.edb"
      Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb*.jrs"
      Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Edb.chk"
      Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\Tmp.edb"
      Add-MpPreference -ExclusionPath $env:windir"\SoftwareDistribution\Datastore\Logs\*.log"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.edb"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.sdb"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.log"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.chk"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.jrs"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.xml"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.csv"
      Add-MpPreference -ExclusionPath $env:windir"\Security\Database\*.cmtx"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.pol"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\GroupPolicy\Machine\Registry.tmp"
      Add-MpPreference -ExclusionPath $env:userprofile"\NTUser.dat"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.log"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.dat"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\sru\*.chk"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\MetaConfig.mof"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\winevt\Logs\*.evtx"
      Add-MpPreference -ExclusionPath $env:windir"\apppatch\sysmain.sdb"
      Add-MpPreference -ExclusionPath $env:windir"\EventLog\Data\lastalive?.dat"
      Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\WPRUI.exe"
      Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Windows Kits\10\Windows Performance Toolkit\wpa.exe"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\WindowsPowerShell\v1.0\Modules"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCStatusHistory.mof"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCEngineCache.mof"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\DSCResourceStateCache.mof"
      Add-MpPreference -ExclusionPath $env:SystemRoot"\System32\Configuration\ConfigurationStatus"
      Add-MpPreference -ExclusionProcess ${env:ProgramFiles(x86)}"\Common Files\Steam\SteamService.exe"
      ```

5. Uninstall common Windows Store Metro Apps, In Powershell as admin run the following commands and press enter so they complete.

      ```
      Get-AppxPackage *print3d* | Remove-AppxPackage
      Get-AppxPackage *3dviewer* | Remove-AppxPackage
      Get-AppxPackage *zune* | Remove-AppxPackage
      Get-AppxPackage *minecraft* | Remove-AppxPackage
      Get-AppxPackage *bing* | Remove-AppxPackage
      Get-AppxPackage *skype* | Remove-AppxPackage
      Get-AppxPackage *solitaire* | Remove-AppxPackage
      Get-AppxPackage *candycrush* | Remove-AppxPackage
      Get-AppxPackage *netflix* | Remove-AppxPackage
      Get-AppxPackage *onenote* | Remove-AppxPackage
      Get-AppxPackage *dolby* | Remove-AppxPackage
      Get-AppxPackage *fitbit* | Remove-AppxPackage
      Get-AppxPackage *feedback* | Remove-AppxPackage
      Get-AppxPackage *yourphone* | Remove-AppxPackage
      ```

6. Open CMD.exe (Command Prompt) as administrator and run this command to uninstall Microsoft OneDrive
`%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall`
7. Install any necessary drivers such as Chipset drives provided by your manufacturer for your motherboard. **(Not videocard drivers, this will be done later)**
   - Check Windows Device Manager for clues as to which drivers may not be present or working, devices under System generally refer to Chipset or Management Systems (Intel Management Engine)
   - It is often recommended to use the drivers provided by your motherboard manufacturer since they may include additional optimizations for your specific hardware.
   - For the most part you may not need to install the latest audio or network drivers unless you notice issues with them in the future. The drivers that windows installs automatically are generally well tested or approved.
8. Avoid installing any uncessary software
9. Run **Process Idle Tasks** then while it's running open task manager and monitor the progress. The CPU, disk and memory use will increase for a few minutes until all the necessary background, scheduled and maintenenace tasks are complete.

      ```
      Open cmd.exe as administrator then enter the following command
      Rundll32.exe advapi32.dll,ProcessIdleTasks
      ```

10. **Don't modify Windows BOOT options using BCDEDIT.exe**, although they have the **potential** to alter your computing experience they are intended for advanced software debugging. The default BOOT options are recommended by Microsoft.
11. If you have an SSD ensure TRIM is enabled and run regularly, TRIM allows proper maintenance of unused space on SSDs after files have been deleted.
    - Check and enable TRIM windows feature, use the following commands using cmd.exe as administrator to check if the feature is enabled. It should return Disabled (0) if the feature is active.
         
         ```
         fsutil behavior query Disabledeletenotify
         fsutil behavior set DisableDeleteNotify 0
         ```
       
    - Increase the frequency TRIM is run for your SSD drive
      - Open My Computer
      - Right click your drive (e.g. C:) and go to properties, go to the Tools tab then Optimize
      - Press Change Settings, ensure Scheduled Optimization is enabled and set to **Daily** for each of your drives
      - Press the Drives button to double check each drive is specified for maintenance
      - Press OK/Apply for each of the open windows to submit the changes.
12. Optimize NTFS file system parameters to reduce updates to some of the metadata that is tracked.
    - Disable additional updates to directory last access times
    - Disables the creation of legacy 8.3 character-length file names on FAT- and NTFS-formatted volumes.
    
         ```
         Run the following commands using cmd.exe as administrator, requires restart to take effect
         fsutil behavior set disableLastAccess 1
         fsutil behavior set disable8dot3 1
         ```
13. Enable the Ultimate Performance power scheme which is intended to be an improved version of the High Performance power scheme.
    * As per [Technical References](../../TECHNICAL%20REFERENCES/README.md), *This new policy builds on the current High-Performance policy, and it goes a step further to eliminate micro-latencies associated with fine grained power management techniques.*
    * Remember **if you use the provided Desired State Configuration (DSC)** script with this guide and plan to use the new power scheme, **you'll need to edit the DSC to enforce the new ultimate performance power scheme** vs the high performance power scheme.
         ```
         Run the following commands using cmd.exe as administrator
         powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
         Go to Windows power options and enable Ultimate Performance power plan.
         ```
14. Reconnect your network ethernet cable, continue onto the next process.

Reference:

* [https://www.howtogeek.com/256859/dont-waste-time-optimizing-your-ssd-windows-knows-what-its-doing/](https://www.howtogeek.com/256859/dont-waste-time-optimizing-your-ssd-windows-knows-what-its-doing/)
* [Why disable SuperFetch on ssd, if RAM is much faster than ssd?](https://answers.microsoft.com/en-us/windows/forum/all/why-disable-superfetch-on-ssd-if-ram-is-much/61b6b215-0f27-473b-9490-b8b297899ac7)

https://www.back2gaming.com/guides/how-to-tweak-windows-10-for-gaming/ < decent guide to eliminate misc input lag from gpu,cpu,ram,usb etc\ https://forums.guru3d.com/threads/windows-line-based-vs-message-signaled-based-interrupts-msi-tool.378044/  https://pastebin.com/raw/1twn8geB  https://www.autoitscript.com/forum/topic/144234-_regenumkeyvalex-_regenumkeyex-_regenumvalex/  https://www.reddit.com/r/Amd/comments/ax4838/attention_display_port_users_i_might_have_a/ei77ttx/
VOC4B
 — 
03/11/2021
https://translate.google.com/translate?sl=auto&tl=en&u=https://www.hardwareluxx.de/community/threads/die-ultimative-hardwareluxx-samsung-8gb-b-die-liste-alle-hersteller-13-12-20.1161530/ https://www.reddit.com/r/overclocking/comments/hpqsfc/txp_the_underrated_memory_timing/

https://translate.google.com/translate?sl=auto&tl=en&u=https://www.hardwareluxx.de/community/threads/die-ultimative-hardwareluxx-samsung-8gb-b-die-liste-alle-hersteller-13-12-20.1161530/ https://www.reddit.com/r/overclocking/comments/hpqsfc/txp_the_underrated_memory_timing/  
# OS-independent
regedit tweak win10
The following _known issues_ are currently present in Windows 1903 (May Update '19). 


Before you submit any bug or feature request I expect that you read this document in order to get a short overview of what is broken and what can be manually fixed or needs an update (file changes). 

The overview is provided 'as is' and is not designed to explain every little _fart_, it's more designed to show quickly what are the 'urgent' things which are (as time of writing) considerably broken or needing a fix by Microsoft.


## Windows 10 Builds Overview

| Version |        Code name        |     Marketing name     | Build | Removed features |
| :-----: | ----------------------- | ---------------------- | :---: |  ---------------------- |
|  1507 (Jul. 2015) | Threshold 1 (TH1)       | Threshold 1 (Version 1) | 10240 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1511 (Nov 2015)  | Threshold 2 (TH2)       | November Update        | 10586 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1607 (Jul. 2016)  | Redstone 1 (RS1)        | Anniversary Update     | 14393 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1703 (Apr. 2017)  | Redstone 2 (RS2)        | Creators Update        | 15063 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1709 (Oct. 2018)  | Redstone 3 (RS3)        | Fall Creators Update   | 16299 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1803 (Apr. 2018)  | Redstone 4 (RS4)        | April 2018 Update      | 17134 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) | 
|  1809 (Oct. 2018)  | Redstone 5 (RS5)        | October 2018 Update    | 17763 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) | 
|  1903 (May 2019)  | 19H1                    | May 2019 Update      | 18362.30 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  1909 (Nov. 2019)  | 19H2                    |  November Update    |  18363.418 | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1909-removed-features) |
|  // (2004)  | 20H1 (Vibranium)                    |   //     |  //    | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |
|  //   | 20H2 (Manganese)                  |  //      | //   | [Here](https://docs.microsoft.com/en-us/windows/deployment/planning/windows-10-1903-removed-features) |


### I can't upgrade my OS I get the "This PC can't update to Windows 10" error message
* Download the [AppRPS.zip](https://aka.ms/AppRPS) and extract the `appraiser.bat` (right-click on it and run it as admin).
* PowerShell will automatically search for possible problems and fix them.
* (**optional**) You could do mentioned method above manually, search for the `*_APPRAISER_HumanReadable.xml` file once you found the file, open it and search for `DT_ANY_FMC_BlockingApplication` which should be set to `true`.
* Repeat the process with a search for `LowerCaseLongPathUnexpanded`, this returns the path which might causes update problems, remove the path and re-start the update procedure. 


### Windows 10 coercing people into online accounts when loading Windows 10

This only [affects US Windows 10 Home Editions](https://www.reddit.com/r/windows/comments/cuzo6w/windows_10_coercing_people_into_online_accounts/). As a [workaround](https://www.howtogeek.com/442609/confirmed-windows-10-setup-now-prevents-local-account-creation/) simply unplug your network cable and you will see the "use local account instead" button on the left corner.


## Microsoft "Health Dashboard" (all known Windows problems)

The official dashboard can be found over here:
* [https://docs.microsoft.com/en-us/windows/release-information/status-windows-10-1903](https://docs.microsoft.com/en-us/windows/release-information/status-windows-10-1903)


## How to I uninstall a specific KB?
Basically there are two methods, one explained [here](https://www.groovypost.com/howto/uninstall-a-windows-10-cumulative-update/) and in case you installed it as .cab file you can follow the [instructions given by MS](https://docs.microsoft.com/en-us/powershell/module/dism/remove-windowspackage?view=win10-ps).


## Install Language Packs on Build 1809 or higher

Language packs will still be avbl. via [seperated .iso files](https://www.microsoft.com/de-de/store/collections/localexperiencepacks?rtc=1).

1.) Mount the install.wim via:
`dism.exe /mount-wim /wimfile:C:\install.wim /index:1 /mountdir:C:\Mount`

2.) Mount the registry otherwise you're not able to integrate the new language via 
`Reg Load HKLM\TempImg C:\Mount\Windows\system32\config\SOFTWARE`

3.) Insert the following registry key:
`Reg Add HKLM\TempImg\Policies\Microsoft\Windows\Appx /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"`

4.) Unmount the registry:
`Reg unload HKLM\TempImg`

5.) Integrated the [LXP.Appx](https://docs.microsoft.com/en-us/powershell/module/dism/add-appxprovisionedpackage?view=win10-ps) for example: 
`Dism.exe /image:C:\Mount /add-provisionedappxpackage /packagepath:C:\LXP_APPX\Microsoft.LanguageExperiencePackde-DE_17761.1.1.0_neutral__8wekyb3d8bbwe.Appx /SkipLicense`

6.) Unmount the image
`Dism.exe /unmount-wim /mountdir:C:\Mount /commit`


## Spectre & Meltdown 

![Spectre and Meltdown on Intel Hardware](https://i.imgur.com/WPiOGpZ.png)

**Overview**:
* [V3a](https://developer.arm.com/support/arm-security-updates/speculative-processor-vulnerability/download-the-whitepaper) (new "Meltdown" variant) (CVE-2018-3640: "Rogue System Register Read (RSRE)")
* [V4](https://software.intel.com/side-channel-security-support) ([CVE 2017-5715](https://www.neowin.net/news/spectre-variant-4-disclosed-mitigations-to-result-in-another-performance-hit)) (CVE-2018-3639: "Speculative Store Bypass (SSB)")
* [L1TF](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00161.html) (CVE-2018-3620, CVE-2018-3646: "L1 Terminal Fault")

[Supported CPU's](https://support.microsoft.com/en-us/help/4100347/intel-microcode-updates-for-windows-10-version-1803-and-windows-server):

+ (106A5) Nehalem EP & Nehalem WS
+ (106E5) Lynnfield
+ (106E5) Lynnfield Xeon
+ (20655) Arrandale
+ (20655) Clarkdale
+ (206A7) Sandy Bridge
+ (206A7) Sandy Bridge Xeon E3
+ (206D7) Sandy Bridge Server EN/EP/EP4S
+ (206E6) Nehalem EX
+ (206F2) Westmere EX (EGL, WSM)
+ (306A9) Gladden
+ (306A9) Ivy Bridge
+ (306A9) Ivy Bridge Xeon E3
+ (306C3) Haswell (including H, S)
+ (306C3) Haswell Xeon E3
+ (306D4) Broadwell U/Y
+ (306E7) Ivy Bridge Server EX
+ (306F4) Haswell Server EX
+ (40651) Haswell ULT
+ (40661) Haswell Perf Halo
+ (40671) Broadwell H 43e
– (406E3) Skylake U/Y & Skylake U23e
+ (50654) Skylake D (Bakerville)
+ (50654) Skylake Server
+ (50654) Skylake W
+ (50654) Skylake X (Basin Falls)
+ (50662) Broadwell DE V1
+ (50663) Broadwell DE V2,V3
+ (50664) Broadwell DE Y0
+ (50665) Broadwell DE A1
+ (506C2) Broxton
+ (506C9) Apollo Lake D0
+ (506CA) Apollo Lake E0
– (506E3) Skylake H/S & Skylake Xeon E3
+ (506F1) Denverton (GLM)
+ (806EA) Coffee Lake U43e
+ (806EA) Kaby Lake Refresh U 4+2
+ (906E9) Kaby Lake G/S/X/G
+ (906E9) Kaby Lake Xeon E3

Old:
+ [14393+] (806E9) Kaby Lake U/Y & Kaby Lake U23e
+ [14393+] (906EA) Coffee Lake H (6+2) & Coffee Lake S (6+2)
+ [14393+] (906EA) Coffee Lake S (6+2) Xeon E
+ [14393+] (906EA) Coffee Lake S (4+2) Xeon E
+ [14393+] (906EA) Coffee Lake S (6+2) x/KBP
+ [14393+] (906EB) Coffee Lake S (4+2)

Patched .dll's:

* mcupdate_GenuineIntel.dll
* mcupdate_AuthenticAMD.dll

Windows has the ability to warm patch microcode on boot using the mcupdate_GenuineIntel.dll and mcupdate_AuthenticAMD.dll drivers (located at C:\Windows\System32) on boot, for Intel and AMD cpu's respectively.

## Activate the Meltdown + Spectre Patches via Registry manually (requires a reboot):

### Meltdown + Spectre Patches activation (Default under Windows 10)
* Meltdown-Fix: Activated (secure)
* Spectre-Fix: Activated (secure)
* Performance: Bad/Medium

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000000
"FeatureSettingsOverrideMask"=dword:00000003
```

### Deactivate only Spectre Patch
* Meltdown-Fix: Activated (secure)
* Spectre-Fix: Deactivated (secure)
* Performance: Medium

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000001
"FeatureSettingsOverrideMask"=dword:00000003
```

### Deactivate all Patches
* Meltdown-Fix: Deactivated (insecure)
* Spectre-Fix: Deactivated (insecure)
* Performance: High

```bash
[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"FeatureSettingsOverride"=dword:00000003
"FeatureSettingsOverrideMask"=dword:00000003
```

[Speculation Control Validation PowerShell Script](https://gallery.technet.microsoft.com/scriptcenter/Speculation-Control-e36f0050) - Official MS PowerShell script to control the Registry toggles and check the current status.  


**Notice**:

On AMD systems you _can block the update_ via [wushowhide.diagcab](https://support.microsoft.com/de-de/help/3073930/how-to-temporarily-prevent-a-driver-update-from-reinstalling-in-window), since the update will effect your performance. But this is not recommended.  


### Intel Microcode Updates

[Intel Microcode Guidance 14. May 2019 (.pdf)](https://www.intel.com/content/dam/www/public/us/en/documents/corporate-information/SA00233-microcode-update-guidance_05132019.pdf)

OS Version | KB | Patch | Updated
--- | --- | --- | --- 
Windows 10 1507 | [KB4091666](https://support.microsoft.com/en-us/help/4091666/kb4091666-intel-microcode-updates) | [Download](https://www.catalog.update.microsoft.com/Search.aspx?q=KB4091666) v3 (Rev. 8) | 30. Aug. 2019 |
Windows 10 1511 | // | // | // |
Windows 10 1607 | [KB4091664](https://support.microsoft.com/en-us/help/4346087/kb4346087-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346087) v3 (Rev. 12) | 30. Aug. 2019 |
Windows 10 1703 | [KB4091663](https://support.microsoft.com/en-us/help/4346086/kb4346086-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346086) v3 (Rev. 10) | 30. Aug. 2019 |
Windows 10 1709 | [KB4090007](https://support.microsoft.com/en-us/help/4346085/kb4346085-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/search.aspx?q=4346085) v3 (Rev. 11) | 30. Aug. 2019 |
Windows 10 1803 | [KB4100347](https://support.microsoft.com/en-us/help/4346084/kb4346084-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/Search.aspx?q=kb4346084) v2 (Rev. 5) | 30. Aug. 2019 |
Windows 10 1809 | [KB4465065](https://support.microsoft.com/en-us/help/4465065/kb4465065-intel-microcode-updates) | [Download](http://www.catalog.update.microsoft.com/Search.aspx?q=kb4465065) v2 (Rev. 3) | 30. Aug. 2019 |
Windows 10 1903 | [KB4497165](https://support.microsoft.com/en-us/help/4497165/kb4497165-intel-microcode-updates) | [Download](https://www.catalog.update.microsoft.com/Search.aspx?q=4497165) v3 (Rev. 3) | 30. Aug 2019 |


### Intel ZombieLoad

Official [security advisor](https://seclists.org/oss-sec/2019/q2/111) - disable Hyper-Threading. [Intel official list those holes as critical](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00213.html).

OS Version | KB | Patch | Updated
--- | --- | --- | --- 
Windows 10 1507 | [KB4494454](https://support.microsoft.com/en-us/help/4494454/kb4494454-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1607 | [KB4494175](https://support.microsoft.com/en-us/help/4494175/kb4494175-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1703 | [KB4494453](https://support.microsoft.com/en-us/help/4494453/kb4494453-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1709 | [KB4494452](https://support.microsoft.com/en-us/help/4494452/kb4494452-intel-microcode-updates) | Via WUS | 14. May 2019
Windows 10 1803 | [KB4499167](https://support.microsoft.com/en-us/help/4499167) | Included in KB | 14. May 2019
Windows 10 1809 | [KB4494441](https://support.microsoft.com/en-us/help/4494441) | Included in KB | 14. May 2019
Windows 10 1903 | [KB4497165](https://support.microsoft.com/en-us/help/4497165/kb4497165-intel-microcode-updates) | Windows Insider Program | 14. May 2019

Same as in Spectre, you have to wait until the OEM provides a BIOS updates.


## Switching from 1903/1909 "Slow Ring" (Insiders) to Stable Builds without the need of an Upgrade
* You need Windows as original (unpatched) version Build 18362.1.
* Mount the install.wim 

```bash
md C:\Mount
dism /Mount-Image /ImageFile:E:\sources\install.wim /Index:1 /MountDir:C:\Mount /ReadOnly
```

* Copy via [NSudo](https://github.com/M2Team/NSudo/releases) the missing components:
```bash
NSudo.exe -U:T -P:E cmd.exe /c robocopy C:\Mount\Windows\WinSxS %SystemRoot%\WinSxS /R:0 /W:0 /NFL /NDL /J /S /DCOPY:DAT /XC /XN /XO /XX /XF migration.xml pending.xml poqexec.log /XD Backup Catalogs FileMaps InstallTemp ManifestCache Temp
```
* Import the following reg

```bash
reg query HKLM\COMPONENTS >nul 2>&1 && (net stop trustedinstaller >nul 2>&1 &reg unload HKLM\COMPONENTS >nul 2>&1)
reg load HKLM\COMPONENTS C:\Mount\Windows\System32\Config\COMPONENTS
reg export HKLM\COMPONENTS\CanonicalData\Deployments "%temp%\Deployments.reg"
reg export HKLM\COMPONENTS\DerivedData\Components "%temp%\Components.reg"
reg unload HKLM\COMPONENTS
reg load HKLM\COMPONENTS %SystemRoot%\System32\Config\COMPONENTS
reg import "%temp%\Deployments.reg"
reg import "%temp%\Components.reg"
for /f "tokens=* delims=" %i in ('reg query HKLM\COMPONENTS\DerivedData\VersionedIndex ^| findstr /i VersionedIndex') do reg delete "%i" /f
reg unload HKLM\COMPONENTS
del /f /q "%temp%\*.reg"
```
* Execute DISM `Dism /Online /Cleanup-Image /RestoreHealth /Source:C:\Mount\Windows /LimitAccess`
* Unmount the install.wim:
