### FreeSync Gaming on AMD

An official guide is available over [here](https://www.amd.com/en/support/kb/faq/dh-019).

```bash
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\AMD\Chill]
"ChillLevelDefault"=dword:00000002
"MaxFramerateDefault"=dword:00000046
"MinFramerateDefault"=dword:00000040
"MaxFramerateRange"=dword:00000064
"MinFramerateRange"=dword:0000001e
"ProfileEnableDefault"=dword:00000000

CN response time:
[HKEY_LOCAL_MACHINE\SOFTWARE\AMD\CN]
"PreloadDelay"=dword:000000c8
"UnloadDelay"=dword:000000c8
```


### AMD (Image Quality [IQ] improvements)

* Anti-Aliasing Mode > Enhance application settings
* Anti-Aliasing Mode > Morphological filtering
* Anti-Aliasing Filter > Edge-detect
* Texture Filtering Quality > High Quality
* Adaptive Anti-Aliasing > Quality > Method Super-sampling > Enabled


### AMD specific bug (caused by Windows) which causes massive performance issue

According to [LeveloneTechs](https://level1techs.com/article/unlocking-2990wx-less-numa-aware-apps) [Video](https://www.youtube.com/watch?v=M2LOMTpCtLA&feature=youtu.be) Windows has a kernel issue which prevents Epyc/Threadripper (Zen 2) CPU's to get the maximum performance out of all cores. There is currently no fix for that but as a workaround you can use [Coreprio](https://bitsum.com/portfolio/coreprio/). 


Microsoft & AMD needs to inspect, verify and maybe fix it. 