#!/bin/bash
#1)
if [ -e MEM ];then
    rm MEM
fi
TOTAL=$(free -m | grep Mem | tr -s " " | cut -d " " -f2)
LIBRE=$(free -m | grep Mem | tr -s " " | cut -d " " -f4)
USADA=$(free -m | grep Mem | tr -s " " | cut -d " " -f3)
CACHE=$(free -m | grep Mem | awk '{print $6}') #se puede usar con tr y cut como con awk para todos los casos de memoria, funcionan igual
BUFFER=$(free -m | grep Mem | awk '{print $6}')
echo Total de memoria RAM del sistema: $TOTAL >> MEM
echo Memoria usada del sisetma: $USADA >> MEM
echo Memoria libre del sisetma: $LIBRE >> MEM
echo Memoria buffers: $BUFFER >> MEM
echo Memoria cache: $CACHE >> MEM
#2)
if [ -e Mis-Proc ];then
    rm Mis-Proc
fi
if [ $# -eq 1 ];then
    if[ $1 = "$USER" ];then
        ps -fea | grep $1 >> aux
        while read line;do
            NOM=$(echo $line | awk '{print $8}')
            PID=$(echo $line | awk '{print $2}')
            printf "\n$PID   $NOM\n" >> Mis-Proc
        done < aux
        rm aux
    else
        if [ -e PROC-$1 ];then
            rm PROC-$1
        fi
        ps -fea | grep $1 >> aux
        while read line;do
            NOM=$(echo $line | awk '{print $8}')
            PID=$(echo $line | awk '{print $2}')
            printf "\n$PID   $NOM\n" >> PROC-$1
        done < aux
        rm aux
    fi
fi
#3)
if [ -e DISK ];then
    rm DISK
fi

boot=$(df -h | grep -w "/boot" | awk '{print $5}')
echo Porcentaje de boot: $boot >> DISK
raiz=$(df -h | grep -w "/" | awk '{print $5}')
echo Porcentaje de raiz: $raiz >> DISK