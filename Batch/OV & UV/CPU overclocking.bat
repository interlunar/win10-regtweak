CLS
@ECHO OFF
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    	@powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
	@powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
	@Powercfg -setactive SCHEME_CURRENT
	@ECHO.
	@ECHO CPU Hochgetaktet. Windows jetzt bitte neustarten.
	@ECHO.
	@PAUSE
) ELSE (	
	@ECHO.
	@ECHO Fehler! Diese Datei bitte mit Administrations-Rechten ausfuehren!
	@ECHO.
	@PAUSE
)

