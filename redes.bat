@echo off
:: Configura la consola para mostrar caracteres especiales correctamente (tildes)
chcp 65001 > nul
title Herramienta de Diagnóstico de Red

:menu
cls
echo
echo           MENÚ DE DIAGNÓSTICO DE RED
echo 
echo 1. Verificación de Bucle Local (Loopback)
echo 2. Obtener IP de la placa de red
echo 3. Prueba de Conectividad Estándar
echo 4. Monitoreo Continuo (Ctrl+C para detener)
echo 5. Definir Cantidad de Paquetes (10 paquetes)
echo 6. Prueba de Carga (Paquetes de 1000 bytes)
echo 7. Resolución de Nombres (IP a Host)
echo 8. Salir
echo 
echo.

set /p opcion=Seleccione una opción (1-8): 

if "%opcion%"=="1" goto loopback
if "%opcion%"=="2" goto ipconfig
if "%opcion%"=="3" goto estandar
if "%opcion%"=="4" goto continuo
if "%opcion%"=="5" goto paquetes
if "%opcion%"=="6" goto carga
if "%opcion%"=="7" goto resolucion
if "%opcion%"=="8" goto salir

:: Si el usuario ingresa una opción inválida
echo Opción inválida. Intente de nuevo.
pause
goto menu

:loopback
cls
echo [EJECUTANDO] Ping a Bucle Local (127.0.0.1)...
ping 127.0.0.1
echo.
pause
goto menu

:ipconfig
cls
echo [EJECUTANDO] IPCONFIG...
ipconfig
echo.
pause
goto menu

:estandar
cls
set /p url=Ingrese la URL o IP a consultar (ej: www.inet.edu.ar): 
echo [EJECUTANDO] Ping estándar a %url%...
ping %url%
echo.
pause
goto menu

:continuo
cls
set /p url_cont=Ingrese la URL o IP para monitoreo continuo: 
echo [EJECUTANDO] Ping continuo a %url_cont%...
echo Recuerde presionar Ctrl+C para detener el proceso.
echo.
ping %url_cont% -t
echo.
pause
goto menu

:paquetes
cls
set /p url_paq=Ingrese la URL o IP para enviar 10 paquetes: 
echo [EJECUTANDO] Enviando 10 paquetes a %url_paq%...
ping %url_paq% -n 10
echo.
pause
goto menu

:carga
cls
set /p url_carga=Ingrese la URL o IP para la prueba de carga: 
echo [EJECUTANDO] Enviando paquetes de 1000 bytes a %url_carga%...
ping %url_carga% -l 1000
echo.
pause
goto menu

:resolucion
cls
set /p ip_res=Ingrese la dirección IP a resolver (ej: 8.8.8.8): 
echo [EJECUTANDO] Intentando resolver nombre de host para %ip_res%...
ping -a %ip_res%
echo.
pause
goto menu

:salir
cls
echo Gracias por usar la herramienta de diagnóstico. ¡Hasta luego!
pause
exit