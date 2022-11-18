#!/bin/bash

if [ -e info-ram];then 
    rm info-ram
fi
if [ -e a-setuid ];then
    rm a-setuid
fi
if [ -e a-setgid ];then
    rm a-setgid
fi
if [ -e a-sticky ];then
    rm a-sticky
fi
if [ -e cantidad-archivos ];then
    rm cantidad-archivos
fi
#buscamos permiso setuid
find /usr/bin -perm -u=s >> aux
while read line;do
    arch=$(echo $line)
    tam=$(du $arch | awk '{print $1}')
    echo $arch "<--->" $tam >> a-setuid
done < aux
totsetuid=$(cat a-setuid | wc -l)
echo cantidad de archivos con setuid: $totsetuid >> a-setuid
rm aux
#buscamos permiso setgid
find /usr/bin -perm -g=s >> aux
while read line;do
    arch=$(echo $line)
    tam=$(du $arch | awk '{print $1}')
    echo $arch "<--->" $tam >> a-setgid
done < aux
totsetgid=$(cat a-setgid | wc -l)
echo cantidad de archivos con setgid: $totsetgid >> a-setgid
rm aux
#buscamos permiso sticky
find /usr/bin -perm -1000 >> aux
while read line;do
    arch=$(echo $line)
    tam=$(du $arch | awk '{print $1}')
    echo $arch "<--->" $tam >> a-sticky
done < aux
if [ -e a-sticky ];then
    totsticky=$(cat a-sticky | wc -l)
    echo cantidad de archivos con sticky: $totsticky >> a-sticky
    else
        echo No existe archivos con permiso sticky en este directorio >> a-sticky
fi
rm aux
tot=$(free -m| grep Mem|tr -s " "|cut -d" " -f2)
libre=$(free -m | grep Mem | tr -s " " | cut -d " " -f4)
usada=$(free -m | grep Mem | tr -s " " | cut -d " " -f3)
disp=$(free -m | grep Mem | tr -s " " | cut -d " " -f7)
echo MEMORIA TOTAL DE RAM: $tot Mb >> info-ram
echo MEMORIA LIBRE DE RAM: $libre Mb >> info-ram
echo MEMORIA OCUPADA DE RAM: $usada Mb >> info-ram
echo MEMORIA DISPONIBLE DE RAM: $disp Mb >> info-ram