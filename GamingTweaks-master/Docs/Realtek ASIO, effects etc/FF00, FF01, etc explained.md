## What does FF00 etc stands for?

* FF00 Generic
* FF01 with FMAPO
* FF03 with Nahimic
* FF04 with CXAPO
* FF06 with MaxxAudio
* FF10 with Creative
* FF0C with DTS/SST



#### FF00

FF00 Generic driver comes without thirty-party audio effect support (ForteMedia, Nahimic, MaxxAudio, Creative, Intel) but includes:

* Dolby Atmos
* Dolby Digital Plus
* Dolby Audio
* Dolby Home Theater v4/Dolby Advanced Audio v2
* Dolby Home Theater v3/Dolby Advanced Audio
* Sound Research Effects
* HP Immerive Audio Effects (by Sound Research) (It use other Sound effects from other company, such as SRS, DTS, Bang & Olufsen, beatsaudio)
* DTS Connect
* DTS Studio Sound
* DTS Sound+
* DTS Audio
* DTS: NEO PC
* Sony VAIO Audio Utility
* Sonic Focus
* SRS Premium Sound
* Toshiba Audio Enhancement
* Yamaha Audio Enhancement
* Audio by harman
* Audyssey dynabook Sound Engine
* ICE Audio Wizard
* SoundAlive by Samsung

This is basically the driver which you use in case you provider doesn't use their own Audio Enhancement technology.


#### FF01 (FMAPO)

Driver files:
* FMAPP.dll
* FMAPO.dll
* FMAPO32.dll
* FMAPO64.dll
* FMAPP.dll
* FMAPP.exe

FF01 Generic comes with ForteMedia Microhpone audio effect support, which can be activated in the Realtek Audio Control Panel. 


#### FF03 (Nahimic)

Driver files:
* NAHIMICAPOlfx.dll
* NahimicAPONSControl.dll
* NAHIMICV2apo.dll
* NAHIMICV3apo.dll

This driver is for ASUS Sonic Studio 1-3 and includes Sonic Radar 1-2 software (Sonic Studio and Sonic Radar).

MSI itself uses Nahimic (Nahimic 1, Nahimic 2 and Nahimic 2+ software).


#### FF04 (CXAPO)

Driver files:
* Caf32api.dll
* Caf64api.dll
* Caf32APO2.dll
* CAF64APO2.dll
* CX32APO.dll
* CX64APO.dll
* CX32Proxy.dll
* CX64Proxy.dll
* cxapo.lncs
* cxapo.prop
* CXAPOAgent.exe
* CXAPOAgent64.exe

The driver is mainly for HP which have both Conexant and Realtek audio chipset. A lot of HP laptops using this driver.


#### FF06 (MaxxAudio)

Driver files:
* MaxxAudioAPO20.dll
* MaxxAudioAPO30.dll
* MaxxAudioAPO40.dll
* MaxxAudioAPO4064.dll
* MaxxAudioAPO50.dll
* MaxxAudioAPO5064.dll
* MaxxAudioAPO60.dll
* MaxxAudioAPO6064.dll
* MaxxAudioAPO70.dll
* MaxxAudioAPO7064.dll
* MaxxAudioAPOShell.dll
* MaxxAudioAPOShell64.dll
* MaxxAudioCapture.dll
* MaxxAudioCapture64.dll
* MaxxAudioEQ.dll
* MaxxAudioEQ64.dll
* MaxxAudioMeters.exe
* MaxxAudioMeters64.exe
* MaxxAudioRealtek.dll
* MaxxAudioRealtek.dll
* MaxxAudioRealtek64.dll
* MaxxAudioRender.dll
* MaxxAudioRender64.dll
* MaxxAudioRenderAVX.dll
* MaxxAudioRenderAVX64.dll
* MaxxAudioVienna2.dll
* MaxxAudioVienna264.dll
* MaxxSpeechAPO.dll
* MaxxSpeechAPO64.dll
* MaxxVoiceAPO30.dll
* MaxxVoiceAPO20.dl
* MaxxVoiceAPO2064.dl
* MaxxVoiceAPO30.dll
* MaxxVoiceAPO3064.dll
* MaxxVoiceAPO40.dll
* MaxxVoiceAPO4064.dll
* MaxxVolumeSDAPO.dll

Basically the generic driver but with Waves MaxxAudio audio effect support, this is often used on Dell laptops. MaxxAudio is also used in some ASUS models and includes the ICE Audio Wizard.


#### FF10 (Creative)

Driver files:
* MBAPO32.dll
* MBAPO64.dll
* MBAPO232.dll
* MBAPO264.dll
* mbfilt32.sys
* mbfilt64.sys
* MBPPCn32.dll
* MBPPCn64.dll
* MBTHX32.dll
* MBTHX64.dll
* MBWrp32.dll
* MBWrp64.dll

The driver is for motherboard's and laptop's bundled with Sound Blaster Cinema 1-3/Xi-Fi MB1-5/THX TruStudio Pro.


#### FF0C (DTS/SST)

Driver files:

* IntelSSTAPO.dll
* IntelSSTAPO_FF.dll
* IntelSstCApoPropPage.dll
* IntelSSTPreproc_v124.dll


Some of Realtek's HD Audio Driver coming from OEM's are bundled with Intel SST Driver (it's in a IntelHDASST folder). Intel SST driver needs the Realtek FF0C driver in order to get fully functional, 
the FF0C driver itself does not include the Intel SST Driver (due to license reasons).