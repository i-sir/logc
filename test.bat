@echo off
setlocal enabledelayedexpansion
title ִ��log-c�ύgithub����

:MAIN_LOOP
::ɾ��֮ǰ�ļ�¼
del /q "D:\phpstudy_pro\WWW\git\log-c\git_log\*.*" >nul 2>&1

REM ��ȡ��ǰ���ں�ʱ��
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM ��ȡ������ʱ����
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM ָ��Ŀ��Ŀ¼
set "target_dir=D:\phpstudy_pro\WWW\git\log-c\git_log"

REM �����ļ���������
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM �����ļ�
echo %filecontent% > "%target_dir%\%filename%"

::��ʾ��Ϣ
call :SHOW_MESSAGE "�ļ��Ѵ�����%target_dir%\%filename%"

::ִ��Git�ύ
cd /d "D:\phpstudy_pro\WWW\git\log-c"
git add . 
git commit -m "�ύ; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

if errorlevel 1 (
    call :SHOW_MESSAGE "�ύʧ����鿴����ԭ��"
    timeout /t 10 >nul
    goto MAIN_LOOP
)

call :SHOW_MESSAGE "��ִ����� %CD%"

::��ȡ20-120�����
set /a randomNumber=200 + %RANDOM% %% 301
call :SHOW_MESSAGE "�����Ϊ:%randomNumber%"

::�����(5-60)��ִ��һ��
timeout /t %randomNumber% >nul 

::ѭ��ִ��
goto MAIN_LOOP
:: ========== ������������ ==========

:SHOW_MESSAGE
echo.
echo..
echo...
echo....
echo.....
echo......
echo.......
echo........
echo %~1
echo........
echo.......
echo......
echo.....
echo....
echo...
echo..
echo.
goto :eof

:ERROR_HANDLER
call :SHOW_MESSAGE "��������10�������..."
timeout /t 10 >nul
goto MAIN_LOOP

:: ========== �ű����� ==========