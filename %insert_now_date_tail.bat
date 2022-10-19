@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
  exit /b
)

set x=%*

set today=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%

set time2=%TIME: =0%
set now=%time2:~0,2%%time2:~3,2%%time2:~6,2%

for %%I in (!x!) do call :sub "%%I"

endlocal


:sub
echo %~1
set filename_bef=%~n1
set extension=%~x1

rem _YYYYMMDD
set filename_aft=%filename_bef%_%today%%extension%
rem _YYYYMMDD_hhmmss
@REM set filename_aft=%filename_bef%_%today%_%now%%extension%

echo %filename_aft%
pause

rename %~1 %filename_aft%
