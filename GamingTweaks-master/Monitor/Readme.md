## Monitor Overclocking

* [GamersNexus](https://www.gamersnexus.net/guides/1674-overclock-monitor-higher-refresh-rate) has a nice guide to get started into the topic - worth to read!

Why overclock your Monitor?
-------------

* Higher Refresh Rate(s)
* Custom Resolution
* Fix/Correct missing/wrong [EDID](https://en.wikipedia.org/wiki/Extended_Display_Identification_Data) values
* Correct/change or expand FreeSync range(s)
* _Smoother fps gameplay_


Possible Disadvantages
-------------

* Artifacts or no picture output 
* The settings you made must be imported and applied manually after each new driver installation (import/export)
* Skipped frames (even if the monitor accepted the new values and everything seems "fluid")
* HDCP might break or DRM fails
* Color _might be_ changed after applying the changes use [Color Sustainer](http://www.guru3d.com/files-details/color-sustainer-download.html) to correct this. (This is a OS issue!)


Possible Risks?
-------------

**None** (!), every change is temporarily until you approved the change. You can import/export profiles and backup the current states before you do any serious change. The hardware itself will not be affected in case something went wrong. 


Tools needed
-------------

* [Custom Resolution Utility (CRU)](https://www.monitortests.com/forum/Thread-Custom-Resolution-Utility-CRU)
* (optional) [AMD/ATI Pixel Clock Patcher](https://www.monitortests.com/forum/Thread-AMD-ATI-Pixel-Clock-Patcher)
* (optional) [NVIDIA Pixel Clock Patcher](https://www.monitortests.com/forum/Thread-NVIDIA-Pixel-Clock-Patcher)



### Color profile(s)

Make sure you install a correct [ICC Color profile](http://www.tftcentral.co.uk/articles/icc_profiles.htm#install). You can right-click on it and install it or place it manually under `\System32\Spool\Drivers\Color`. You should work with two profiles, one for applications such as Office and one for Gaming (if you have a separate monitor for _gaming only_ you can skip this part and only apply the gaming color profile. 

If possible:
- Go with an IPS panel (yep, even for gaming such as the ASUS ROG PG279Q)
- See if you get a compromise between HZ, Color and viewing angle
- Good reviews are coming from professional sites like [prad.de](https://www.prad.de/), [TFT Central](http://www.tftcentral.co.uk/) or [ExpertReviews](https://www.expertreviews.co.uk/accessories/pc-monitors).
- Make sure that you correctly [calibrate your Monitor](https://www.digitaltrends.com/computing/how-to-calibrate-your-monitor/). In case that you can effort a hardware Colorimeter such as the [i1Display Pro](https://www.xrite.com/categories/calibration-profiling/i1display-pro) prefer this instead.


## FPS capping

Why is capping the FPS important?
---------------

There is an detailed answer [here](https://www.blurbusters.com/howto-low-lag-vsync-on/) in short: you should **ALWAYS CAP THE FPS** which results in a smooth stutter and lag-free experience. RTSS Rivatuner Statistics Server is more accurate than most (not all) in-game FPS limiter, the nVidia own limiter adds some delay to it and is not recommend to use!


## Performance issues with multi-monitors

Multiple monitors plugged _might_ causes performance issues which is depending on the game engine and if you do other tasks to the same time on other monitors. A workaround is to Unplug non-primary monitors or to ensure that every monitor runs at the same Hz.

## Using Variable Refresh Rate (FreeSync)

The new [VRR](https://devblogs.microsoft.com/directx/os-variable-refresh-rate/) **does not** replace the traditional FreeSync / Adaptive-Sync! The new Windows toggle doesn’t override any of the settings you’ve already configured in the FreeSync or Adaptive-Sync control panels.

Requirements:
- Windows 1903+
- WDDM 2.6+ driver
- FreeSync or Adaptive-Sync capable monitor
- DX11 full-screen game which does not support VRR natively

## Enabling dithering for nVidia Geforce GPUs (non-Quadro GPUs/Linux)

**Worth knowing**
* Under AMD Temporal dithering is (by default) on.
* [Intel Graphics tweak tool](https://github.com/nitrocaster/igfxtweak) can adjust Intel's dithering. Newer Intel driver have dithering disabled by default.
* Programs like Handbreak automatically seems to apply dither when converting to 8 bit.
* Since nVidia driver v353.06 users can select bit depth in the Nvidia Control Panel on all systems, if you see 10-bit Nvidia will automatically dither down to the bit depth selected if it is lower. If you can select 10-bit in Nvidia CP, the driver will not dither and sent true 10bit signal to your display.
* Nvidia will not dither 10-bit input when set to 12-bit.


Dithering on Nvidia GPUs are usually only present with Quadro GPUs, the only [exception are GeForce drivers under any Linux OS](https://us.download.nvidia.com/XFree86/Linux-x86/375.10/README/xconfigoptions.html). The user [Guzz](https://forums.geforce.com/member/1822975/) discovered a way to [unlock the hidden registry entry "DitherRegistryKey"](https://forums.geforce.com/default/topic/1082681/geforce-drivers/is-it-possible-to-quot-port-quot-dithering-from-nvidia-x-server-to-geforce-driver-/post/5934577/#5934577). __The method seems to be stable for Windows 7 up to Win 10 1607. Later OS versions seems to have massive problems.__ [Linux handles it a bit different from Windows](https://help.teradici.com/s/article/1048).

**Drawbacks**
* Constant [banding](https://loopit.dk/banding_in_games.pdf) everywhere on 1903+ (?)
* Disable dithering -> shut down -> turn on PC -> enable dithering seems the best way to workaround the problems.
* Nvidia drivers (300+) rounding VCGT from 16-bit to 8-bit with certain scenario such as after monitor wake up from sleep or after computer wake up from sleep which might causes problems.
* Multi-Monitor problems.

