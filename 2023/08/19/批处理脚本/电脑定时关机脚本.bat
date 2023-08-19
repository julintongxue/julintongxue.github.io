@echo off
title orange定时关机脚本V1.0
color 02
:menu
cls
echo ====================================================
echo              菜单
echo          1.定时关机
echo          2.取消定时关机
echo          3.退出
echo ====================================================

set /p num=请选择:
if "%num%"=="1" goto 1
if "%num%"=="2" goto 2
if "%num%"=="3" goto 3
别瞎乱输，认真点！！！只能输入1/2/3。
pause
goto menu

:1
set /p a=请输入多少时间(单位/秒)：
shutdown -s -f -t %a%
goto menu

:2
shutdown -a
goto menu

:3
exit
