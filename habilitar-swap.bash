#!/bin/bash
echo escriba habilitar o deshabilitar
read RTA
if [ $RTA == "habilitar" ];then
    swapon -a
    echo "Memoria swap habilitada"
    free -h
fi
if [ $RTA == "deshabilitar" ];then
    swapoff -a
    echo "Memoria swap deshabilitada"
    free -h
fi