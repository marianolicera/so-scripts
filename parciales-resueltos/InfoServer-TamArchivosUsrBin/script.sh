#!/bin/bash
clear
echo "=========MENU=========="
echo "1) Recorrer el directorio y calcular tamanio de archivos en usr bin"
echo "2) Datos del servidor en InfoServer"
read op

if [ $op -eq 1];then
    echo Procesando...
    if [ -e tamanio ];then
        rm tamanio
    fi
    if [ -e arch-src ];then
        rm arch-src
    fi
    if [ -e totales ];then
        rm totales
    fi
    find /usr/bin -type f >> aux #obtenemos los archivos de usr bin
    while read line;do
        arch=$(echo $line)
        tam=$(du $arch | awk '{print $1}')
        echo $arch "<-->" $tam >> tamanio
    done < aux
    rm aux
    find /usr/bin -name "*.sh" -type f >> aux #obtenemos los archivos que terminen en sh
    while read line;do
        arch=$(echo $line)
        echo $arch >> arch-src
    done < aux
    rm aux
    tamTotal=$(du /usr/bin | awk '{print $1}')
    archTotales=$(find /usr/bin -type f | wc -l)
    echo Total de archivos: $archTotales >> totales
    echo Tamaño total en KBytes: $tamTotal >> totales
elif [ $op -eq 2 ];then
    if [ -e InfoServer ];then
        rm InfoServer
    fi
    NombreKernel=$(uname --kernel-name)
    ReleaseKernel=$(uname --kernel-release)
    VersionKernel=$(uname --kernel-version) #no esta chequeado
    SistemaOperativo=$(uname --operating-system)
    MemoriaTotalSistema=$(free -m | grep Mem | tr -s " " | cut -d " " -f2)
    VariableSwappiness=$(cat /proc/sys/vm/swappiness)
    ProcesosDormidosCPU=$(ps -aux | grep "S" -o | wc -l) #esperando por CPU, no esta chequeado pero creo que es S
    ProcesosDormidosContinuos=$(ps -aux | grep "D" -o | wc -l) #dormidos ininterrumpidamente, creo que continuos es este con D
    echo Nombre del Kernel: $NombreKernel >> InfoServer
    echo Release del Kernel: $ReleaseKernel >> InfoServer
    echo Version Kernel: $VersionKernel >> InfoServer
    echo Sistema Operativo: $SistemaOperativo >> InfoServer
    echo Memoria Total del sistema: $MemoriaTotalSistema >> InfoServer
    echo Variable Swappiness: $VariableSwappiness >> InfoServer
    echo Numero de procesos ejecutables esperando acceder al CPU: $ProcesosDormidosCPU >> InfoServer
    echo Numero de procesos en estado dormido continuo: $ProcesosDormidosContinuos >> InfoServer
else
    echo Ingrese un valor correcto
    sleep 1
    bash script.sh
fi