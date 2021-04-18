@echo off
echo.
echo  *********************************************
echo  * AMD Ryzen 3k.x Power-Plan-V3 by CHEF-KOCH *
echo  *********************************************
echo. 
echo Installing...
echo.
powercfg -import "%~dp0\AMD Ryzen 3k.x Power-Plan-V3 by CHEF-KOCH.pow"
echo.
echo.
echo The power plan has been installed, please activate it via "power options" - "additional plans"
echo.
pause

