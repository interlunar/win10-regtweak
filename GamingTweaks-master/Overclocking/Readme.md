### General OC & stability

* Turn off all power features in your current BIOS settings. **No EIST, C1, C3, C6, etc**. Lock the CPU (cores) at one speed, and keep it there otherwise you might see BSOD's or other application related crashes during your tests/benchmarks!
* (_optional_ - to test the stability) Rerun Windows System Assessment Tool (WinSAT) after updating your drivers, changing hardware or overclocking via 'winsat formal -restart clean'.
* Setting `dynamictick` & `tscsyncpolicy` might helps to increase the stability. An official explanation is given over [here](https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/bcdedit--set).

```bash
//Enable dynamictick & tscsyncpolicy
bcdedit /set useplatformclock true
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set disabledynamictick yes

// Remove dynamictick & tscsyncpolicy (OS default)
bcdedit /deletevalue useplatformclock
bcdedit /deletevalue tscsyncpolicy
bcdedit /deletevalue disabledynamictick
```


## AMD specific


#### RAM OC on Zen

Overclocking isn't just about getting more MHz it also means and requires that you understand how your hardware works. RAM overclocking is critical because it might instantly results in crashes, BSOD's or freezes when done wrong. Reading the correct values is mandatory and helps to find the _best OC potential_ and also helps with the CPU limitations, especially on AM4- & TR4-systems.


* Download [DRAM Calculator for Ryzen utility](https://www.techpowerup.com/download/ryzen-dram-calculator/) - it's free
* Follow the [step-by-step guide](https://www.techpowerup.com/reviews/AMD/Ryzen_Memory_Tweaking_Overclocking_Guide/)
* (_optional_) Taiphoon Burner tool (see reference) is a useful free program to read-out your current DRAM configuration, which can be exported as HTML-Report. You can import the file into DRAM Calculator in order to start with the correct values. This helps to calculate a more specific OC-Profile based on your RAM-Kit.


#### Boost (Turbo)

[AMD confirmed an firmware issue](https://twitter.com/AMDRyzen/status/1168901636162539536?ref_src=twsrc%5Etfw) with the (latest) AMD Ryzen-3000-CPUs (Family: "Matisse"). This problem lead into a reduced turbo clock speed. A firmware update (Bios update v46.44.00). [AGESA Combo-AM4 1.0.0.4](https://www.reddit.com/r/Amd/comments/dtgutp/an_update_on_the_am4_platform_agesa_1004/) fixes all known issue.

M4 Platform Updates
AMD has recently released a new AGESA to manufacturers, version 1004. 
With over 150 changes, this is a significant milestone release in the 
development of the AM4 platform. We wanted to share some background in 
support of our release and particularly in advance of the AMD Ryzen 9 
3950X processor launch on Nov. 25th.

**AM4 Platform Updates**
> AMD has recently released a new AGESA to manufacturers, version 1004. 
With over 150 changes, this is a significant milestone release in the 
development of the AM4 platform. We wanted to share some background in 
support of our release and particularly in advance of the AMD Ryzen 9 
3950X processor launch on Nov. 25th.

**AGESA 1004 Schedule**
> AGESA 1004 is primarily focused on stability, and here are the essentials you need to know:

> This is the only AGESA validated and recommended for the AMD Ryzen 9 3950X. Your motherboard must have a BIOS with AGESA 1004 for full and proper support.

> It adds final support for "Eco Mode," accessible via Ryzen Master. Eco Mode brings AMD Configurable TDP (cTDP) 
technology to 3rd Gen Ryzen. With one button, you can run a 95W/105W model at 65W, or 65W models at 45W. This feature has been especially fun to use with the 3900X – 12 cores at 65W! We know some of you have been very interested in a configuration like this, and now you can have it with the touch of a button. 

> AGESA 1004 is the "big one" that reunites the codebase for all AM4-compatible processors. Up until now, 3rd Gen Ryzen  has been a fork of the mainline. So, if you have an older Ryzen CPU and have been waiting for a major AGESA release: this is it! This will allow motherboard vendors to unify their CPU and chipset support lists on one codebase.

> As a major stability release, you're undoubtedly curious about the major changes. Here are some of the big ones:
> * AMD X570 stability and compatibility with add-in devices.
> * Improvements to interoperability of PCIe, USB, SATA, and device reset capabilities.
> * Additional enhancements for PCIe device support and stability.
> * Improved system stability when switching through ACPI power states.
> * Improved POST/boot times. This will vary by motherboard.

> There are also two performance enhancements: 
> * improvements to fastest core utilization, and further boost frequency 
> * optimizations for the AMD Ryzen 9 3900X.

> Because of the size and complexity of AGESA 1004, and the extensive regression testing required on older motherboards (unified codebase), please expect the QA and release schedule to take a few weeks yet for older motherboards. For newer motherboards, like AMD X570, releases have already started to hit the web over the past 2 weeks.

>In summary, lots of goodness coming in AGESA  1004 and we look forward to hearing your feedback. Thanks for reading—We really appreciate it.


### Reference & Tools
* [AMD Ryzen Memory Tweaking & Overclocking Guide](https://www.techpowerup.com/reviews/AMD/Ryzen_Memory_Tweaking_Overclocking_Guide/)
* [HCI MemTest](https://hcidesign.com/memtest/)
* [Taiphoon Burner](http://www.softnology.biz/)
