@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
  exit /b
)


set arg=%*

rem full path
for %%I in (!arg!) do echo %%I
echo ----------------------------------
echo:

rem foler path
echo %~dp1

for %%I in (!arg!) do echo ÅE%%~nxI
echo ----------------------------------
echo:

cmd /k
endlocal
