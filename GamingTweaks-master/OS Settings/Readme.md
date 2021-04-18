## OS specific functions and their impact on the overall game performance


### Windows 10 Game Mode
[Game Mode](https://support.xbox.com/en-US/games/game-setup/use-game-mode-gaming-on-pc) - Game Mode allows the system to prioritize CPU and GPU resources to the game running in the foreground, and aims to provide an increase of overall frame rate, or peaks, as well as an increase of average frame rate, or consistency. In the latest versions of Windows starting with Build 1809 & 1903, Game Mode no longer does GPU/CPU prioritization! This means (background) processes get more resources in case other applications e.g. OBS Studio starving your other (free) resources to death (e.g. because encoding).

* Enabling Game Mode stops/prevents Windows Update from updating drivers and stops it from notifying you of non-critical updates.
* It forces (if enabled) to use minimum of 100% CPU resources on Desktop systems (not laptops!) in order to help reduce CPU fluctuations which may cause performance issues. It does exactly the same thing as doing it manually by going to Processor power management and setting `Minimum processor state` manually to 100% (high performance power plan).
* Game mode **is not** enabled by default, this is based on the used Windows version. Starting with 1809+ the game itself can decide to enable (use) Game Mode or not. The supported game list will automatically been updated, based if xyz game does ultilize Game Mode.
* Game Mode works different on laptops to avoid overheating issues.

That been said, turn on Game Mode in 1903+ builds **does not hurt** the gaming performance anymore. The statement: "It prioritizes the game process and suspends windows system processes as much as possible." is not valid anymore on newer Windows builds.


### Fullscreen Optimizations 
[Disable fullscreen optimizations for an application](https://support.microsoft.com/en-us/help/15078/windows-make-older-programs-compatible) - The Fullscreen Optimizations for Apps and Games feature is enabled by default in Windows 10 which is suppose to enhance your gaming experience by prioritizing your CPU and GPU resources to your games and apps.


### Retpoline
[Retpoline](https://www.zdnet.com/article/microsoft-rolls-out-googles-retpoline-spectre-mitigation-to-windows-10-users/) - Basically spoken a new mitigation method against [Spectre variant 2](https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)) by Google, however [Retpoline is not applicable to Skylake and later processors from Intel](https://news.ycombinator.com/item?id=16072775). It can have an [huge impact on game performance](https://www.techspot.com/news/79038-microsoft-introduces-drastic-performance-fix-spectre-variant.html). It is still _not entirely_ fixed.


### Disabling Windows Update 
* Disable driver updates delivered through Windows Update - Microsoft can deliver an outdated or even in worse case scenarios deliver a wrong driver which then has an impact on your overall OS performance. I suggest to manually install all drivers and keep an eye on them.


### Memory Compression
[Memory compression](https://www.techrepublic.com/article/how-to-monitor-memory-compression-in-windows-10/) - Disabling memory compression can [increase application stability while using demanding games for CPU](https://www.dobreprogramy.pl/deton24/Dlaczego-moje-gry-sie-zacinaja-diagnostyka-Ustawianie-pliku-wymiany-ReadyBoost-Testy-trybu-gry-i-kompresji-pamieci-w-Windows--porady,85501.html). Some games (not all) benefit from the memory compression enabled.


#### Control Flow Guard (CF-Guard)
[Disable "Control Flow Guard"](https://docs.wholetomato.com/default.asp?W790) - In general you should never disable this optional on a global basis, however [some applications](https://windowsreport.com/windows-10-windows-10-cfg-slow-browser/) can get a slight boost (e.g. faster loading times) when disabled. My advice is to leave it on.


### Force CPU affinity
[Force CPU affinity](https://support.microsoft.com/en-ph/help/296930/registry-values-for-process-control-parameters) - You don't need programs like ProcessLasso for this, you can use [ProcessHacker](https://processhacker.sourceforge.io/) or Microsoft's own [ProcessExplorer](https://docs.microsoft.com/en-us/sysinternals/downloads/process-explorer). The Windows own [Task Manager does not store the tweak permanently](https://i.imgur.com/wCOwRZS.png) (!). It needs to be reapplied each time the process launches. Keep in mind that this tweak is questionable it is depending on the application.
