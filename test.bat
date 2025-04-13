@echo off
setlocal enabledelayedexpansion
title 执行log-c提交github任务

:main_loop
:: 删除之前的记录
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

:: 换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
:: 展示根目录
echo 文件已创建：%target_dir%\%filename%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.

:: 执行Git提交
cd /d "D:\phpstudy_pro\WWW\git\log-c"
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

:: 错误提示
if %errorlevel% neq 0 (
    echo 提交失败，错误代码: %errorlevel%
    echo 将在180秒后重试...
) else (
    echo 提交成功!
)

:: 换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
echo 已执行完成 %CD%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.

:: 等待180秒后继续执行
timeout /t 180 >nul

:: 循环执行
goto main_loop@echo off
setlocal enabledelayedexpansion
title 执行log-c提交github任务

:main_loop
:: 删除之前的记录
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

:: 换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
:: 展示根目录
echo 文件已创建：%target_dir%\%filename%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.

:: 执行Git提交
cd /d "D:\phpstudy_pro\WWW\git\log-c"
git add . 
git commit -m "提交; %date:~0,4%-%date:~5,2%-%date:~8,2%; %time:~0,8%"
git push -f origin master

:: 错误提示
if %errorlevel% neq 0 (
    echo 提交失败，错误代码: %errorlevel%
    echo 将在180秒后重试...
) else (
    echo 提交成功!
)

:: 换行空白符
echo ^.
echo ^..
echo ^...
echo ^....
echo ^.....
echo ^......
echo ^.......
echo ^........
echo 已执行完成 %CD%
echo ^........
echo ^......
echo ^.....
echo ^....
echo ^...
echo ^..
echo ^.

:: 等待180秒后继续执行
timeout /t 180 >nul

:: 循环执行
goto main_loop