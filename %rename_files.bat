@echo off

rem check argumants
if "%~1"=="" (
  exit /b
)

:select_func
echo �t�@�C���p�X�ɃX�y�[�X���܂܂��Ə����ł��܂���
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
echo �t�@�C�����̍ŏ��ɕ������}��
set /p add_string=Add String:

setlocal enabledelayedexpansion
for %%I in (!arg!) do call :sub_filename_start "%%I"
endlocal
goto :EOF


:filename_end
echo �t�@�C�����̍Ō�i�g���q�̑O�j�ɕ������}��
set /p add_string=Add String:

setlocal enabledelayedexpansion
for %%I in (!arg!) do call :sub_filename_end "%%I"
endlocal
goto :EOF


:filename_replace
echo �t�@�C�����̕������u��
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

rem set %[�ϐ���]=[�ϐ���]:[�u���O�̕�����]=[�u����̕�����]%
rem call set [�ϐ���]=%%[�ϐ���]:%[�u���O�̕�����̕ϐ�]%=%[�u����̕�����̕ϐ�]%%%

call set FILE_NAME=%%FILE_NAME:%Before%=%After%%%
rem echo After: %FILE_NAME%

rename %~1 %FILE_NAME%
