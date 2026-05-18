@echo off
:: Configura la consola para mostrar caracteres especiales correctamente (tildes)
chcp 65001 > nul
title Herramienta Avanzada de Diagnóstico de Red (IPCONFIG - NSLOOKUP - TRACERT)

:menu
cls
echo ===================================================
echo      MENÚ DE DIAGNÓSTICO DE RED AVANZADO
echo ===================================================
echo 1. Verificación de Bucle Local (Loopback)
echo 2. Obtener IP de la placa (ipconfig estándar)
echo 3. Funciones Avanzadas de IPCONFIG (Mantenimiento)
echo 4. Prueba de Conectividad Estándar (Ping)
echo 5. Monitoreo Continuo (Ctrl+C para detener)
echo 6. Definir Cantidad de Paquetes (10 paquetes)
echo 7. Prueba de Carga (Paquetes de 1000 bytes)
echo 8. Resolución de Nombres Básica (ping -a)
echo 9. Diagnóstico DNS Avanzado (NSLOOKUP)
echo 10. Trazar Ruta de Red (TRACERT)
echo 11. Salir
echo ===================================================
echo.

set /p opcion=Seleccione una opción (1-11): 

if "%opcion%"=="1" goto loopback
if "%opcion%"=="2" goto ipconfig
if "%opcion%"=="3" goto ipconfig_avanzado
if "%opcion%"=="4" goto estandar
if "%opcion%"=="5" goto continuo
if "%opcion%"=="6" goto paquetes
if "%opcion%"=="7" goto carga
if "%opcion%"=="8" goto resolucion
if "%opcion%"=="9" goto dns_nslookup
if "%opcion%"=="10" goto trazar_ruta
if "%opcion%"=="11" goto salir

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

:ipconfig_avanzado
cls
echo === SUBMENÚ IPCONFIG AVANZADO ===
echo a. Liberar dirección IP (ipconfig /release)
echo b. Renovar dirección IP (ipconfig /renew)
echo c. Limpiar caché de resolución DNS (ipconfig /flushdns)
echo d. Volver al menú principal
echo =================================
set /p subopc=Seleccione una opción avanzada (a-d): 
if "%subopc%"=="a" (
    echo [EJECUTANDO] Liberando IP...
    ipconfig /release
)
if "%subopc%"=="b" (
    echo [EJECUTANDO] Renovando IP...
    ipconfig /renew
)
if "%subopc%"=="c" (
    echo [EJECUTANDO] Limpiando caché DNS...
    ipconfig /flushdns
)
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
echo [EJECUTANDO] Intentando resolver nombre de host con ping -a para %ip_res%...
ping -a %ip_res%
echo.
pause
goto menu

:dns_nslookup
cls
set /p dominio=Ingrese el dominio o IP para consultar en el DNS (ej: google.com): 
echo [EJECUTANDO] Consulta NSLOOKUP para %dominio%...
nslookup %dominio%
echo.
pause
goto menu

:trazar_ruta
cls
set /p destino=Ingrese la URL o IP para trazar la ruta (ej: www.inet.edu.ar): 
echo [EJECUTANDO] Ejecutando TRACERT hacia %destino%...
echo (Este proceso puede demorar unos minutos, por favor espere)
echo.
tracert %destino%
echo.
pause
goto menu

:salir
cls
echo Gracias por usar la herramienta avanzada de diagnóstico. ¡Hasta luego!
pause
exit