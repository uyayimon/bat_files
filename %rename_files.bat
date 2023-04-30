@echo off

rem check argumants
if "%~1"=="" (
  exit /b
)

:select_func
echo ファイルパスにスペースが含まれると処理できません
echo Cannot process if the file path contains spaces.
echo -------------------------------------------------
echo Press key:
echo "1" or "s" : Add to start of filename
echo "2" or "e" : Add to end of filename (Before the extension)
echo "3" or "r" : Replace strings in filename
echo "q"        : Exit
echo -------------------------------------------------
echo:
set /p select=:
echo:

set arg=%*

if '%select%'=='1' (
  goto :filename_start
) else if '%select%'=='s' (
  goto :filename_start
) else if '%select%'=='h' (
  goto :filename_start

) else if '%select%'=='2' (
  goto :filename_end
) else if '%select%'=='e' (
  goto :filename_end
) else if '%select%'=='t' (
  goto :filename_end

) else if '%select%'=='3' (
    goto :filename_replace
) else if '%select%'=='r' (
    goto :filename_replace

) else if '%select%'=='q' (
  exit /b
) else (
  goto select_func
)


:filename_start
echo ファイル名の最初に文字列を挿入
set /p add_string=Add String:

setlocal enabledelayedexpansion
for %%I in (!arg!) do call :sub_filename_start "%%I"
endlocal
goto :EOF


:filename_end
echo ファイル名の最後（拡張子の前）に文字列を挿入
set /p add_string=Add String:

setlocal enabledelayedexpansion
for %%I in (!arg!) do call :sub_filename_end "%%I"
endlocal
goto :EOF


:filename_replace
echo ファイル中の文字列を置換
set /p Before=Before String:
set /p After=After String:

setlocal enabledelayedexpansion
for %%I in (!arg!) do call :sub_replace "%%I"
endlocal
goto :EOF


:sub_filename_start
rem echo %~1
set filename_bef=%~n1
rem echo Before: %filename_bef%
set extension=%~x1
rem echo %extension%

set filename_aft=%add_string%%filename_bef%%extension%
rem echo After: %filename_aft%

rename %~1 %filename_aft%


:sub_filename_end
rem echo %~1
set filename_bef=%~n1
rem echo Before: %filename_bef%
set extension=%~x1
rem echo %extension%

set filename_aft=%filename_bef%%add_string%%extension%
rem echo After: %filename_aft%

rename %~1 %filename_aft%


:sub_replace
set FILE_NAME=%~nx1
rem echo Before: %FILE_NAME%

rem set %[変数名]=[変数名]:[置換前の文字列]=[置換後の文字列]%
rem call set [変数名]=%%[変数名]:%[置換前の文字列の変数]%=%[置換後の文字列の変数]%%%

call set FILE_NAME=%%FILE_NAME:%Before%=%After%%%
rem echo After: %FILE_NAME%

rename %~1 %FILE_NAME%
