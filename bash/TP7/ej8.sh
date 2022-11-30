#!/bin/bash

if [ ! -d $1 ];then
    echo Ingrese un directorio como parametro
fi

totalDir=$(find $1 -type d | sed 1d | wc -l)
totalArch=$(find $1 -type f | wc -l)
find $1 | sed 1d >> aux
while read line;do
    tam=$(du $line)
    echo $tam
done < aux
rm aux
echo total de directorios: $totalDir
echo total de archivos: $totalArch