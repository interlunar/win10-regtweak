### Devices (common sense tips)

* Disable all integrated audio devices (e.g. nVidia/AMD audio drivers) e.g. if you use an external or add-on soundcard make sure you disable the internal sound chip unless you're a an _Audio Pro_ which needs separate devices. 
* Disable all unused integrated peripherals (like e.g. Network, Serial, Parallel Ports, etc.).
* [Disable all unneeded running services](http://www.blackviper.com/service-configurations/black-vipers-windows-10-service-configurations/) via services.msc.

The more drivers Windows has to load the higher the chance is that it affects your IRQ/Latency/Processor. If you e.g. don't use nVidia HD audio driver(s) then just disable/uninstall or prevent from installing it in the first place. Windows then doesn't have to process separate devices or do additional calculations which results in a "smoother" gameplay (_lower latency ?_) experience. 


### RAM

Windows 10 manages memory more efficiently than earlier versions of the OS, but more memory always can potentially speed up PC operations, games don't have to write/cache on the slower M2/SSD/HDD and can use the ram more efficient without the need to swap. _16 GB is the current default_. 

Do not use e.g. 12 GB kit combinations because this will result in worse performance, as Intel explained [here](https://www.intel.com/content/www/us/en/support/articles/000005657/boards-and-kits.html#flex) the OS then falls back to a mode which is called "Flex mode".


### Interrupts

[Doctorzeus](https://forums.guru3d.com/members/doctorzeus.275790/) wrote a small utility called [MSIInturruptEnabler](https://github.com/TechtonicSoftware/MSIInturruptEnabler) to enable Message Signal Interrupts on GPU's under Windows. It requires admin rights to use it and a reboot after you applied the new changes.


### Performance Monitor (perfmon.exe) + Windows Memory Diagnostic (mdsched.exe)

Windows has an integrated Performance Monitor program which checks (together with Eventmgr.msc) your OS/Hardware for problems, you should not disable it - since there are no noticeable performance improvements, keep an eye on it here and then to quickly check if there are failures or other problems. It is not necessary to install third-party tools such as HWInfo or AIDA (but in can help in case you quickly want to get a _better_ overview).


### AMD Threadripper/Epyc and the Core Prio "Bug"

![](https://i.imgur.com/S04e1bp.png=250x250)

~~Threadripper and Epyc CPU's have a serious bug which crippled the performance, [Microsoft and AMD working together to fix this](https://community.amd.com/community/gaming/blog/2018/10/05/previewing-dynamic-local-mode-for-the-amd-ryzen-threadripper-wx-series-processors), however **as a workaround you can use [Bitsum's Coreprio](https://bitsum.com/portfolio/coreprio/)**.~~

Fixed with Ryzen Master v2.0.1.1223 and with Windows 1909. Make sure you installed the latest BIOS and the latest Windows 10 patches. Ryzen Master will then **NOT SHOW THE Dynamic Local Mode** because this is not internally handled (fixed) by Windows. Coreprio is NOT needed anymore!


### Intel Transactional Synchronization Extensions (TSX)

[Intel Transactional Synchronization Extensions (TSX)](https://github.com/CHEF-KOCH/regtweaks/commit/6aef64ec092a3ab1704fdaf6c5b343aa44d2f1cf) is problematic, security and performance wise. Disabling Intel's TSX (closes Zombieload v2) on Haswell, Broadwell and Skylake CPU's but [will affect the application as well as gaming performance](https://www.phoronix.com/scan.php?page=article&item=intel-jcc-gaming&num=2) around 4 up to 8%. 


### MDS: Microarchitectural Data Sampling

Zombieload/MDS security holes affecting newer Intel CPU's (10th gen. except Icelake) as well as older architectures, the full list of affected CPU's are listed over [here](https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00270.html). You can quickly check if you're affected by the security hole with the official [MDS check tool](https://mdsattacks.com/files/mdstool-win-20190519.zip) (or via the script provided over [https://mdsattacks.com/](https://mdsattacks.com/#ridl-ng), the tool/script checks the Intel CPU against Meltdown/MDS and other (current) open security holes.


### Lags
There are several kinds of [gaming releated lags](https://en.wikipedia.org/wiki/Input_lag):
- CPU based lags - This causes the game to stutter, whenever the CPU reaches is max capabilities.
- Rendering based lags - This basically means your CPU & or GPU is to slow to handle the game/stream.
- General Network lag - This basically means your drivers or network are outdated/too slow or there are other interferences.
- [Stream Buffering](https://obsproject.com/wiki/Stream-Buffering-Issues) - This basically means you use too much bitrate and your server which you are streaming at can't handle it. 
- [Dropped Frames And General Connection Issues](https://obsproject.com/wiki/Dropped-Frames-and-General-Connection-Issues) - This can have multiple sources, your ISP, your Router (or it's config), the streaming server or your AV program might blocks or intercept into the connection.
- Software based lags e.g. [Windows 10 Gaming Mode](https://obsproject.com/wiki/How-to-disable-Windows-10-Gaming-Features) - Some Windows or OS related function can cause conflicts or making the game _hang_, this is mostly because of deadlocks (something hooks/inject specific code into another progress). Disabling Windows Game Mode, MSI Afterburner etc might already helps here. Another thing might be outdated software, it's true that an updated software/game/drivers can solves several performance issue, always keep an eye on the changelogs (release notes).

### Multi-GPU

**Stay away from SLI/Crossfire** it's [not worth](https://www.computerbase.de/2019-03/titan-rtx-sli-test/). There are too many unsolved problems since years and I consider it as "dead". To name several problems: Frame times, energy waste, unoptimized games & drivers. It's true that the FPS are higher on a multi-gpu system, however at what costs? Gaming on a single GPU is in most cases good enough unless you play on super high resolutions (5k+). 
