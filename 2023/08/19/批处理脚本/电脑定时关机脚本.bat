@echo off
title orange��ʱ�ػ��ű�V1.0
color 02
:menu
cls
echo ====================================================
echo              �˵�
echo          1.��ʱ�ػ�
echo          2.ȡ����ʱ�ػ�
echo          3.�˳�
echo ====================================================

set /p num=��ѡ��:
if "%num%"=="1" goto 1
if "%num%"=="2" goto 2
if "%num%"=="3" goto 3
��Ϲ���䣬����㣡����ֻ������1/2/3��
pause
goto menu

:1
set /p a=���������ʱ��(��λ/��)��
shutdown -s -f -t %a%
goto menu

:2
shutdown -a
goto menu

:3
exit
