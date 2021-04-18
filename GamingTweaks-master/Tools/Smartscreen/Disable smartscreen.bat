takeown /f "%systemroot%\System32\smartscreen.exe" /a
icacls %systemroot%\System32\smartscreen.exe" /reset
taskkill /im smartscreen.exe /f
icacls %systemroot%\System32\smartscreen.exe" /inheritance:r /remove *S-1-5-32-544 *S-1-5-11 *S-1-5-32-545 *S-1-5-18
