## Patch Related Performance Impact

### KB4482887

[KB4482887](https://support.microsoft.com/en-au/help/4482887/windows-10-update-kb4482887) does _for some users_ decrease the gaming performance, however it does [not have anything to do with Retpoline](https://old.reddit.com/r/microsoft/comments/ax18s7/kb4482887_caused_major_performance_issues_for_me/ehrtr4b/) changes because it's [not enabled by default](https://www.borncity.com/blog/2019/03/05/windows-10-retpoline-spectre-2-schutz-manuell-aktivieren/). Microsoft official says that you can ignore/uninstall or [hide](https://support.microsoft.com/de-de/help/4026726/windows-hide-windows-updates-or-driver-updates) the update. They promise to fix the performance issue with the next patchday.

```
// Microsoft statement
After installing KB4482887, users may notice graphics and mouse performance degradation with desktop gaming when playing certain games (eg: Destiny 2)"...
```

Fixed with Windows 10 Build 17763.379 and [KB4489899](https://support.microsoft.com/en-us/help/4489899/windows-10-update-kb4489899).


## Build 1809 17763.503 - KB4494441

[Retpoline](https://techcommunity.microsoft.com/t5/Windows-Kernel-Internals/Mitigating-Spectre-variant-2-with-Retpoline-on-Windows/ba-p/295618) is activated by default with [KB4494441](https://support.microsoft.com/en-us/help/4494441/windows-10-update-kb4494441) if Spectre Variante 2 (CVE-2017-5715) was activated (manually) before the KB was installed.


## Build 1903 - KB4515384 (Audio Gaming Issue)

This KB introduced several Audio API changes, as a result people reported that their in-game sound was very low, muffled or "strange". Some people even said that this might causes several games to "hang" (Overwatch, Apex Legends, WoW Classic, and PlayerUnknown's Battlegrounds (PUBG)) for a short amount of time.

Microsoft seems aware of the issue and provides a workaround. 

> "To mitigate the issue, open settings in the impacted game and disable multi-channel audio, if this option is available. You can also search in the Windows Control Panel for third-party audio device control panels and disable Multi-channel audio or Virtual Surround Sound, if these options are available.

> We are working on a resolution and estimate a solution will be available in late September."

Another workaround is, in case a game does not provides such an option, to change your audio properties within your sound cards control panel. It's not recommend to uninstall the update because it fixes over 79 vulnerabilities, it also fixes a SearchUI.exe CPU usage problem.