
@echo off
TITLE Bienvenid@ al apagado programado del PC
MODE con:cols=80 lines=40

:inicio
Shutdown -a
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Apagado Programado del PC
echo ------------------------------------------------------------------------------
echo  1    Programar el apagado 
echo  2    Cancelar el apagado
echo  3    Salir
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Seleccione una opcion [1-3]: 

if "%var%"=="0" goto inicio
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto salir


echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
    cls  
    echo.
    echo. Has elegido la opcion Numero 1
    echo.
        set /p tiempo=Indique tiempo en minutos: 
        set /a tiempo2=%tiempo%*60 
        shutdown /s /f /t %tiempo2% /c "Apagado programado"
    echo. El pc se apagara dentro de %tiempo% minutos.
        color 08
    echo.
    pause
	@cls&exit
    goto:inicio
	
:op2
    cls
    echo.
    echo. Has elegido la opcion Numero 2
    echo.
        Shutdown -a
    echo. Apagado automatico cancelado
        color 09
    echo.
    pause
	@cls&exit
    goto:inicio
	
:salir
    @cls&exit