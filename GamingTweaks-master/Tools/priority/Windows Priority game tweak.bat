start steam://rungameid/271590

timeout 60

wmic process where name="GTA5.exe" CALL setpriority "high priority"

wmic process where name="gtavlauncher.exe" CALL setpriority "idle"

wmic process where name="subprocess.exe" CALL setpriority "idle"
