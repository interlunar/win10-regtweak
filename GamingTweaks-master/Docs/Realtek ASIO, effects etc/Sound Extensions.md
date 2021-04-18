What is the difference between HDA and UAD?
=========

HDA (High Definition Audio Drivers)

These drivers are the based on the old win32 API.

These are the generic drivers which are working on all Windows versions. The driver is much bigger because it also includes 'software' to control some extra audio effects. 


UAD (Universal Audio Drivers)

These drivers are UWP ready (win32 application replacement which is more efficent).

These drivers are for Windows 10 RS2/RS3 & RS4 only. They contain only the driver files and (sometimes) audio effects among ASIO etc in it. The benefit is that they are smaller in size, work for all manufractures (except if it's an specific OEM release only) and they have no extra audio effect software in it because Windows controls it automatically with the new Audio Interface and their options (e.g. Spatial sound). 

UAD will replace HDA drivers over the long run. 


Structure
=========

```bash
/Config = Configuration files
	/Win64 contains the OEM specific inf (driver)
		/Win64/Realtek/
						* Codecs
						* ASIO
						* HSA
						* Service
						* Creative
		
	/Win64/ThirdParty/
						* Nahimic with A-Volute APO SWC and MSI Oem INF extension (A-Volute APO - SWC)
						* OEM INF Extension - MSI (A-Volute Nh3 Audio Effects Component)
						* Creative SB Cinema v 2 DSP with Creative SBC, extension and component

```						
						
						
You usually can't install the 'incorrect' driver if you install it via Setup.exe, in case your driver is incompatible you get after the new driver Installation process an error before any files are been copied. 

In case you manual install the driver (via .inf) ensure your ID really matches the OEM specific ID. If an UAD is offered over WUS, then you can simply let the driver assistant search for the correct .inf file (some WSUS driver don't have any Setup.exe - the ones which are coming in .cab files or via Update catalogue).



Realtek Audio Control:
* https://www.microsoft.com/en-us/store/p/realtek-audio-control/9p2b8mcsvpln


Realtek WSUS (replace search number with realtek or another number):
* https://www.catalog.update.microsoft.com/Search.aspx?q=6.0.1.8464