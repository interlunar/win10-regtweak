:: IDM Registry Cleaner
:: Completely cleans registry of all IDM fake serial leftovers

@ECHO OFF
@TITLE IDM Registry Cleaner
@COLOR 0E
@ECHO :: IDM Registry Cleaner
@ECHO :: Compeletely cleans registry of all IDM fake serial leftovers
@ECHO.

TASKKILL /F /IM IDMan.exe
@ECHO.

@echo HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_CURRENT_USER\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_CURRENT_USER\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_CURRENT_USER\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_LOCAL_MACHINE\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} [7] >permdel.txt
@regini permdel.txt
@echo HKEY_LOCAL_MACHINE\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} [7] >permdel.txt
@regini permdel.txt
@del permdel.txt

@ECHO.
REG DELETE HKCU\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} /f
REG DELETE HKCU\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} /f
REG DELETE HKCU\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} /f
REG DELETE HKCU\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} /f
REG DELETE HKLM\Software\Classes\Wow6432Node\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} /f
REG DELETE HKLM\Software\Classes\Wow6432Node\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} /f
REG DELETE HKLM\Software\Classes\CLSID\{7B8E9164-324D-4A2E-A46D-0165FB2000EC} /f
REG DELETE HKLM\Software\Classes\CLSID\{5ED60779-4DE2-4E07-B862-974CA4FF2E9C} /f

@ECHO.
REG DELETE HKCU\Software\DownloadManager /v CheckUpdtVM /f
REG DELETE HKCU\Software\DownloadManager /v scansk /f
REG DELETE HKCU\Software\DownloadManager /v tvfrdt /f

@ECHO.
REG DELETE HKCU\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7} /f
REG DELETE HKCU\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192} /f
REG DELETE HKCU\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671} /f
REG DELETE HKLM\Software\Classes\CLSID\{07999AC3-058B-40BF-984F-69EB1E554CA7} /f
REG DELETE HKLM\Software\Classes\CLSID\{6DDF00DB-1234-46EC-8356-27E7B2051192} /f
REG DELETE HKLM\Software\Classes\CLSID\{D5B91409-A8CA-4973-9A0B-59F713D25671} /f

@ECHO.
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Internet Download Manager" /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Internet Download Manager" /f

@ECHO.
REG DELETE HKEY_CURRENT_USER\Software\DownloadManager /v FName /f
REG DELETE HKEY_CURRENT_USER\Software\DownloadManager /v LName /f
REG DELETE HKEY_CURRENT_USER\Software\DownloadManager /v Email /f
REG DELETE HKEY_CURRENT_USER\Software\DownloadManager /v Serial /f
REG DELETE HKEY_USERS\S-1-5-21-2754736582-2265559669-3571272114-1001\Software\DownloadManager /v FName /f
REG DELETE HKEY_USERS\S-1-5-21-2754736582-2265559669-3571272114-1001\Software\DownloadManager /v LName /f
REG DELETE HKEY_USERS\S-1-5-21-2754736582-2265559669-3571272114-1001\Software\DownloadManager /v Email /f
REG DELETE HKEY_USERS\S-1-5-21-2754736582-2265559669-3571272114-1001\Software\DownloadManager /v Serial /f
@ECHO.

@ECHO :: IDM registry cleaning is complete.
@ECHO :: Next step, block all IDM IPs via a firewall.
@ECHO :: After, run IDM and register with a fake serial.

@ECHO.
@PAUSE