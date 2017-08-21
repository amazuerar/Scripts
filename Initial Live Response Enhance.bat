::Variables Globales
set winLive=C:\Win Live Response\
set sys=C:\SysinternalsSuite\

echo  off
cls

:begin
cls
echo ====================================================
echo = La siguiente herramiente es con fines academicos =
echo ====================================================
echo Seleccione una de las siguientes opciones:
echo [1] Levantamiento de informacion local
echo [2] Levantamiento de informacion remota
echo [3] Finalizar

set /p operacion=Escriba la opcion deseada: 

if "%operacion%"=="1" goto levantamientoLocal
if "%operacion%"=="2" goto levantamientoRemoto
if "%operacion%"=="3" goto exit


:: OPCIONES CORRESPONDIENTES A LEVANTAMIENTO LOCAL 

:levantamientoLocal
cls
echo ==============================================
echo = Menu de levantamiento de informacion local =
echo ==============================================
echo Seleccione una de las siguientes opciones:
echo [1] Referencias a Nombre, Fecha y Hora de Sistema
echo [2] Sesiones de Inicio
echo [3] Marcas de Tiempo
echo [4] Procesos en Ejecucion
echo [5] Interfaces de Red
echo [6] Socket y Aplicaciones
echo [7] Conexiones de Red
echo [8] Registro Cache DNS
echo [9] Informacion del sistema
echo [10] SID de la Maquina
echo [11] Estado y configuracion de Servicios
echo [12] Volver

set /p operacion=Escriba la opcion deseada: 

if "%operacion%"=="1" goto localNombreFechaHora
if "%operacion%"=="2" goto localSesionesInicio
if "%operacion%"=="3" goto localMarcasTiempo
if "%operacion%"=="4" goto localProcesosEjecucion
if "%operacion%"=="5" goto localInterfacesRed
if "%operacion%"=="6" goto localSocketAplicaciones
if "%operacion%"=="7" goto localConexionesRed
if "%operacion%"=="8" goto localRegistroDNS
if "%operacion%"=="9" goto localInfosystem
if "%operacion%"=="10" goto localsid
if "%operacion%"=="11" goto localstatusservice
if "%operacion%"=="12" goto begin


:localNombreFechaHora
cls
echo =========================================================
echo = Menu de Referencias a Nombre, Fecha y Hora de Sistema =
echo =========================================================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Nombre de equipo" > %operacion%.txt
CALL "%winLive%\hostname.exe" >> %operacion%.txt
echo "Fecha del sistema" >> %operacion%.txt
CALL "%winLive%\date.exe" >> %operacion%.txt
date /T >> %operacion%.txt
echo "Hora del sistema" >> %operacion%.txt
time /T >> %operacion%.txt
goto begin

:localSesionesInicio
cls
echo ==============================
echo = Menu de Sesiones de Inicio =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Sesiones de Inicio" > %operacion%.txt
psloggedon >> %operacion%.txt
goto begin

:localMarcasTiempo
cls
echo ============================
echo = Menu de Marcas de Tiempo =
echo ============================
set /p ruta=Escriba la ruta a analizar [C:\My\Path]: 
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Fechas y Horas de Modificacion" > %operacion%.txt
dir /T:w /a /s /o:d "%ruta%" >> %operacion%.txt
echo "Fechas y Horas de Acceso" >> %operacion%.txt
dir /T:a /a /s /o:d "%ruta%" >> %operacion%.txt
echo "Fechas y Horas de Creacion" >> %operacion%.txt
dir /T:c /a /s /o:d "%ruta%" >> %operacion%.txt
goto begin

:localProcesosEjecucion
cls
echo =================================
echo = Menu de Procesos en Ejecucion =
echo =================================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Procesos en Ejecucion" > %operacion%.txt
pslist >> %operacion%.txt
goto begin

:localInterfacesRed
cls
echo =============================
echo = Menu de Interfaces de red =
echo =============================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Informacion de Interfaces de Red" > %operacion%.txt
ipconfig /all >> %operacion%.txt
goto begin

:localSocketAplicaciones
cls
echo ==================================
echo = Menu de Scokets y Aplicaciones =
echo ==================================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Informacion de Scokets y Aplicaciones" > %operacion%.txt
Fport.exe >> %operacion%.txt
goto begin


:localConexionesRed
cls
echo =============================
echo = Menu de Conexiones de Red =
echo =============================
echo La informacion a recopilar puede tardar
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Informacion de Conexiones de Red" > %operacion%.txt
netstat -e -s >> %operacion%.txt
netstat -a >> %operacion%.txt
netstat -t >> %operacion%.txt
goto begin

:localRegistroDNS
cls
echo ==============================
echo = Menu de Registro Cache DNS =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Informacion de Registro Cache DNS" > %operacion%.txt
ipconfig /displaydns >> %operacion%.txt
goto begin


:localInfosystem
cls
echo ====================================
echo = Menu de Informacion del sistema =
echo ====================================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Informacion del sistema" > %operacion%.txt
psinfo >> %operacion%.txt
goto begin


:localsid
cls
echo ==============================
echo = Menu de SID de la maquina =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "SID de la maquina" > %operacion%.txt
psgetsid >> %operacion%.txt
goto begin


:localstatusservice
cls
echo ===============================================
echo = Menu de Estado y configuracion de Servicios =
echo ===============================================
set /p operacion=Escriba el nombre para el archivo de salida: 
echo "Estado y configuracion de Servicios" > %operacion%.txt
psservice>> %operacion%.txt
goto begin


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:: OPCIONES CORRESPONDIENTES A LEVANTAMIENTO REMOTO 

:levantamientoRemoto
cls
echo ===============================================
echo = Menu de levantamiento de informacion Remota =
echo ===============================================
echo Seleccione una de las siguientes opciones:
echo [1] Referencias a Nombre, Fecha y Hora de Sistema
echo [2] Sesiones de Inicio
echo [3] Marcas de Tiempo
echo [4] Procesos en Ejecucion
echo [5] Interfaces de Red
echo [6] Socket y Aplicaciones
echo [7] Conexiones de Red
echo [8] Registro Cache DNS
echo [9] Informacion del sistema
echo [10] SID de la Maquina
echo [11] Estado y configuracion de Servicios
echo [12] Archivo host remoto
echo [13] Volver


set /p operacion=Escriba la opcion deseada: 

if "%operacion%"=="1" goto remotoNombreFechaHora
if "%operacion%"=="2" goto remotoSesionesInicio
if "%operacion%"=="3" goto remotoMarcasTiempo
if "%operacion%"=="4" goto remotoProcesosEjecucion
if "%operacion%"=="5" goto remotoInterfacesRed
if "%operacion%"=="6" goto remotoSocketAplicaciones
if "%operacion%"=="7" goto remotoConexionesRed
if "%operacion%"=="8" goto remotoRegistroDNS
if "%operacion%"=="9" goto localInfosystem
if "%operacion%"=="10" goto localsid
if "%operacion%"=="11" goto localstatusservice
if "%operacion%"=="12" goto localfile
if "%operacion%"=="13" goto begin


:remotoNombreFechaHora
cls
echo =========================================================
echo = Menu de Referencias a Nombre, Fecha y Hora de Sistema =
echo =========================================================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Nombre de equipo" > %operacion%.txt
call "%winLive%\psexec.exe" \\%equipo% -u %usuario% -p %password% -i hostname >> %operacion%.txt
echo "Fecha y hora del sistema" >> %operacion%.txt
call "%winLive%\psexec.exe" \\%equipo% -u %usuario% -p %password% -c "%winLive%\date" >> %operacion%.txt
goto begin

:remotoSesionesInicio
cls
echo ==============================
echo = Menu de Sesiones de Inicio =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
echo "Sesiones de Inicio" > %operacion%.txt
call "%winLive%\psloggedon" \\%equipo% >> %operacion%.txt
goto begin

:remotoMarcasTiempo
cls
echo ============================
echo = Menu de Marcas de Tiempo =
echo ============================
set /p ruta=Escriba la ruta a analizar [C$\My\Path]: 
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Fechas y Horas de Modificacion" > %operacion%.txt
dir /T:w /a /s /o:d \\"%equipo%\%ruta%" -u %usuario% -p %password% >> %operacion%.txt
echo "Fechas y Horas de Acceso" >> %operacion%.txt
dir /T:a /a /s /o:d \\"%equipo%\%ruta%" -u %usuario% -p %password% >> %operacion%.txt
echo "Fechas y Horas de Creacion" >> %operacion%.txt
dir /T:c /a /s /o:d \\"%equipo%\%ruta%" -u %usuario% -p %password% >> %operacion%.txt
goto begin

:remotoProcesosEjecucion
cls
echo =================================
echo = Menu de Procesos en Ejecucion =
echo =================================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Procesos en Ejecucion" > %operacion%.txt
CALL "%winLive%\pslist.exe" -m \\%equipo% -u %usuario% -p %password% >> %operacion%.txt
goto begin

:remotoInterfacesRed
cls
echo =============================
echo = Menu de Interfaces de red =
echo =============================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto:
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Informacion de Interfaces de Red" > %operacion%.txt
CALL "%winLive%\psexec.exe" \\%equipo% -u %usuario% -p %password% ipconfig >> %operacion%.txt
goto begin

:remotoSocketAplicaciones
cls
echo ==================================
echo = Menu de Scokets y Aplicaciones =
echo ==================================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Informacion de Scokets y Aplicaciones" > %operacion%.txt
call "%winLive%\psexec.exe" \\%equipo% -u %usuario% -p %password% -c "%winLive%\Fport.exe" >> %operacion%.txt
goto begin

:remotoConexionesRed
cls
echo =============================
echo = Menu de Conexiones de Red =
echo =============================
echo La informacion a recopilar puede tardar
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
echo "Informacion de Conexiones de Red" > %operacion%.txt
"%winLive%\psexec.exe" \\%equipo% netstat -e -s >> %operacion%.txt
"%winLive%\psexec.exe" \\%equipo% netstat -a >> %operacion%.txt
"%winLive%\psexec.exe" \\%equipo% netstat -t >> %operacion%.txt
goto begin

:remotoRegistroDNS
cls
echo ==============================
echo = Menu de Registro Cache DNS =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Informacion de Registro Cache DNS" > %operacion%.txt
CALL "%winLive%\psexec" -u %usuario% -p %password% -i \\%equipo% ipconfig /displaydns >> %operacion%.txt
goto begin



:localInfosystem
cls
echo ===================================
echo = Menu de Informacion del sistema =
echo ===================================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Procesos en Ejecucion" > %operacion%.txt
CALL "%winLive%\psinfo.exe" \\%equipo% -u %usuario% -p %password% >> %operacion%.txt
goto begin



:localsid
cls
echo ==============================
echo = Menu de SID de la Maquina =
echo ==============================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
echo "Procesos en Ejecucion" > %operacion%.txt
CALL "%winLive%\psgetsid.exe" \\%equipo% %usuario% >> %operacion%.txt
goto begin



:localstatusservice
cls
echo ===============================================
echo = Menu de Estado y configuracion de Servicios =
echo ===============================================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Procesos en Ejecucion" > %operacion%.txt
CALL "%winLive%\psservice.exe" \\%equipo% -u %usuario% -p %password% >> %operacion%.txt
goto begin


:localfile
cls
echo ===========================
echo = Menu de Archivos remotos =
echo ===========================
set /p operacion=Escriba el nombre para el archivo de salida: 
set /p equipo=Escriba direccion IP de equipo remoto: 
set /p usuario=Escriba nombre de usuario: 
set /p password=Escriba contrasena: 
echo "Procesos en Ejecucion" > %operacion%.txt
CALL "%winLive%\psfile.exe" \\%equipo% -u %usuario% -p %password% >> %operacion%.txt
goto begin