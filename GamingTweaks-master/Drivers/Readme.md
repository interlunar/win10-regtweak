# Table of contents
* [Table of contents](#table-of-contents)
  * [Drivers (general advice)](#drivers-general-advice)
  * [Chipset driver update myth](#chipset-driver-update-myth)
      * [Best practice](#best-practice)
  * [nVidia Driver update procedure](#nvidia-driver-update-procedure)
  * [AMD Driver update procedure](#amd-driver-update-procedure)
  * [nVidia and Ansel](#nvidia-and-ansel)
      * [Windows 10 (only) Upgrade drivers from legacy to UWD/MWD](#windows-10-only-upgrade-drivers-from-legacy-to-uwdmwd)
    * [LatencyMon and how you correctly interpret the results](#latencymon-and-how-you-correctly-interpret-the-results)
* [Warning](#warning)
* [Hard page faults](#hard-page-faults)
* [nVidia and dithering question](#nvidia-and-dithering-question)
* [ULMB (nVidia) under Windows 10](#ulmb-nvidia-under-windows-10)
* [nVidia HDMI Audio problems with (wrong timeouts)](#nvidia-hdmi-audio-problems-with-wrong-timeouts)


## Drivers (general advice)

* Try to uninstall every drivers which you won't need (e.g. on OEM systems [pre-installed drivers]) via Control Panel\All Control Panel Items\Programs and Features, say no if they ask you to reboot the OS. Make sure you reboot into "Safe Mode" to install important drivers in order to get full access, this is not mandatory but it might solve to remove all leftovers (in case you have some upgrade/install) issue.
* Disable unused audio devices (like ATI HDMI) in Device Manager (which are most of the time not needed)
* Don't use utilities like [Intel Driver Update Utility](https://www.intel.com/content/www/us/en/support/topics/idsa-faq.html) because it runs all the time in the background, submits telemetry and doesn't have any benefit over a _traditional_ driver page like e.g. [Station-Drivers](https://www.station-drivers.com/index.php?lang=en).
* Do not install "Xtreme-G Modded Drivers", the promises the modders makes are ridiculous and there is no evidence that this holds what it promises.


## Chipset driver update myth

You [do not need to install any chipset driver unless you see a yellow triangle](https://www.win-raid.com/t895f42-Intel-Chipset-Device-quot-Drivers-quot-INF-files.html) in device manager. Windows Update usually then kicks in and offers you the correct version. There is (_in normal situations_) no benefit in using an updated chipset drivers because if you [inspect the changelog](https://downloadmirror.intel.com/29227/eng/10.1.18228.8176_3.1.7.118_public.pdf) you will notice that newer chipset driver versions often only adding new products they typically never "fix" something.

#### Best practice
* If you see no yellow triangle in Windows device manager (_unknown device or error codes_) do not install any chipset driver.
* If Windows Update offers you the driver then you're good to go, just install it and reboot.
* Monitor the changelogs from AMD and Intel for platform specific changes, if you see new chipset driver versions just do not blindly download them, instead check if the changelog mention some improvements (_they never do_).



## nVidia Driver update procedure

* Download the latest official driver of the [clean driver](https://github.com/CHEF-KOCH/nVidia-modded-Inf).
* Download/use DDU under Windows safe mode and then restart the PC after the cleaning is done.
* Install the new driver and then restart your PC.
* (optional) Activate `MSI mode` and restart your PC. MSI Mode needs to be set again after each new driver change!
* (optional) Configure via nVidia Inspector e.g. 3D Global settings (keep in mind you can import/export those settings!), MAXPRERENDER FPS = 1 + Anisotropic Filtering Sample Optimization ON, Texture filtering Quality = High Performance + Power management mode = Prefer Max Performance
* Configure 3D Game profile settings according to your own needs. E.g. Fast sync on for R6 Siege with an 120fps limiter for consistent and tear free gameplay.
* Use [Intelligent standby list cleaner (ISLC)](https://www.wagnardsoft.com/forums/viewtopic.php?t=1256), [Timer Resolution](https://cms.lucashale.com/timer-resolution/) or [Timer Tool](https://github.com/tebjan/TimerTool) and set the value to `0.499ms` (0.50ms) in order to reduce the overall latency. _ISLC is the all-in-one solution._
* Make your own game profiles and put the fps limiters for your games using RivaTuner Statistics Server (RTSS) provided along with MSI Afterburner according to your systems GFX and CPU power.
* Evaluate your settings per game by testing each title you play so you can make further adjustments in case something is not working properly!
* (optional) Set `SILK Smoothness` to `OFF` for multiplayer FPS Shooters only, which might improve it's responsiveness.
* Set `Power management` to `Adaptive`.


## AMD Driver update procedure

* Download the latest driver from the official AMD page.
* Download/use DDU under Windows safe mode and then restart the PC after the cleaning is done.
* There are no additional tweaks (needed [?] - if you found some, let me know or create a PR)


## nVidia and Ansel

[Ansel](https://www.geforce.com/hardware/technology/ansel) is (more or less) deprecated and already partially removed from the current nVidia drivers (only backward compatibility is still given). There are several games like WatchDogs or [Conan Exile](https://steamcommunity.com/app/440900/discussions/0/133256959371919651/) which suffering from FPS drops once Ansel if its enabled.

If you have FPS drops make sure you disable Ansel the default `keybind to activate/disable Ansel is Alt+F2` which disables Ansel globally. Alternative manually open the file `NvCameraConfiguration.exe` under `C:\Program Files\NVIDIA Corporation\Ansel\Tools`.

Per Game via nVidia Inspector:
Scroll down in nVidia Inspector until you see the `GLOBAL_DRIVER_PROFILE` option you will see in this category an flag `ENABLE_ANSEL_ON` which you can toggle off. If there is no such entry it means that the installed driver doesn't support/include Ansel or that the Game itself doesn't use Ansel.


#### Windows 10 (only) Upgrade drivers from legacy to UWD/MWD

[Modern Windows Drivers (MWDs) or also known as Universal Windows Drivers (UWDs) drivers replacing the old driver scheme in Windows](https://docs.microsoft.com/en-us/windows-hardware/drivers/develop/getting-started-with-universal-drivers), this basically means for the end-user smaller driver packages and it includes more OEMs (universal).

* Remove the old „legacy“ driver via Apps.
* Reboot the OS.
* (optional) Check leftovers via [Driver Store Explorer](https://github.com/lostindark/DriverStoreExplorer), because MS often keeps (as backup) the old driver in the Driver Store.
* Install the new UWD driver via setup.exe.
* Reboot
* **Important**: Do not install the new UWD via [.INF or Have-a-Disk method](https://www.computerhope.com/issues/ch000834.htm#have-disk) because this bypasses the setup.exe internal install method and can causes additional problems, crashes, performance issues etc.



### LatencyMon and how you correctly interpret the results

First of all [LatencyMon](https://www.resplendence.com/latencymon) is a program for "power users" and not something for beginners but I try to explain it in some easy understandable steps which everyone can follow. Microsoft own utility is called [perfmon](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc749154(v=ws.11) or [xperf](https://docs.microsoft.com/en-us/windows-hardware/test/wpt/) which also can read-out several things LatencyMon does.


Warning
===========

> LatencyMon is no guarantee fo find every OS/Bios or in-game related problem! Even if everything is in the green and you don't see any spikes you still can get FPS drops or other gaming issues.


LatencyMon checks:
- [Buffer underruns](https://en.wikipedia.org/wiki/Buffer_underrun) by measuring [kernel timer latencies](https://www.osr.com/nt-insider/2014-issue3/windows-real-time/)
- Deferred Procedure Call [DPC](https://docs.microsoft.com/en-us/dotnet/api/system.windows.threading.dispatcher?view=netframework-4.8) and interrupt service routine [ISR](https://en.wikipedia.org/wiki/Interrupt_handler) execution times
- [Hard page faults](https://en.wikipedia.org/wiki/Page_fault), see here for a [technical explanation](https://www.resplendence.com/whysoslow_help_hardpagefaults)


In other words it checks driver related problems & [more](https://www.resplendence.com/latencymon_idlt) because the above mentioned checks are in direct relationship to it. LatencyMon itself does not solve any of the problems, what it does is to show possible root causes of the real latency problems under Windows.

Examples which caused a higher latency because of faulty drivers:
- [Samsung NVME 2.1 driver and terrible DPC Latency](https://hardforum.com/threads/samsung-nvme-2-1-driver-and-terrible-dpc-latency.1927697/)
- [Audio crackling due to nvlddmkm.sys Nvidia driver latency issue](https://www.tenforums.com/graphic-cards/26861-audio-crackling-due-nvlddmkm-sys-nvidia-driver-latency-issue.html)
- [In Depth latency test ryzen latency(help)](https://forums.guru3d.com/threads/in-depth-latency-test-ryzen-latency-help.422352/)


Hard page faults
===========

A [hard fault](https://appuals.com/hard-faults-per-second/) occurs when a memory block had to be retrieved from the Page File (Virtual Memory) instead of the physical memory (RAM). You have three possibilities, try to [disable the pagefile](https://tunecomp.net/win10-page-file-disable/) or upgrade your RAM (if possible).


nVidia and dithering question
===========

[Enabling dithering has no impact on gaming performance](https://www.youtube.com/watch?v=ot3TWFtWl1M), so it is unclear why nVidia and Microsoft are not going to enable the option (by default) for e.g. 1440p 144-165Hz G-Sync TN monitors (the ones which are most affected by color banding). Or why there is no option to manually control it via NVCP. AMD GPU drivers have such an option to enable/disable dithering since many years and Linux also has an active nVidia dithering option since many years. There is a [registry hack](https://forums.geforce.com/default/topic/1082681/geforce-drivers/is-it-possible-to-quot-port-quot-dithering-from-nvidia-x-server-to-geforce-driver-/post/5934577/#5934577) to enable dithering for nVidia users, the problem is that Windows seems to make problems (newer versions like 1903+).


ULMB (nVidia) under Windows 10
===========

ULMB is automatically grayed out because you can only use G-Sync OR ULMB at the same time. This is by design.

Most games under Windows 10 use the desktop refresh rate (default). Setting another refresh rate in your nVidia Control Panel might gets ignored by the game itself (depending on the game). You can avoid this by disabling "Full-screen Optimisations", (if present - depends on the Windows 10 Build). Right-click on the game executable and check the compatibility tab, there is an option to enable it it's by default disabled). After you enabled the option you **must** also enable the "Exclusive Fullscreen" option in-game.


nVidia HDMI Audio problems with (wrong timeouts)
===========

* **Warning**: You do NOT need this "trick" if you haven't installed NVIDIA High Definition Audio driver!

First of all, make a registry backup! There are several registry entries regarding on how to manipulate the timeout for HDMI Audio devices. Changing the value offsets _can fix AV Receiver connection_ problems among an well known _audio stuttering_ issue, this is because of "wrong" (unoptimized) timeouts. There is no easy way for this avbl. because those offsets change whenever you re-install or install a new nVidia/Realtek audio driver. What this registry change basically does is to force the device to go into a specific mode whenever the device is in a performance, idle or waiting stage.

* **Checking the Class GUID:** Open the device manager, navigate to "Sound, video and game controllers" and open the nVidia High Definition Audio properties. Now click the "Details" tab which reveals a bunch of GUIDs, we are searching for the "Class GUID", once you found it in the list, write down or right-click and copy it's value. The driver itself is called or listed as `nvhda64v.sys`.
* The value always looks different, the format is `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`.
* **Changing the value**: Open registry and navigate to `Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\<-your-class-GUID-belongs-in-here>\0000\PowerSettings`. Once we are there, you see several entries, our focus are `ConservationIdleTime`,  `IdlePowerState` & `PerformanceIdleTime`. The default value for all three of them is always (by default) `00 00 00 80`. If that's not the case you have to delete their content and ensure it' all set to zero -> `00 00 00 00`. In case you use a Realtek sound-chip, check sub-keys for `Realtek Semiconductor Corp.` and procede with the same procedure.
* Reboot.


