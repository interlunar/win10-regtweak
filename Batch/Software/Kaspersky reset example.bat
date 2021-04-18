@echo off
if %processor_architecture% == AMD64 goto X64
if %processor_architecture% == x86 goto X86
:X86
reg add HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\AVP15.0.2\environment /v TrialActCode_kis /t REG_SZ /d "DB AC A7 DB AC BF BF A9 AB BB A1 A9 A4 DB AD DB DA BD D9 D6 " /f
:X64
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\KasperskyLab\AVP15.0.2\environment /v TrialActCode_kis /t REG_SZ /d "DB AC A7 DB AC BF BF A9 AB BB A1 A9 A4 DB AD DB DA BD D9 D6 " /f