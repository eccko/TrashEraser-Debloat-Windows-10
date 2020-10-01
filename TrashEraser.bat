@echo off
title: by eccko


:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Request administrator permission...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------


 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\game_priority.reg"

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\disable_onedrive.reg"

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\unnecessary_staff.reg


Del /S /F /Q %temp%


powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -executionpolicy remotesigned -file %~dp0\ps_scripts\stock_apps.ps1' -verb RunAs}"

powershell -noprofile -command "&{ start-process powershell -ArgumentList '-noprofile -executionpolicy remotesigned -file %~dp0\ps_scripts\xbox.ps1' -verb RunAs}"

cls
echo TrashEraser executed successfully
echo *****
echo *****
pause
