@echo off
 
::Get full access to all Registry related sub-keys
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=administrators=f
subinacl /subkeyreg HKEY_CURRENT_USER /grant=administrators=f
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=administrators=f
subinacl /subdirectories %SystemDrive% /grant=administrators=f
subinacl /subkeyreg HKEY_LOCAL_MACHINE /grant=system=f
subinacl /subkeyreg HKEY_CURRENT_USER /grant=system=f
subinacl /subkeyreg HKEY_CLASSES_ROOT /grant=system=f
subinacl /subdirectories %SystemDrive% /grant=system=f
 
@Echo =========================
@Echo Finished ٩๏̯͡๏۶ !
@Echo =========================
@pause
