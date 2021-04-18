### SSD

Setting `fsutil behavior set disablelastaccess 1` still needs to be set manually. There is research on this available [here](https://translate.google.com/translate?hl=en&sl=ja&u=http://blog.livedoor.jp/nichepcgamer/archives/1071061265.html&prev=search).

### TRIM

Since Windows 10, the OS usually checks the [TRIM](https://en.wikipedia.org/wiki/Trim_(computing)) status on his own, but in order to verify it simply run `fsutil behavior query DisableDeleteNotify`. If TRIM is running it will return `DisableDeleteNotify=0` or `DisableDeleteNotify=1` if TRIM is not functioning.

### Disk Defragmentation

You  don't need to disable the internal Disk defragmentation program, it detects which kind of storage you use and start/stop the progress on it's own. There was a Bug with >1607 Builds to detect it, but was fixed later by Microsoft. There is no benefit disabling the schedule (Hibernation) via `powercfg -h off`.

### Enable Write Caching for SSDs

Write caching can theoretically improve performance of both SSDs & HDDs. It's usually enabled by default.

### Write-cache Buffer Flushing

Using this is not recommended in case of a power failure you might loose your data.

### Disable Prefetch and Superfetch

SuperFetch (SysMain) indexes your SSD/HDD which means when you search for certain things, the results are showing up faster (in theory). If you use search utilities like [Everything](https://www.voidtools.com/downloads/) you don't need such function.


```bash
EnablePrefetcher (DWORD value doesn't exist by default and to disable it the value must be 0)
EnableSuperfetch (DWORD value defaults to 3, to disable = 0)
HKEY_LOCAL_MACHINE\Current\ControlSet\Control\Session Manager\Memory Management\PrefetchParameters
```

In Windows RS 5 Build 1809 the service is renamed to SysMain (under services.msc). I could not notice any performance difference but [some people reporting that some application might crashing leaving this service enabled](https://www.tenforums.com/general-support/118718-no-superfetch-service-1809-a-post1477496.html?s=eef7013da02a202c620d0f84ec73f88f#post1477496).


### Optimize or Disable Page File for SSDs

Tweaking this is a myth, the OS and some applications handle it (if needed). Some games/applications can [crash if you disable it entirely](https://lifehacker.com/understanding-the-windows-pagefile-and-why-you-shouldnt-5426041).


### Update Drivers and Firmware

This is maybe the best advice you can find because this [not only closes possible security holes](https://techcrunch.com/2018/11/05/crucial-samsung-solid-state-drives-busted-encryption/) it might fixes performance issues. The rest can be covered by observing [S.M.A.R.T](https://en.wikipedia.org/wiki/S.M.A.R.T.) with a simple check (Windows internal tools or external ones) in order to check the health.


Reference:

* [https://www.howtogeek.com/256859/dont-waste-time-optimizing-your-ssd-windows-knows-what-its-doing/](https://www.howtogeek.com/256859/dont-waste-time-optimizing-your-ssd-windows-knows-what-its-doing/)
* [Why disable SuperFetch on ssd, if RAM is much faster than ssd?](https://answers.microsoft.com/en-us/windows/forum/all/why-disable-superfetch-on-ssd-if-ram-is-much/61b6b215-0f27-473b-9490-b8b297899ac7)
