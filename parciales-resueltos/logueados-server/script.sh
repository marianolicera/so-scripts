#!/bin/bash

if [ -e logueados ];then
    rm logueados
fi

last | grep "^so" | awk '{print $1}' | sort | uniq -c | sort >> aux

while read line;do
    USU=$(echo $line | awk '{print $2}')
    CAN=$(echo $line | awk '{print $1}')
    if [ $CAN -eq 1 ];then
        echo "Usuario $USU se conecto $CAN vez" >> logueados
    fi
    if [ $CAN -ne 1 ];then
        echo "Usuario $USU se conecto $CAN veces" >> logueados
    fi
done < aux

a=$(cat aux | tail -1 | awk '{print $2}')
echo "El usuario que mas veces se conecto fue: $a" >> logueados

rm aux