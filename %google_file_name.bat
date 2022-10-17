@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
  exit /b
)

for %%I in (%*) do (
  set search_word=%%~nI
  start "C:\Program Files\Mozilla Firefox\firefox.exe" "https://www.google.com/search?q=!search_word!
)

endlocal
