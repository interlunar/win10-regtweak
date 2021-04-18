### BIOS & UEFI Optimization(s)

Since the BIOS might have the biggest effect (Overclocking (OC)/Underclocking (UC) & Undervolting (UV)) on your hardware/OS you should know what each toggle really does, every single setting is explained in the [BIOS Compendium](http://www.bios-info.de/download/dlkomp.htm), this is basically a _must read_ before you even think about changing something in your BIOS. Don't waste your time Googleing or search for YouTube Video's, read this, it's the best explanation and the most detailed one you can get. 

Use the following advice as per own needs (!), please do keep in mind that e.g. disabling Hyper-Threading (HT) increases the overall security since it reduce the possible attack surface however, at the same time it decreases the performance on e.g. using VM because it _cripples_ the IPC performance drastically on Intel systems. The mentioned settings are only basic examples, it's necessary to review all BIOS settings manually and make a decision yourself, the [BIOS Kompendium](http://www.bios-info.de) helps you since it explains every toggle with much details. 

* Disable Intel Software Guard Extensions ([SGX](https://www.theregister.co.uk/2019/02/12/intel_sgx_hacked/)), there is [no benefit using it](https://arxiv.org/abs/1902.03256) and it slightly affects the CPU performance (if used). 
* ~~Disable High Precision Event Timer (HPET)~~ (not needed after Windows April Update Build 1803 you can check the current status via _bcdedit /enum_)
* Disable CPU Enhanced Halt (C1E), EIST (SpeedStep) & Cool'n'Quiet (if present and in case you OverClock)
* Disable Intel Hyper-threading (_optional_ but recommend due to [security reasons](https://www.extremetech.com/computing/276138-is-hyper-threading-a-fundamental-security-risk))
* Set Performance Enhance/Mode to higher than Standard for faster memory timings
* Set Robust Graphic Booster / PEG Link higher than Auto
* Set CPU PLL Voltage to the most conservative option (Normal), this will improve your overclock reliability. More doesn't traduce to better for this setting.
* Disable SecureBoot (_not recommend_, it has security implications on [both](https://www.securityweek.com/secure-boot-vulnerability-exposes-windows-devices-attacks) [sides](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-secure-boot)!)
* CPU/PCI-E Clock Drive, CPU/MCH Clock Skew: keep them to the lowest possible (lower is better)! 
