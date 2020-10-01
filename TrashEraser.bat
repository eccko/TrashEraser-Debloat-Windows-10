@echo off

title: Writted by eccko

echo github.com/eccko

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\game_priority.reg"

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\disable_onedrive.reg"

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\unnecessary_staff.reg"
 
 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\cortana.reg"

 rem  set __COMPAT_LAYER=RunAsInvoker  
 REGEDIT.EXE  /S  "%~dp0\reg_files\photo_viewer.reg"

Del /S /F /Q %temp%

pause
