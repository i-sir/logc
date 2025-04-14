@echo off
setlocal enabledelayedexpansion
title 执行log-c提交github任务

:MAIN_LOOP
::删除之前的记录
del /q "D:\phpstudy_pro\WWW\git\log-c\git_log\*.*" >nul 2>&1

REM 获取当前日期和时间
for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set datetime=%%a

REM 提取年月日时分秒
set "year=!datetime:~0,4!"
set "month=!datetime:~4,2!"
set "day=!datetime:~6,2!"
set "hour=!datetime:~8,2!"
set "minute=!datetime:~10,2!"
set "second=!datetime:~12,2!"

REM 指定目标目录
set "target_dir=D:\phpstudy_pro\WWW\git\log-c\git_log"

REM 构造文件名和内容
set "filename=%year%%month%%day%_%hour%.txt"
set "filecontent=%year%-%month%-%day% %hour%:%minute%:%second%"

REM 创建文件
echo %filecontent% > "%target_dir%\%filename%"

::显示信息
call :SHOW_MESSAGE "文件已创建：%target_dir%\%filename%"

::执行Git提交
cd /d "D:\phpstudy_pro\WWW\git\log-c"
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

if errorlevel 1 (
    call :SHOW_MESSAGE "提交失败请查看错误原因"
    timeout /t 10 >nul
    goto MAIN_LOOP
)

call :SHOW_MESSAGE "已执行完成 %CD%"

::获取20-120随机数
set /a randomNumber=200 + %RANDOM% %% 301
call :SHOW_MESSAGE "随机数为:%randomNumber%"

::隔随机(5-60)秒执行一次
timeout /t %randomNumber% >nul 

::循环执行
goto MAIN_LOOP
:: ========== 函数定义区域 ==========

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
call :SHOW_MESSAGE "发生错误，10秒后重试..."
timeout /t 10 >nul
goto MAIN_LOOP

:: ========== 脚本结束 ==========