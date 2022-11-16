#!/bin/bash

if [ $# -eq 1 ];then
    if [ $1 = "$USER" ];then
        ps -aux | grep "^$1" | awk '{print $2, $9, $10, $11}' > ProcesosMios
    else
        a=$(who | grep "^$1" | wc -l)
        if [ $a -eq 1 ];then
            ps -aux | grep "^$1" | awk '{print $2, $9, $10, $11}' > Procesos-$1
            who | awk '{print "Fecha de conexion: "$3" Hora de conexion: "$4}' >> Procesos-$1
        else
            echo Usuario no definido
        fi
    fi
else
free | grep "Mem" | awk '{print "Memoria total del sistema = " $2}' > meminfo
free | grep "Mem" | awk '{print "Memoria usada = " $3}' >> meminfo
free | grep "Mem" | awk '{print "Memoria disponible = " $7}' >>meminfo
free | grep "Swa" | awk '{print "Memoria total de intercambio = " $2}' >> meminfo
free | grep "Swa" | awk '{print "Memoria usada de intercambio = " $3}' >> meminfo
fi 

#Se podria usar free -m para tener memoria en MB