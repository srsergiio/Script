@echo off
cls

:OPTIONS
echo.
echo TaskbarOpacity v1.1 ES
echo Descripcion: Ajusta el nivel de transparencia de la barra de tareas.
echo Requisitos: Windows 10 version 1803 o superior, activado.
echo Autor: vhanla
echo.
echo Escriba valores desde 0 a 255 de nivel de transparencia:
echo.
set /P opa=">
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /t REG_DWORD /d %opa% /f
rem Los siguientes valores de registro han de ser modificados.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v ColorPrevalence /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f

echo Deteniendo el proceso padre de la barra de tareas (explorer.exe):
tasklist /FI "IMAGENAME eq explorer.exe" /FO table
echo.
rem csv
taskkill /f /im explorer.exe && start explorer.exe
echo.
echo El explorador debió reiniciar correctamente, caso contrario...
set res=
set /P res=Reiniciar Explorer nuevamente [y/n]?
if "%res%"=="y" (
  echo Iniciando explorer...
  start explorer.exe
)
