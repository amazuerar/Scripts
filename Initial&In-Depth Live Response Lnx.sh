#!/bin/bash

echo -ne '               (0%)\r'
sleep 1
cd ~
echo "-------Equipo, Fecha y Hora del sistema--------" > ~/$HOSTNAME"ReferenciaNomFechaHora".txt
hostname >> ~/$HOSTNAME"ReferenciaNomFechaHora".txt
date >> ~/$HOSTNAME"ReferenciaNomFechaHora".txt


cd /proc
echo "-------Perfil del Sistema--------" > ~/$HOSTNAME"PerfilSistema".txt
cat version meminfo filesystems cpuinfo >> ~/$HOSTNAME"PerfilSistema".txt
cd ~


echo "-----------Tiempo en Servicio----------" > ~/$HOSTNAME"TiempoEnServicio".txt
echo "Comando W" >> ~/$HOSTNAME"TiempoEnServicio".txt
w >> ~/$HOSTNAME"TiempoEnServicio".txt
echo "Comando Uptime" >> ~/$HOSTNAME"TiempoEnServicio".txt
uptime >> ~/$HOSTNAME"TiempoEnServicio".txt

echo -ne '#              (10%)\r'
sleep 1


echo "-----------Conexiones de red actuales----------" > ~/$HOSTNAME"ConexionesRed".txt
netstat -a >> ~/$HOSTNAME"ConexionesRed".txt

echo -ne '#####          (30%)\r'
sleep 1

echo "-----------Listado de puertos----------" > ~/$HOSTNAME"ListaPuertos".txt
netstat -an >> ~/$HOSTNAME"ListaPuertos".txt


echo "-----------Gestión de ficheros----------" > ~/$HOSTNAME"GestionFicheros".txt
lsof >> ~/$HOSTNAME"GestionFicheros".txt


echo "-----------Listado de puertos TCP y UPD en servicio----------" > ~/$HOSTNAME"PuertosTCPUDP".txt
cd /proc
lsof -i >> ~/$HOSTNAME"PuertosTCPUDP".txt
cd ~

echo -ne '#######        (50%)\r'
sleep 1

echo "-----------Usuarios actualmente logueados----------" > ~/$HOSTNAME"UsuariosLogueados".txt
echo "--Comando WHO--" >> ~/$HOSTNAME"UsuariosLogueados".txt
who >> ~/$HOSTNAME"UsuariosLogueados".txt
echo "--Comando WHO -uH--" >> ~/$HOSTNAME"UsuariosLogueados".txt
who -uH >> ~/$HOSTNAME"UsuariosLogueados".txt
echo "--Comando WHO -q--" >> ~/$HOSTNAME"UsuariosLogueados".txt
who -q >> ~/$HOSTNAME"UsuariosLogueados".txt
echo "--Comando last--" >> ~/$HOSTNAME"UsuariosLogueados".txt
last >> ~/$HOSTNAME"UsuariosLogueados".txt
echo "--Comando lastlog--" >> ~/$HOSTNAME"UsuariosLogueados".txt
lastlog >> ~/$HOSTNAME"UsuariosLogueados".txt


echo "-----------Tabla interna de Enrutamiento----------" > ~/$HOSTNAME"TablaInternaEnrut".txt
echo "--Comando netstat -rn--" >> ~/$HOSTNAME"TablaInternaEnrut".txt
netstat -rn >> ~/$HOSTNAME"TablaInternaEnrut".txt
echo "--Comando route--" >> ~/$HOSTNAME"TablaInternaEnrut".txt
route >> ~/$HOSTNAME"TablaInternaEnrut".txt

echo -ne '#########      (60%)\r'
sleep 1

echo "-----------Procesos en Ejecución----------" > ~/$HOSTNAME"ProcesosEnEjecucion".txt
echo "comando TOP" >>  ~/$HOSTNAME"ProcesosEnEjecucion".txt
top -n 1 >>  ~/$HOSTNAME"ProcesosEnEjecucion".txt
echo "comando PS -UX" >> ~/$HOSTNAME"ProcesosEnEjecucion".txt
ps -ux >> ~/$HOSTNAME"ProcesosEnEjecucion".txt
echo "comando PS -FEA" >> ~/$HOSTNAME"ProcesosEnEjecucion".txt
ps -fea >> ~/$HOSTNAME"ProcesosEnEjecucion".txt


echo "-----------Historico de comandos----------" > ~/$HOSTNAME"history".txt
echo "comando history" >>  ~/$HOSTNAME"history".txt
chmod 7777 ~/.bash_history
cat ~/.bash_history >> ~/$HOSTNAME"history".txt


echo "-----------Modulos cargados d Kernel----------" > ~/$HOSTNAME"ModulosCargados".txt
echo "comando lsmod" >>  ~/$HOSTNAME"ModulosCargados".txt
lsmod >>  ~/$HOSTNAME"ModulosCargados".txt

echo -ne '###########    (80%)\r'
sleep 1

echo "-----------Sistema de Archivos Montados----------" > ~/$HOSTNAME"SistemaArchivos".txt
echo "comando df -k" >>  ~/$HOSTNAME"SistemaArchivos".txt
df -k >>  ~/$HOSTNAME"SistemaArchivos".txt


echo "-----------Version del Sistema----------" > ~/$HOSTNAME"VersionSistema".txt
echo "comando uname -a" >>  ~/$HOSTNAME"VersionSistema".txt
uname -a >>  ~/$HOSTNAME"VersionSistema".txt

echo -ne '#############  (90%)\r'
sleep 1

echo "-----------Logs de Syslog----------" > ~/$HOSTNAME"Syslog".txt
echo "LOGS" >>  ~/$HOSTNAME"Syslog".txt
echo "LOGS MESSAGES" >>  ~/$HOSTNAME"Syslog".txt
cat /var/log/messages >>  ~/$HOSTNAME"Syslog".txt
 
echo "LOGS SECURE" >>  ~/$HOSTNAME"Syslog".txt
cat /var/log/secure >>  ~/$HOSTNAME"Syslog".txt

echo "LOGS MAILLOG" >>  ~/$HOSTNAME"Syslog".txt
cat /var/log/maillog >>  ~/$HOSTNAME"Syslog".txt
 
echo "LOGS SPOOLER" >>  ~/$HOSTNAME"Syslog".txt
cat /var/log/spooler >>  ~/$HOSTNAME"Syslog".txt
 
echo "LOGS BOOT.LOG" >>  ~/$HOSTNAME"Syslog".txt
cat /var/log/boot.log >>  ~/$HOSTNAME"Syslog".txt


echo "-----------Cuentas de usuario----------" > ~/$HOSTNAME"CuentasUsuario".txt
echo "Extraido de /etc/passwd" >>  ~/$HOSTNAME"CuentasUsuario".txt
cat /etc/passwd >>  ~/$HOSTNAME"CuentasUsuario".txt


echo "-----------Nivel de Parches----------" > ~/$HOSTNAME"NivelParches".txt
echo "comando dpkg -l" >>  ~/$HOSTNAME"NivelParches".txt
dpkg -l >>  ~/$HOSTNAME"NivelParches".txt
echo -ne '###############(99%)\r'
sleep 1
echo "Un momento..."
echo "comando apt list -installed" >>  ~/$HOSTNAME"NivelParches".txt
apt list --installed >>  ~/$HOSTNAME"NivelParches".txt
clear
echo "Un momento..."
sleep 2
clear
echo  '###############(100%) Proceso culminado, los archivos se alojaron en Home'
ls $HOME


