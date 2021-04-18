## How do I measure the overall OS performance?

It is a difficlt question because there a lot of scenarios, hardware combinations & considerations to make. A [benchmark is maybe not reliable](https://www.gamersnexus.net/guides/3240-bench-theory-reliability-standard-deviation-of-game-benchmarks) and you mjust consider that every benchmark [contains margin of errors](https://www.eurogamer.net/articles/digitalfoundry-2018-the-trouble-with-pc-benchmark-modes) (which is normal). A synthetic benchmark basically spoken gives you an idea of how well a hardware can perform a given task but the best way to rely upon results is real world usage. Too many things can affect your gaming performance, from part variances within the same product, different test benches e.g. using different CPUs/Motherboards at different settings, different test environment (e.g. temperature), different drivers & settings and sometimes different software versions (patches of games or Windows versions e.g. Build 1809 vs 1903 (No Retpoline vs [Retpoline](https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)#General_approaches)). That said do not use in-game [benchmarks](https://en.wikipedia.org/wiki/Benchmark_(computing)).

I usually use and recommend the [phoronix-test-suite](https://www.phoronix-test-suite.com/) (it's an "real program benchmark") because it does not only benchmark [certain aspects](https://en.wikipedia.org/wiki/Benchmark_(computing)#Challenges) (Kernel, synthetic, component bench), it is also able to run acrosss multiple systems and checks security based parameters to see how the OS "scores". The test itself also includes parameters to show the margin of errors, so it's not an ordinary benchmark tool. it is well documented, open source and gets constantly updates. Keep in mind that you should run it multiple times to get an average overview, however those tools do not help if you have in-game problems because several games and their game engines might have several other issues (which no benchamrk can show you). I highly recommend that you run the suite, and than compare how well you favourite game runs in-game, then you have something _objective_ to test against.

[CapFrameX](https://github.com/DevTechProfile/CapFrameX) is a fantastic tool to identify frame drops or G-Sync/FreeSync related issues. The program is for beginners and professionals and can help to check what might causes lags or to get a overview of your hardware and how well it really performes in-game, since it supports DirectX and Vulkan API's it basically can analyze almost every application/game.


## OS timer resolution

Changing the [OS wide timer](https://docs.microsoft.com/en-us/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod#remarks) can result in an [performance boost up to 30%](https://www.youtube.com/watch?v=_hcuYiqib9I&feature=youtu.be&t=365) (depending on the game).

Windows 10 since 1603+ changes the timer resolution every X seconds automatically, this requires you to leave the [Timer application](https://vvvv.org/contribution/windows-system-timer-tool) open. But, and this is a big but whenever a specific application is opened at the same time which requests another timer to the same time it would make any timer script/utility useless. For example Discord (uses electron framework - which is known to be [CPU hungry](https://github.com/electron/electron/issues/11908)) - if Discord and the Timer utility is open at the same time, you will notice that Discord automatically "overwrites" the timings set by the running timing tool.

### Application timings

* Run `powercfg /energy` in an elevated command line prompt, this will automatically (after some time [minutes]) create a [power efficiency diagnostics report](https://support.microsoft.com/en-us/help/976034/guided-help-get-a-detailed-power-efficiency-diagnostics-report-for-you). Which will be stored under `C:\WINDOWS\system32\energy-report.html`. Open the report via a Browser and search (`CTRL+F`) for `Platform Timer Resolution:Outstanding Timer Request`, this reveals which (running) application/process changes or overwrites the OS timer. It also reveals what resolution the process really requests.


## (Disable) Fullscreen optimizations

Fullscreen optimization (the option) was first introduced in Windows 10 Build 1607 ("Anniversary Update"). It attempts to convert games running in the "classic" exclusive fullscreen mode into using borderless window mode with flip model presentation instead.

### Benefits
* The optimizations combines the benefits of "classic exclusive fullscreen mode" with borderless window mode, by utilizing Microsoft's flip model presentation in a maximized borderless window.
* Available for DirectX 9+ based games and applications.

### Cons & problems
* FSO is known to cause frame pacing issues with some games e.g. Far Cry.

### Disabling FSO

While the ability to _system-wide_ disable fullscreen optimizations for all the executables was removed in Windows 10 v1803 (April Update), you can do so on a _per-game executable basis_ (valid on 1809 and 1903 too): navigate to the game, `Right-click on the executable`, select `Properties` and click on the `Compatibility` tab, check `Disable fullscreen optimizations` box then hit `OK`.
> There is an unofficial script avbl. to [automatically "Disable Fullscreen Optimizations"](https://pastebin.com/1twn8geB) based on the user choice too. This works on Windows 10 Build 1803 up to Windows Build 1903 too. Some people reporting that it will fix in-game stuttering.. 


## Desktop Window Manager (dwm.exe)

[DWM](https://en.wikipedia.org/wiki/Desktop_Window_Manager) (also known as Desktop Compositing Engine or DCE) has in general an _huge_ impact on the OS/application performance, it usually _consumes a lot_ CPU "power". It exists since Windows Vista and is a part of the Windows OS and since Windows Vista it uses [WDDM](https://en.wikipedia.org/wiki/Windows_Display_Driver_Model) to share the surface with DWM. In earlier versions it was possible to "disable" DWM, however this is these days not so easy because the process gets restarted every time WinLogon.exe was started.

**Disabling DWM is not recommended!** But if you want to, you still could do that, [even under Windows 10](https://gist.github.com/Biswa96/1b3b60715f16f18cb71bfcc11f454245). The boost is definitly there, however it breaks a lot of other WDDM functions.


### Windows Defender and Desktop Window Manager (dwm.exe)
[Another way](https://docs.microsoft.com/en-us/windows/security/threat-protection/windows-defender-exploit-guard/customize-exploit-protection) (but **insecure**) is to disable threat mitigation for the Desktop Window Manager (dwm.exe) itself within Windows Defender. Open Windows Defender (`Settings` -> `Exploit Protection` -> `Program Settings`)  and then add `C:\Windows\System32\dwm.exe` to the path, `Check` override system settings for CFG, DEP, EAF, ASLR, SEHOP (vulnerability protections) and ensure it's turned `off`. **It's not recommended to do that!**


## Responsiveness and the OS impact

The following things should be as low as possible:

* Audio latency
* Compression
* Ping/Network latency (use the ping command to quickly check your average latency which might be different [depending on several factors])
* DPC Latency (use [LatencyMon](https://www.resplendence.com/latencymon) to check it)
* _Overall network latency_ (this can't be tested easily because it is depening on several factors)
* Keyboard input processing (depending on yourself + how fast the keyboard/mouse + OS processes the signals)
* Security holes - [MDS, ZombieLoad, Spectre/Meltdown, L1TF etc.](https://www.phoronix.com/scan.php?page=article&item=mds-zombieload-mit&num=1).


The following things should be as high as possible:

* The energy profile (should be set to Ultimate), see [here](https://docs.microsoft.com/en-us/windows-hardware/customize/desktop/customize-power-slider) why.
* Frequency (only in case you do Overclocking (!)) of several components CPU/GPU (requires testing to stabilize it).
* Power Management Mode (nVidia Control Panel [NVCP]) "application controlled" is enough.


## Choosing the "correct" Windows 10 Version

Why does it matter? [Different Windows versions](https://en.wikipedia.org/wiki/Windows_10_editions) coming with different pre-installed apps or software. Practical you could remove them but this costs a) your time and b) you might not be able to remove all apps (_easily_). The Backgrounds apps and started services matter in a sense that they might result in a [higher CPU/RAM usage](http://www.blackviper.com/service-configurations/) or lags because these apps and services typically trying to update themselves in the _right moment_ which might even ends-up with a [Bluescreen (BSOD)](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-update-causing-blue-screen-errors-daily/45a08401-87c9-4c52-b160-f8548bc42c6f) or [crashes](https://answers.microsoft.com/en-us/windows/forum/apps_windows_10-outlook_mail/windows-update-caused-loss-of-mail-app-windows/aec58c9c-9371-46b4-ab69-2b54353eff5c).

* Avoid Preview or any Insider builds
* Avoid Pro or Home Editions
* Use Education (Enterprise) or LTSC versions (_if possible_)

Edu./Ent. or LTSC versions have no pre-installed apps OR/AND you can take control over them without the need to rely on third-party apps or script. Group policy Editor (GPO - gpedit.msc) and the integrated Windows 10 own Settings can control every app/store/update behavior.


## Driver installation

The driver installation order _does matter_ and might help to solve or prevent some problems.
* OS
* Chipset (reboot) - You do not need to "update" regularly your chipset driver, just install the missing driver (inf) component. There is no benefit in "updating" the existent driver.
* USB (e.g. ASMedia Technology Inc.)
* Audio/GPU (the order doesn't matter)
* Monitor/keyboard/mouse etc.

Why is the specific order needed? Some driver(s) and their installers having troubles detecting your current hardware if e.g. the chipset isn't installed first, other programs simply conflicting with the IRQ order (older mobos).

It's not necessary to re-install the entire OS in case you made a mistake, I suggest you use [DDU](https://www.wagnardsoft.com/) in combination with [RAPR](https://github.com/lostindark/DriverStoreExplorer) in order to get rid of _possible_ leftovers and old/redundant drivers in Windows driver store folder. at this point I also suggest to create a "Driver" folder on another HDD/SSD/USB drive and place all drivers you got in there. It's maybe the first time a bit more effort to collect all of them but it helps to update the drivers + keeps on eye on the current installed ones and possible (in case you store the last two versions) you have a revision in case the newer drivers are problematic.


## Reasons to avoid WUS Drivers

In [some situations](https://www.windowscentral.com/amd-marks-50-years-gold-edition-radeon-vii-ryzen-7-bundles) the offered drivers from Windows Update Servers (WUS) are outdated compared to the ones which the OEM (AMD, nVidia, Intel etc.) offers which means that they can cause some performance or even crash related issue. My own _advice_ is to use [Wumgr](https://github.com/DavidXanatos/wumgr) which is an open source program to take control over Windows Updates (in case you don't want to mess with GPO's/Registry). Windows 10 Build 1903+ got an function to manually install drivers via the integrated GUI (in this case you might not need Wumgr).

Even some OEMs might have outdated drivers (listed on the driver pages e.g. Realtek), Station-Drivers or Win-Raid Forum often have more up-2-dated drivers.

I recommend:
- Create a folder on a usb drive or external drive where you store all you drivers (in case you re-install Windows and to keep track of your current installed drivers).
- Label the folders and files correctly which shows you directly which version you currently have installed.


#### Tools like Snappy Driver Installer & Co

Snappy Driver ([Origin](https://www.snappy-driver-installer.org/) - the version which is open-source and without ads) can help you in case your OEM doesn't provide a manual to identify your current hardware, however in my experience such tools should be avoided because they _maybe_ install or identify the wrong hardware which might only ends-up with more problems and they could contain ads or are infected with malware (since they are a huge target because driver based malware is harder to remove/spot and the installer might execute the installation process under administrative rights to gain access). My _advice_ is (even if it's more effort) to [manually identify the installed hardware](https://www.windowscentral.com/how-check-your-computer-full-specifications-windows-10) create ther driver folder and download/verify the driver from trusted websites sich as Station-Drivers & Win-RAID.


## Install AiO runtimes or repacks such as DirectX, NetFramework or Visual C++ Redistributable

There is a wide-spreading myth that says that it helps to install repacked versions to _gain gaming performance_. This is wrong and there was never any evidence given, but it's true that such repacks a) are smaller in download size (compared to the original packages) b) helping you to avoid wasting SSD/HDD space on your OS partition. For example you can use [abbodi1406 vcredist package](https://github.com/abbodi1406/vcredist) which only installs the latest Microsoft Visual C++ Redistributable Runtimes which comes without any payload - in other words you save a lot of space. While this in theory is a good thing it is not always practical because some Game Stores such as Steam or even some applications which you install forcing you to _re-install_ those packages because they won't probably detect that you already have those runtimes installed. This basically means you override such a repack with the official MS packages and at the end you won't gain anything out of it.

Problems:
* Repacks could contain malware
* Steam and other Stores, or even some application overriding or forcing you to install official runtimes even if never ones are already installed
* No performance benefits


## Operating System (general tweaking advice)
* Switch unneeded services (services.msc) from automatic to manual start. This lowers CPU/Ram usage and migrates possible attack scenarios e.g. it prevents NetBios attacks (if that service was disabled). Keep in mind that some services can't be disabled (depending on the Windows 10 Build) which then require you to disable it via registry.
* Disable unneeded tasks in Task Scheduler, pretty much as same as above the goal is to reduce CPU/Ram consumption and to possible migrate attack scenarios.
* Disable unneeded logs in Event Viewer - This is more or less optional, performance wise this doesn't gain anything but it helps your SSD life since Windows writes those events in the background to a file/disk.
* Do not install any AntiVirus product, if you like to use an AV then stick with [Windows Defender because it's good enough](https://www.tomsguide.com/us/windows-defender,review-2209.html) as proven in 'independent' AV tests.
* Use only a good NAT Firewall and [Sandboxie](https://www.sandboxie.com/) (paid product), sandbox untrusted or unknown stuff. Sandboxie has no performance drops unless you use it 'cracked' or load huge apps into it. Windows 10 Build 1903/20H1 will get it's own _free_ but limited sandbox function which would be a free alternative to Sandboxie.
* Change [Core Parking only in XP, 7 and 8](https://social.technet.microsoft.com/Forums/azure/en-US/76dac4e8-ce8f-4b83-b33d-bbef50ae5d9c/cpu-core-parking-in-windows-7-should-it-be-left-alone-or-should-users-disable-it?forum=w7itproperf) because since Windows 10 the OS itself controls it automatically already.
* Delete unneeded UWP apps and uninstall the stuff you won't need, this gains some SSD/HDD space, reduces memory/cpu usage (since such apps mostly running in the background or trying to update themselves).


### Windows 7 vs. Windows 10

Gaming on Windows 10 is not necessary better or worst, it's depending on several factors such as game development API, Engine itself, if the game was 'designed' and 'optimized' for Windows 10/7, the driver and driver profiles and many more things.

[![](http://img.youtube.com/vi/RkHFYKDOo74/0.jpg)](https://www.youtube.com/watch?v=RkHFYKDOo74 "Windows 7 Vs. Windows 10 Game Performance (right-click and open it in a new Browser tab)")


### Windows 10 LTSB (Build 1607) Vs. LTSC (2019)

[![](http://img.youtube.com/vi/RkHFYKDOo74/0.jpg)](https://youtu.be/ghNe876N3TY "LTSB (Build 1607) Vs. LTSC (2019) Game Performance tested in 10 Games (right-click and open it in a new Browser tab)")


Application performance impact
---------------

Some applications and their integrated drivers from external devices like [a mouse can cause serious FPS drops](https://old.reddit.com/r/Doom/comments/8a1m9s/psa_deactivate_the_new_razer_chroma_option_in/). Keep in mind that you should update the driver ASAP once their is a new one out, this might not only fixes performance problems, it often also fixes security holes, simply review the changelog manually before you apply the changes to see if it's worth it and do backups before you install a new upgrade.


### Fix Memory Issue before with Windows 10 Build 1607 (Anniversary Update)

* Download [EmptyStandbyList](https://wj32.org/wp/software/empty-standby-list/) and put it under e.g. C:\ (ensure you don't move this file)
* Right click > Properties and select 'Run as Admin' under compatibility.
* Open your Task Scheduler > Create Task (on the far right).
* General Tab (give it a name, doesn't matter which one!). Under security options > Change user or group > Advanced > Find Now > go down and choose SYSTEM (important to make it run silently in the background). Tick 'Run with highest privileges' and 'Hidden' at the bottom. You can find an example [here](https://stackoverflow.com/questions/6568736/how-do-i-set-a-windows-scheduled-task-to-run-in-the-background).
* Click Triggers Tab > New > On a schedule > One Time. Tick repeat task every 5 minutes (possibly excessive but it causes no issues). Also choose 'for the duration of: indefinitely'
* Actions tab > Start A program > Point to the EmptyStandbyList.exe file.
* The Standby memory is automatically cleared every 5 mins.


Task Scheduler & Anti-Telemetry script
---------------

List of Windows tasks to disable (privacy & performance related):

* \Microsoft\Windows\Application Experience > AitAgent, ProgramDataUpdater
* \Microsoft\Windows\Autochk > Proxy
* \Microsoft\Windows\Customer Experience Improvement Program> Consolidator, KernelCeipTask, UsbCeip
* \Microsoft\Windows\DiskDiagnostic > Microsoft-Windows-DiskDiagnosticDataCollector
* \Microsoft\Windows\Maintenance > WinSAT
* \Microsoft\cSystemRestore > SR
* \Microsoft\Windows\WindowsBackup > ConfigNotification
* \Microsoft\Windows Defender > MP Scheduled Scan
* \Library\Microsoft\Windows\WindowsColorSystem\Calibration Loader (disable it if you use your own Display Color Profile)
* \Microsoft\\Microsoft\CDPUserSvc (see [here](https://account.microsoft.com/privacy/activity-history))


Copy the following text and save it as `antitelemetry.cmd`.

```sh
@echo off
%windir%\system32\reg.exe query "HKU\S-1-5-19" 1>nul 2>nul || goto :eof
echo.
echo Anti-Telemetry blocking script
echo Some of the commands may return error(s) - you can ignore them!
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /v DisableOSUpgrade /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /f /v IncludeRecommendedUpdates /t REG_DWORD /d 0 >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade /v AllowOSUpgrade /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /v HaveUploadedForTarget /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\AIT" /v AITEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v DontRetryOnError /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v IsCensusDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v TaskEnableRun /t REG_DWORD /d 1 /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags" /v UpgradeEligible /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser" /f >nul 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\TelemetryController" /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\IE /v CEIPEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\IE /v SqmLoggerRunning /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\Reliability /v CEIPEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\Reliability /v SqmLoggerRunning /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\Windows /v DisableOptinExperience /t REG_DWORD /d 1 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\Windows /v CEIPEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\SQMClient\Windows /v SqmLoggerRunning /t REG_DWORD /d 0 /f >nul 2>&1
sc.exe config DiagTrack start= disabled >nul 2>&1
sc.exe stop DiagTrack >nul 2>&1
reg delete HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener /f >nul 2>&1
reg delete HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\Diagtrack-Listener /f >nul 2>&1
reg delete HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\SQMLogger /f >nul 2>&1
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack /f >nul 2>&1
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection /f >nul 2>&1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack /v DiagTrackAuthorization /t REG_DWORD /d 0 /f >nul 2>&1
takeown /f %ProgramData%\Microsoft\Diagnosis /A /r /d y >nul 2>&1
icacls %ProgramData%\Microsoft\Diagnosis /grant:r *S-1-5-32-544:F /T /C >nul 2>&1
del /f /q %ProgramData%\Microsoft\Diagnosis\*.rbs >nul 2>&1
del /f /q /s %ProgramData%\Microsoft\Diagnosis\ETLLogs\* >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\Application Experience\AitAgent" /DISABLE >nul 2>&1
schtasks /Change /TN "\Microsoft\Windows\PerfTrack\BackgroundConfigSurveyor" /DISABLE >nul 2>&1
schtasks /Delete /F /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1
schtasks /Delete /F /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" >nul 2>&1
schtasks /Delete /F /TN "\Microsoft\Windows\Application Experience\AitAgent" >nul 2>&1
schtasks /Delete /F /TN "\Microsoft\Windows\PerfTrack\BackgroundConfigSurveyor" >nul 2>&1
TIMEOUT /T 5
```


To ensure the blocking settings are always set eg. after an upgrade/KB update, you can create a schedule task to run the script at logon as example: 

1. Copy the above mentioned script into `C:\Windows` and then open command prompt as administrator and execute:
2. `SCHTASKS /Create /F /RU "SYSTEM" /RL HIGHEST /SC ONSTART /TN BlockW10 /TR "cmd /c %windir%\antitelemetry.cmd"`


Random stuttering
---------------

##### **The following workaround is specifically for Windows 1703 >= 1803**


Some games might have random stutter because Windows tries to free some resources (more or less good) which might causes game stutters. A more detailed explanation can be found to the issue over [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/page-12#post-5590635). Possible workarounds in form from batch files or small utilities can be found [here](https://forums.guru3d.com/threads/fix-game-stutter-on-win-10-1703-1803.420251/).


### Power Management

Set your power setting to maximum performance (it's not needed to use an "ultimate" power-plan) if you graphic card driver has an 'maximum performance' settings enable it too, this will ensure that the GPU uses it's full potential.


### GameDVR

Whenever you stream games via OBS Studio, make sure you disable GameDVR, it is also a smart advice to in general stay away from it since most applications & games are simply not optimized for it - this doesn't have anything to do with that MS _fucked something up_ it's more that most older games (and even several new ones) are not adopted to get any benefit in such _low-latency_ mode.

Keep in mind that the registry tweak is not needed in case you're on RS5+ because `Settings > Gaming > Game bar` is the way to go (since some people reporting to have other registry values).

```bash
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\Microsoft\GameBar]
"UseNexusForGameBarEnabled"=dword:00000000
"AutoGameModeEnabled"=dword:00000000

[HKEY_CURRENT_USER\System\GameConfigStore]
"GameDVR_Enabled"=dword:00000000
"GameDVR_FSEBehavior"=dword:00000002
"GameDVR_FSEBehaviorMode"=dword:00000002
"GameDVR_HonorUserFSEBehaviorMode"=dword:00000000
"GameDVR_DXGIHonorFSEWindowsCompatible"=dword:00000000
"GameDVR_EFSEFeatureFlags"=dword:00000000
"Win32_AutoGameModeDefaultProfile"=hex:02,00,01,00,00,00,c4,20,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00
"Win32_GameModeRelatedProcesses"=hex:01,00,01,00,01,00,c0,00,c6,02,50,54,c7,02,\
  70,00,61,00,6e,00,65,00,6c,00,2e,00,65,00,78,00,65,00,00,00,8c,00,4e,8d,e1,\
  74,b8,ed,d2,02,18,4c,c7,02,1e,00,00,00,b8,ed,d2,02,1e,00,00,00,0f,00,00,00,\
  30,e7,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
  00,00,00,00,00,00,00,00,00,00
```

Since Windows 1803+ you don't need to disable GameDVR anymore, **only in case you have game specific issues!**, in such case use the provided workaround, or better report it to the game developer studio to address it directly.


### GameBarPresenceWriter.exe

GameBarPresenceWriter.exe is a part of thr XBox Game Bar function and typically runs in the background. The process can't be killed because it will automatically be restarted. You can use [this script](https://github.com/CHEF-KOCH/GamingTweaks/tree/master/Tools/GameBarPresenceWriter) to kill it once and for all.


### Windows 10 Memory Compression 

[Memory Compression](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/aa965225(v=vs.85)) in Windows 10 was introduced with [Build 10525](https://blogs.windows.com/windowsexperience/2015/08/18/announcing-windows-10-insider-preview-build-10525/#2Vhj8QCPv3g4Z372.97). An in-depth explanation is given over [here](https://channel9.msdn.com/Blogs/Seth-Juarez/Memory-Compression-in-Windows-10-RTM).

Example:
If you had 8 GB of RAM and applications had, let's say 9 GB of stuff to store in that RAM, at least 1 GB would have to be “paged out” and stored in the page file on your computer’s disk. Accessing data in the page file is very slow compared to RAM. Overall said, it all comes down to the amount of RAM. In theory you should not notice if compression is enabled or disabled on a system with 16+ GB, the sad truth is that some applications and games are not well "optimized" and disabling the compression algo might result in an overall _smoother_ application/game behavior, especially if you run many UWP apps in the background. 


Open a PowerShell with Administrator privilages then, run the command `Disable-MMAgent -MemoryCompression` and reboot. This disables the compression. To enable it later again, run again powershell as admin and run the `Enable-MMAgent -MemoryCompression
					` command. Some tasks managers can show memory compression information like Windows own task-manager, [ProcessHacker](https://wj32.org/processhacker/forums/viewtopic.php?t=2421) and [Process Explorer](https://www.howtogeek.com/319933/what-is-memory-compression-in-windows-10/).

For more details, see [this post](https://github.com/CHEF-KOCH/GamingTweaks/issues/26).

![Controlling Memory Compression](https://s19.directupload.net/images/191127/fdekunh3.png)
