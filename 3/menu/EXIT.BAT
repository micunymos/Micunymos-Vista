cd %pcd%
echo Logging off . . .
watifor a /t 1 >nul
cls
type pwr
echo [0;0H
echo Stopping services . . .
echo.
echo Logging off . . .
echo.
waitfor a /t 1 >nul
cls
if %acpi%==0 (
if %resolution%==1 echo [38;2;255;92;0m[34;97HIt is now safe to turn off your computer.&&goto halt
if %resolution%==2 echo [38;2;255;92;0m[45;137HIt is now safe to turn off your computer.&&goto halt
)
if %acpi%==1 (
type pwr
echo [16;0H
echo I                                       Shutting down . . .
ping localhost -n 3 >nul
echo I                                       Exitting Micunymos Vista . . .
ping localhost -n 3 >nul
exit
)
:halt
	pause >nul
	goto halt
;