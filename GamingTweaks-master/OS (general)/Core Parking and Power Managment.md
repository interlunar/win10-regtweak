## Why is Core Parking disabled in Windows 10?

Microsoft officially states that "[Core Parking is most effective on systems that have processor idle states with extremely low power consumption](https://msdn.microsoft.com/en-us/ie/dn613899%28v=vs.100%29?f=255&MSPPError=-2147217396)", while [some websites claim that enabling core parking positley influence the Gaming performance](https://windows10gadgets.pro/tipstricks/coreparking.html) (higher FPS) and also showing more "benchmark points" in syntehical benchmarks.

While some users argue over the benefits of core parking, [Microsoft have chosen to leave the choice of core parking up to the vendors](https://community.amd.com/community/gaming/blog/2017/04/06/amd-ryzen-community-update-3), as they can create there own power plans and shipping with products. With things like Turbo Boost Index and Frequency Scaling Index, a processor is usually able to be controlled more responsively with core parking disabled.


### Should I tweak the current Core Parking situation under Windows 10?

First of all, what is Core parking? Basically spoken it allows:

* The processor(s) to go into a ["sleep mode"](https://metebalci.com/blog/a-minimum-complete-tutorial-of-cpu-power-management-c-states-and-p-states/).
* Allows your processor(s) to save or to not save energy.

Core parking was first introduced in processor power management (PPM) engine. Your cores are parked that do not have any threads scheduled, and they go into a very low power states when they are not processing interrupts, DPCs, or other strictly affinitized work. The remaining cores are responsible for the remainder of the workload.


**The main proplem**: On modern multicore processors, the distribution of activity to cores is very dynamic, and overall [helps Turbo Boost](https://stackoverflow.com/a/28921779/103167). Core parking itself acts in very short intervals and does not act long enough for you to perceive any particular core staying parked.


**Tweaking can result in more heat?**
**Yes**, in _theory_, if you force specific cores or all cores to stay parked for a very long time it could uneven heating problems insider your processor(s). However, this is depending on how efficent or inefficent the current power plan is and if the CPU gets enough "room to breath" or not and in which [processor state](https://metebalci.com/blog/a-minimum-complete-tutorial-of-cpu-power-management-c-states-and-p-states/) the CPU currently runs. More heat means means the CPU then starts to throttle and you overall lose performance. 

**Recommadation**:
Let the Windows 10 scheduler spread the activity automatically, this is more efficent and does not create much side-effects (_unless your profile is inefficent or Windows own scheduler is flawed_).


### Hidden Registry command

The registry command was "removed" (it's hidden) and replaced with `powercfg`, as explained over [here](https://superuser.com/a/1437854/900431). 

| Registry Hive | Registry entry name | Value | 
| :----- | :-----: |  :-----: | 
| HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583 | Attribute | 0 (default is 1) |


The official way is now via CMD/PowerShell provided:
* `powercfg -attributes SUB_PROCESSOR CPMINCORES -ATTRIB_HIDE`

This is easier, does not need a reboot and a user is not forced to work with the registry.


#### Benchmark examples
* [High performance power plan (Processor rating)](https://www.userbenchmark.com/UserRun/17287264)
* [High performance power plan, with 50% minimum core parking turned on](https://www.userbenchmark.com/UserRun/17287387)
* [Balanced power plan (Processor rating)](https://www.userbenchmark.com/UserRun/17287490)
* [Balanced power plan, with 50% minimum core parking turned on](https://www.userbenchmark.com/UserRun/17287532)

Core parking can potentially **increase energy efficiency during lower usage**, which is why it is generally set up on some Windows power plan schemes. Cores are being parked or not depending on configuration of power scheme settings! This will overall affect your energy/performance PC level based on the decision you made (or what was set in PowerCfg).


#### Power Plans (profiles) & Power Scheme

**Power Plans**: Windows 10 uses integrated and vendor based power plans to set the Processor Performance which will result in cores being parked or not depending on configuration of power scheme settings. 

Power users, vendors (or their applications) can create or "install" their own power plans, which is optional. You can use Microsoft's Provisioning framework to configure the processor power settings described [here](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options). The processor namespace is divided into three sets of identical power processor configurations called power profiles. The power profiles are used by the power processor engine to adapt the performance and parking algorithm on various system use cases.

**Power Schemes**: They are a collection of settings that controls the power usage of your computer and their internals. Those schemes can be used to e.g. reduce the power consumption of individual devices (e.g. USB/Wifi) or the entire system, see [here](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/static-configuration-options-for-core-parking) for more information.


Preinstalled power profiles:
* **Default** profile is the configuration set that is active most of the time.
* **LowLatency** is the profile that is activated during boot and during app launch time.
* **LowPower** is the profile that is activated during the buffering phase of media playback scenarios.
* **Constrained (_also known as Balanced_)** is a profile activated by the battery saver feature on Windows 10 for desktop editions (Home, Pro, Enterprise, and Education).

### Processor Power Management States

PowerCfg profiles several [integrated settings](https://msdn.microsoft.com/en-us/windows/mt422910(v=vs.80)), they are documented over [here](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/configure-processor-power-management-options).

* CPMINCORES, CPMINCORES1
* CPMAXCORES, CPMAXCORES1
* LATENCYHINTUNPARK, LATENCYHINTUNPARK1
* PROCTHROTTLEMAX, PROCTHROTTLEMAX1
* PROCTHROTTLEMIN, PROCTHROTTLEMIN1
* PERFINCTHRESHOLD, PERFINCTHRESHOLD1
* PERFINCTIME, PERFINCTIME1
* PERFDECTHRESHOLD, PERFDECTHRESHOLD1
* PERFDECTIME, PERFDECTIME1
* LATENCYHINTPERF, LATENCYHINTPERF1
* PERFAUTONOMOUS
* PERFEPP
* Legacy: [PERFBOOSTMODE](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/legacy-config-options-perfboostmode)
* Legacy: [PERFBOOSTPOL](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/legacy-config-options-perfboostpol)


### Working with PowerCfr & Windows 10 Power GUI

The command line syntax for PowerCfg is [described over here](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/powercfg-command-line-options). You can also create and tweak your own power profile, as shown over [here](https://www.tenforums.com/tutorials/43655-create-custom-power-plan-windows-10-a-post1521767.html#post1521767). The command `powercfg -help` or `powercfg.exe -aliases` typically reveals how to work with the command line syntax and gives you [some](https://www.tenforums.com/tutorials/107613-add-remove-ultimate-performance-power-plan-windows-10-a-2.html) [examples](https://superuser.com/a/1437854/900431).


## Reference
* [Core Parking in Windows (Disable for More Performance)](https://www.overclock.net/forum/297-general-processor-discussions/1544554-core-parking-windows-disable-more-performance.html)
* [Core Parking Information on Quick CPU Page](https://coderbag.com/product/quickcpu)
* [CPU Parking Options in Power Settings](https://www.tenforums.com/performance-maintenance/36871-cpu-parking-options-power-settings.html)
* [Enable - Disable CPU Turbo Boost from Command Line](https://www.sakya.it/wordpress/enable-disable-cpu-turbo-boost-from-command-line/)
* [How to Add or Remove Maximum processor state from Power Options](https://www.tenforums.com/tutorials/107967-add-remove-maximum-processor-state-power-options-windows.html)
* [Interesting Answer on Microsoft Forum - Core Parking Disabled](https://social.technet.microsoft.com/Forums/en-US/8d6085d8-2c26-426c-87ac-2ba189b77aa5/core-parking-not-working-after-upgrade?forum=win10itprohardware)
* [Metebalci - A Minimum Complete Tutorial of CPU Power Management, C-states and P-states](https://metebalci.com/blog/a-minimum-complete-tutorial-of-cpu-power-management-c-states-and-p-states/)
* [Microsoft - Power and performance tuning](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/hardware/power/power-performance-tuning)
* [Microsoft - Processor performance core parking maximum and minimum cores](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/hardware/power/power-performance-tuning)
* [Never, Ever Use a Software That Changing the Registry to Un-Park the Core](https://bitsum.com/forum/index.php?topic=3721.0)
* [New power options in Windows 10 for longer battery life on laptops](http://www.rawinfopages.com/tips/2017/08/new-power-options-in-windows-10/)
* [Notebook Review - Improving Battery Life - Enabling Deeper C States](http://forum.notebookreview.com/threads/guide-improving-battery-life-on-windows-enabling-deeper-c-states.815602/)
* [Overclock - Core Parking in Windows (Disable for more performance) 2017](https://www.overclock.net/forum/297-general-processor-discussions/1544554-core-parking-windows-disable-more-performance-3.html)
* [Powercfg.exe and Parked CPU Core's](https://forums.battlefield.com/en-us/discussion/96014/powercfg-exe-and-parked-cpu-cores)
* [Reddit - Core Parking and AMD 2017](https://forums.guru3d.com/threads/windows-power-plan-settings-explorer-utility.416058/page-5)
* [Reddit - Unparking Cores (Good or Bad?)](https://www.reddit.com/r/windows/comments/8hw0y7/unparking_cores_good_or_bad/)
* [Reddit - Windows 10 Stutter](https://www.reddit.com/r/Windows10/comments/7a0763/standby_memory_issue_causing_stutters_on_creators/)
* [Some CPU Cores Are Parked While Other Active 2008 R2](https://support.microsoft.com/en-au/help/2534356/some-cpu-cores-are-parked-while-other-active-cpu-cores-have-a-heavy-wo)
* [Stack Exchange Network - Why does Windows 10 have CPU core parking disabled?](file:///H:/questions/1435110/why-does-windows-10-have-cpu-core-parking-disabled)
* [Steam Community - Windows 10 Doesn't Park CPU Cores?](https://steamcommunity.com/discussions/forum/11/1744478429680383517/)
* [Windows 10 Gadgets - Core Parking](https://windows10gadgets.pro/tipstricks/coreparking.html)
* [How does the Windows 10 scheduler deal with Hyper Threading since Core Parking is disabled by default for Intel CPUs?](file:///questions/1188967/how-does-the-windows-10-scheduler-deal-with-hyper-threading-since-core-parking-i)


### Microsoft
* [Command Line Power Configuration for Microsoft Windows](https://answers.microsoft.com/en-us/windows/forum/windows_10-power/power-plans-missing/9885bdc8-b11f-4722-9e11-423ef77494a9?auth=1&page=5)
* [Microsoft - Static Core Parking Options](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/static-configuration-options-for-core-parking)
* [Microsoft Press - Understanding the Windows I/O System](https://www.microsoftpressstore.com/articles/article.aspx?p=2201309&seqNum=7)
* [Power and Performance Tuning Windows Sever 2016](https://docs.microsoft.com/en-us/windows-server/administration/performance-tuning/hardware/power/power-performance-tuning)
* [Static Configuration Options for Heterogeneous Power Scheduling](https://docs.microsoft.com/en-us/windows-hardware/customize/power-settings/static-configuration-options-for-heterogeneous-power-scheduling)


### Intel 
* [Document Number: 335190-003 7th Generation Intel® Processor Families for H Platforms](https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/7th-gen-core-family-mobile-h-processor-lines-datasheet-vol-1.pdf)
* [Document Number: 335898-001 Intel® Core X-Series Processor Families](https://images-eu.ssl-images-amazon.com/images/I/A1L1jU3HvIL.pdf)


### AMD
* AMD - [Ryzen product in 2017](https://community.amd.com/community/gaming/blog/2017/04/06/amd-ryzen-community-update-3)
* [TechPowerUp - 1usmus Custom Power Plan for Ryzen 3000 Zen 2 Processors](https://www.techpowerup.com/review/1usmus-custom-power-plan-for-ryzen-3000-zen-2-processors/2.html)


### Wikipedia
* [Wikipedia - Heterogeneous System Architecture](https://en.wikipedia.org/wiki/Heterogeneous_System_Architecture)
* [Wikipedia - Powercfg](https://en.wikipedia.org/wiki/Powercfg)


### Programs
* [Bitsum - ParkControl](https://bitsum.com/parkcontrol/)
* [Disable CPU Core Parking Utility](https://www.coderbag.com/Programming-C/Disable-CPU-Core-Parking-Utility)
* [Intel Turbo Boost](https://www.thewindowsclub.com/intel-turbo-boost-technology-max)
* [Quick CPU](https://coderbag.com/product/quickcpu)

