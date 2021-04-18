icacls "C:\program files\opera x64\opera.exe"  /setintegritylevel low
icacls "C:\Users\sec web\AppData\Local\Opera Software" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\sec web\AppData\Roaming\Opera Software"  /setintegritylevel(oi)(ci) low /t