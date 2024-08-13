@echo off
cls
set LINES=0
setlocal enabledelayedexpansion
%prevcd:~0,1%:
cd %prevcd%
set editfile=%~1
for /f "tokens=*" %%a in (%editfile%) do set /a LINES+=1
:edit
cls
set /a LINES+=1
:editcore
echo [3;1H
echo Micunymos Text Editor
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo %editfile%'s contents are:
echo.
type %editfile%
echo [s
echo [1;1H
echo [44mMICUNYMOS TEXT EDITOR - %EDITFILE% : LINE %LINES%[0m
echo [109mI Exit - Editln I[0m
echo [u
set /p TEXT=
for /d %%a in (%text%) do if %%a==exiteditor exit /b && if not %%a==exit goto editcore
for /d %%a in (%text%) do if %%a==editln set /p edt=Edit line: &&goto editline && if not %%a==editln goto editcore
)
echo %text%>>%editfile%
goto edit
:editline
set saveln=%lines%
cls
powershell -command "& {get-content %editfile% -first %edt%}"> temporary
type temporary
set /p edttxt=Edit text on %edt%: 
set /a "edt=%edt%-1"
call echo %edttxt%>>temporary
:editlinecore
set /a "edt=%edt%+2"
more +%edt% %editfile%>>temporary
type temporary>%editfile%
del temporary
cls
goto editcore &&set lines=%saveln%
endlocal