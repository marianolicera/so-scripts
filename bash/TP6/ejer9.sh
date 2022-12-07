#!/bin/bash

if [ $# -eq 0];then
    who
elif [ $# -gt 1 ];then
    echo Ingrese solo un parametro
else
    USERDATANAME=$(who | grep $1 | awk '{print $1}')
    USERDATATIME=$(who | grep $1 | awk '{print $4}')
    if [ ! $USERDATANAME ];then
        echo No existe el usuario
    else
        echo Usuario: $USERDATANAME se conecto a las: $USERDATATIME
    fi
fi