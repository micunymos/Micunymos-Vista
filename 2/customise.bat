@echo off
color 1f
cls
cd /d %~dp0
set /p typ=<InstallType
:usrmgr
cls
echo Micunymos Vista Installer
echo ---------------------------
echo Please choose an action to perform.
echo Actions are: delete, add, colour.
echo You may select the user to perform
echo the action on later.
echo ---------------------------
cd /d %~dp0
cd userlist
dir
set /p action=CHOICE: 
cls
echo Micunymos Vista Installer
echo ---------------------------
echo You may now choose the user
echo to perform the actions on.
echo ---------------------------
dir
set /p user=CHOICE: 
if %action%==add goto add
if %action%==delete goto deluser
if %action%==colour (
cd ..
goto colour
)
goto usrmgr
;
:colour
cls
echo Micunymos Vista Installer
echo ---------------------------
echo Please choose a colour scheme,
echo and type the chosen colours' number below!
echo The first digit corresponds to the background.
echo The second digit corresponds to the foreground.
echo ---------------------------
echo    0 = Black
echo    1 = Red
echo    2 = Green
echo    3 = Orange
echo    4 = Blue
echo    5 = Purple
echo    6 = Light Blue
echo    7 = White
echo ---------------------------
set /p clr=CHOICE: 
echo %clr%>ColourScheme%user%
goto exit
;
goto exit
;
:add
echo What to make the password of said user?
set /p password=Password: 
echo.>%user%
cd ..
echo %password%>%user%
type bgd1080p>bgd%user%1080p
type bgd1440p>bgd%user%1440p
type ColourScheme>ColourScheme%user%
type desktop>desktop%user%
type dsk>dsk%user%
if %typ%==3 type tsk1080p>tsk%user%1080p
if %typ%==3 type tsk1440p>tsk%user%1440p
type act.bat>act%user%.bat
goto eof
;
:deluser
del %user%
cd ..
del act%user%.bat
del dsk%user%
del bgd%user%1080p
del bgd%user%1440p
del desktop%user%
if %typ%==3 del tsk%user%1080p
if %typ%==3 del tsk%user%1440p
del ColourScheme%user%
del %user%
goto eof
;
:exit
echo Press any key, to quit.
pause >nul
goto eof
;
:eof