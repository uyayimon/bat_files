@echo off
setlocal enabledelayedexpansion

set x=%*

rem check argumant
if "%~1"=="" (
  exit /b
)

set /p BEFORE=BEFORE:
set /p AFTER=AFTER:

for %%I in (!x!) do call :sub "%%I"

endlocal


:sub
set FILE_NAME=%~nx1
echo %FILE_NAME%

call set FILE_NAME=%%FILE_NAME:%BEFORE%=%AFTER%%%
echo %FILE_NAME%

rem set %[変数名]=[変数名]:[置換前の文字列]=[置換後の文字列]%
rem call set [変数名]=%%[変数名]:%[置換前の文字列の変数]%=%[置換後の文字列の変数]%%%

rename %~1 %FILE_NAME%
