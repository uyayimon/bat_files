@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
  exit /b
)

set x=%*


echo "�g���q�̑O�ɕ����񂪑}������܂�"
echo "�t�@�C�����E�p�X�ɃX�y�[�X���܂�ł���ƃG���[�ɂȂ�i�����@�T���܂��j"

set /p insert=insert string:

for %%I in (!x!) do call :sub "%%I"

endlocal


:sub
echo %~1
set filename_bef=%~n1
echo %filename_bef%
set extension=%~x1
echo %extension%

set filename_aft=%filename_bef%%insert%%extension%
echo %filename_aft%

rename %1 %filename_aft%
