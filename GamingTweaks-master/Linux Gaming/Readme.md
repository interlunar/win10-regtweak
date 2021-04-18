### Why should I use Linux for gaming?

* Less or no DRM (_GOG, itch.io and Humble Bundle's DRM-FREE titles_)
* Open source & transparency
* [Advantages, disadvantages and what's coming in the future](https://www.forbes.com/sites/jasonevangelho/2019/07/11/valves-latest-linux-gaming-work-is-boosting-amd-vulkan-performance-by-up-to-44-percent/)
* RAM usage could be overall lower, since Linux loads "less" or more efficient
* Linux has the better ecosystem in general compared to Windows
* For almost every closed source software there is a alternative available, platforms like alternative.to](http://alternativeto.net/) can be used to quickly find alternatives.
* Better input latency and flexibility, Linux is easy when it's well supported
* In-game overlays of all sorts of hardware statistics are possible without large bulky programs
* _Linux can have more FPS than Windows in some [circumstances going back to 2012](http://blogs.valvesoftware.com/linux/faster-zombies/)_
* Some legacy games are running better on Linux via WINE


## Problems with Linux as Gaming platform

* Drivers (_not all_) are still "optimized" for Windows, not available on Linux or are proprietary...
* _Compatibility issues with the software you currently use_
* Emulation might be slow(er)
* Some publisher refusing to port their games or to use API's which are working on every OS ("Windows exclusive" games and game deals)
* [other reasons](https://itvision.altervista.org/why.linux.is.not.ready.for.the.desktop.current.html)


## Workaround for the Gaming situation

Use Linux as your daily OS, but dual boot Windows for those titles which are not going to work under Linux.

Back in 2018, Valve release a compatibility software called [Proton](https://github.com/ValveSoftware/Proton) that is based on [WINE](https://www.winehq.org/). This change was good because it allows to run some (older) games emulated. You can check [ProtonDB](https://www.protondb.com/) to see if your "Windows only" games run fine under it or if there are known problems. WINE itself has a database called [Wine AppDB](https://www.winehq.org/search), which shows if your favourite software works under Wine (emulated) or not.

Via [GPU-Passthrough](https://gpu-passthrough.com/), this is more for experts.


## Gaming Distribution

There are officially only only two [distributions](https://distrowatch.com/) that are [supported by Valve](https://support.steampowered.com/kb_article.php?ref=1504-QHXN-8366&l=english), this is [Ubuntu LTS](https://www.ubuntu.com/download/desktop) and [Steam OS](https://store.steampowered.com/steamos/buildyourown).

However, just because "Valve says so" doesn't mean it isn't possible to game on other distros, here is my list which I recommend which are for gamers and "Windows switcher".

* [elementryOS](https://elementary.io/)
* [Endeavour](https://endeavouros.com/)
* [Fedora](https://getfedora.org/)
* [gamerOS](https://github.com/gamer-os/gamer-os)
* [Linux Mint](https://linuxmint.com/)
* [Manjaro](https://manjaro.org/)
* [Pop!_OS](https://system76.com/pop)
* [Solus](https://getsol.us/home/)

## Software

You can install Steam, and Wine (_if not already preinstalled_) via apt.

```bash
// Install Steam
// sudo means "super user do" and apt is the package manager's name, the install command tells the package manager to install program x
sudo apt install steam
// Install WINE
// Must read: https://wiki.archlinux.org/index.php/Wine
sudo apt install wine
// Update your OS/Software
sudo apt upgrade
```

So you installed every program and everything is running, that#s good. However you might want to use [PlayOnLinux](https://www.playonlinux.com/en/) to improve your "WINE experience" (it's a helper program), an alternative would be [Lutris](https://lutris.net/).


### Which API's working under Linux

From a gaming perspective these API's working fine:
* [D9VK](https://github.com/Joshua-Ashton/d9vk) is a d3d9 to Vulkan-layer based off DXVK's codebase.
* [DXVK](https://github.com/doitsujin/dxvk) is a Vulkan-based D3D11 and D3D10 implementation for Linux and Wine.
* [Gallium Nine](https://github.com/iXit/wine-nine-standalone): Gallium Nine allows to run any Direct3D 9 application with nearly no CPU overhead, which provides a smoother gaming experience and increased FPS.
* [VK9](https://github.com/disks86/VK9) is a Direct3D 9 compatibility layer using Vulkan API.
* WINE currently does not support DirectX 12!

All of these mentioned projects attempt to translate Direct3D calls to something that Linux understands.


### Tutorials

Here are some video tutorials which might help you to setup things.

* [Set Up Manjaro And Arch Linux For Gaming - DXVK / WINE / Steam Proton / Play / Lutris](https://www.youtube.com/watch?v=ftiyvVoeMVs)
* [Install a distribution, install the latest graphic drivers for your GPU, enable DXVK, Esync, installing WINE, Winetricks, Feral Gamemode, Protontricks and Lutris with all dependencies covered](https://www.youtube.com/watch?v=4aboJixPHM4&t=690s)
* [How does Steam Proton / Play work](https://www.youtube.com/watch?v=6FSh0wNWcz4)
* [Installing And Running The Outer Worlds On Linux](https://www.youtube.com/watch?v=RDz7vXNcUPU)
* [Crysis on Linux in DirectX 10 with DVXK](https://linustechtips.com/main/topic/1100643-tutorial-how-to-play-crysis-on-linux-in-directx-10-with-dvxk/)
* [Emulating X360 controller with any gamepad (Wine + Xinput)](https://www.youtube.com/attribution_link?a=QA_CV_s_qKk&u=%2Fwatch%3Fv%3D5uDjAxSoxMU%26feature%3Dshare)
* [Intelligent Gaming - A YouTube Channel Dedicated To Playing Windows Games On Linux](https://www.youtube.com/IntelligentGaming)
* [PCSX2 custom game profiles + Use any game banners with Lutris](https://www.youtube.com/attribution_link?a=NVmjqHXrVqM&u=%2Fwatch%3Fv%3Dj1I0QxEvV4Q%26feature%3Dshare)
* [Beginners Guide To Installing And Using Lutris On Linux](https://www.youtube.com/watch?v=JSK25BqVxoY&t=23s)
* [How to overclock Nvidia cards in linux](https://askubuntu.com/questions/7749/how-can-i-overclock-a-graphics-card-from-within-ubuntu/1037178#1037178)
* [Changing Nvidia GPU Fan Speed (💨 ) Manually Tutorial (Nvidia X Server Setting) (NO NVCLOCK)](https://old.reddit.com/r/linux_gaming/comments/a4hx77/changing_nvidia_gpu_fan_speed_manually_tutorial/)
* [Top Tips For Helping Linux Gaming Grow](https://old.reddit.com/r/linux_gaming/comments/bcyolp/top_tips_for_helping_linux_gaming_grow/)
* [Windows 10 VM under Linux with native performance in gaming](https://www.youtube.com/watch?v=h8LdfZJunrs)


### Some general tips for smoother game experience on Linux

There is a huge wiki about [gaming on Linux with some interesting tricks and tips](https://www.gamingonlinux.com/wiki/).


* Disable the in game overlay from Steam, Discord etc. CS:GO might need this [workaround](https://m.youtube.com/watch?v=BvhiXr2fnRM&t=88s)
* [Steam tweaks](https://github.com/gamer-os/steam-tweaks)
* [Tips on how to improve the overall gaming performance](https://www.protondb.com/help/improving-performance)
* Reduce nVidia game stutters with `__GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1` and other [tweaks](https://old.reddit.com/r/linux_gaming/comments/e32v49/improving_gaming_performance_guide/)
* [Measure the correct Period/Buffer/Sample Rate/Channels for pulseaudio](https://forums.linuxmint.com/viewtopic.php?f=42&t=44862)
* Set your CPU govener to "performance", [gamemode](https://github.com/FeralInteractive/gamemode) can do it for you! Using `cpupower -c all frequency-set -g performance` and `__GL_THREADED_OPTIMIZATIONS=1 mesa_glthread=true gamemoderun %command%` for the specific game or application helps a lot to get rid of micro stutters.
*
