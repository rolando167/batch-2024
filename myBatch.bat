@echo off

TITLE Terminal Template

set year=%date:~10,4%
set month=%date:~4,2%
set day=%date:~7,2%
set filename=%year%_%month%_%day%

MKDIR salida\Ejemplo1

ping 192.168.1.1 -n 2
::   comenario color 01
echo ==============================
echo Hola que tal :D - %filename%
echo ==============================
@pause