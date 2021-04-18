### FreeSync Gaming on Nvidia (Adaptive Sync)

Open the Nvidia Control Panel, browse to “Set up G-Sync”, then select your FreeSync monitor. From here, make sure both the “enable G-Sync, G-Sync compatible” checkbox and the “enable settings for the selected display model” checkbox are ticked. The second checkbox doesn’t appear if the monitor is G-Sync certified. Then click Apply, your monitor will restart and adaptive sync will be enabled.


### Control Panel and it's toggles 

[TweakGuides](http://www.tweakguides.com/NVFORCE_6.html) has a full documentation what each toggle/settings in the nVidia Control Panel (NVCP) does, I highly suggest that you read it before you touch any of the settings. The Guide constantly gets updates as soon nVidia changes something in the NVCP. The default settings are usually fine and you might only want to tweak the application/game settings related profiles, which you can do via the NVCP or [nVidia Inspector](https://github.com/DeadManWalkingTO/NVidiaProfileInspectorDmW) (unofficial utility).


### nVidia Shader Cache on a HDD

Shaders are loaded by the game itself, like any other of their assets, and sent to the driver for compilation (meaning transformed from source code form into binary form that can be used by the GPU.) The driver compiles them and sends the results back to the game. The compilation happens by the CPU, not the GPU, and is slow. A shader cache doesn't get rid of the loading-from-disk step. It only replaces the compilation step with a second loading step (loading the previously compiled form of the shader from disk and sending that to the game.) Even with a very slow disk, loading small already compiled shader files from said disk is much faster than generating them again. The shader cache is meant to persist between reboots. Putting them on a RAM disk meaning losing the cache on reboot - unless you're syncing the RAM disk to disk on reboot.


### How to get Windows 10 custom resolutions in any aspect ratio you want

[jim2point0](https://www.deadendthrills.com/forum/discussion/504/how-to-custom-aspect-ratios-and-resolutions-via-dsr-nvidia-only) wrote an excellent guide how to _optimize_ nVidia's DSR via registry in order to get any resolution you want. 
