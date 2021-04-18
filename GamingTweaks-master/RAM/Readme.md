### RAM & Windows game stutter

On AMD Threadripper systems you can enable Dynamic Local Mode, which acts like something which prioritize the RAM (needs a restart). In the future [AMD is going to do this with a software automatically in the background](https://community.amd.com/community/gaming/blog/2018/10/05/previewing-dynamic-local-mode-for-the-amd-ryzen-threadripper-wx-series-processors). Dynamic Local Mode (DLM) can be controlled via a Windows Service (on/off) and the needed update in order to get this automatically controlled will be introduced October 29. 2018 with an chipset driver update (and is for now an [Windows exclusive function](https://en.m.wikipedia.org/wiki/SCHED_DEADLINE) because Linux already handles it better).

### General Game stuttering (every xyz seconds)

* Check your OS Event Reporter tools for signs of hardware failures
* Check the PSU (and the rest of your hardware components)
* Is your Sound card/GPU/SSD/M.2 in the correct slot? 16x and not 1x/4x? 
* Have you checked your PSU again?

Assuming that your hardware is 100% perfect and working you can use one of these tools in order to workaround the Windows integrated compression bug, see [here](https://github.com/CHEF-KOCH/GamingTweaks/tree/master/Tools/RAM).
