#!/bin/bash
#procesos esperando por CPU
ps -el | cut -d " " -f 2 | grep 'S'
#número de procesos en estado dormido
C=0
for i in ps -el | cut -d " " -f 2 | grep 'Z$';do
    let C=C+1
done
echo Procesos en estado dormido $C
#cantidad de memoria intercambiada desde el disco
si=$(vmstat | awk -F " " '{print $7}')
echo "Memoria intercambiada desde el disco: $si"
#cantidad de memoria intercambiada hacia el disco
so=$(vmstat | awk -F " " '{print $8}')
echo Memoria intercambiada hacia el disco: $so