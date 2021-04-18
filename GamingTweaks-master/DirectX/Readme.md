### DirectX Control Panel

Some old(er) Games (and Emulators) might suffering from and outdated Engine which aren't compatible anymore with the latest Windows 10 DirectX changes, the [DirectX Control Panel](http://www.sephiroth-j.de/1/downloads/diverses.php#windows_dxcpl) utility addresses some of those engine related problems which means you can for example re-enable Hardware Acceleration functions on them.

Another way (without utility) would to do this manually for every Game via Registry but this is in most of the cases too complicated and not necessary since the utility is freeware and small in size it should be no problem to dl and use it, in most of the cases the program still does it's job.


### DirectX 11 vs 12 and FPS drops/stutters

According to this [post](https://linustechtips.com/main/topic/564099-fresh-problems-for-nvidia-users-running-directx-12/) and [Computerbase benchmark](https://www.computerbase.de/2019-03/hitman-2-directx-12/) most (if not all) modern D3D12 games (with nVidia hardware) have a regression which means you lose like _5 ~ 10%_ in performance once you [DX12](https://www.extremetech.com/extreme/207598-demystifying-directx-12-support-what-amd-intel-and-nvidia-do-and-dont-deliver). This is not fixable and a problem on nVidia side (AMD is not affected also not with Vulkan API based games e.g. Doom 2016). nVidia itself mention ['Do's and Dont's'](https://developer.nvidia.com/dx12-dos-and-donts) but this doesn't help the enduser since this is depending on how the developer implements this suggestions in their game(s).

Recommendations:
- Switch back to DX11 or try to play Vulkan API based games (e.g. DOOM 2016).
- Cap the FPS (FPS cap [no matter which hardware] **is a must if you stream or record the game!**) The reason is that capturing programs like OBS Studio/XSplit etc trying to get as much as possible on resources for their own progress, overall it's all about resource management.
- Try to contact the developer and give him as much as details as you can provide, the best way would be to address this in a patch
- Make sure you use the last Windows 10 version, since older versions might suffer from additional DX problems
- Play (or try to switch [if possible]) Vulkan API based games such as Doom 2016 (this game runs the same on all hardware as proven [here](https://www.youtube.com/watch?v=1hnI6KGTfjI)). Personally it's beyond me why OBS Studio and several popular games does not supporting Vulkan API because it's known to run better than DirectX. _I assume it has something to do with exclusive Microsoft deals to keep this alive_ or due to backward compatibility.
