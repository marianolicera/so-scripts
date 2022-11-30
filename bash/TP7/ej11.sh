#!/bin/bash

find $1 -type f >> aux
while read line;do
    winner=0
    tam=$(du $line | awk '{print $1}')
    if [ $tam -gt $winner ];then
        winnerSize=$tam
        winnerName=$line
    fi
done < aux
echo El archivo mas grande es: $winnerName con un tamanio de: $winnerSize B
rm aux