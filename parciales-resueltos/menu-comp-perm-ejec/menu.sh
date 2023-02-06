#!/bin/bash
echo ==========MENU==========
echo 1- Compilar
echo 2- Asignar permios
echo 3- Ejecutar programa
echo 4- Salir
echo ========================

read op

case $op in
    1)
        if [ -e script ];then
            rm script
        fi
        echo Compilando aplicacion...
        gcc -o script script.c
        if [ -e script ];then
            echo Compilacion exitosa
        else
            echo Error al compilar, intentelo de nuevo
            sleep 3
            clear
            bash menu.sh
        fi
        sleep 3
        clear
        bash menu.sh
    ;;
    2)
        echo Asignando permiso de ejecucion a la aplicacion...
        if [ ! -e script ];then
            echo Aplicacion no compilada aun
            sleep 2
            bash menu.sh
        fi
        chmod 777 script
        echo Asignacion de ejecucion exitosa
        sleep 2
        clear
        bash menu.sh
    ;;
    3)
        echo Ejecutando aplicacion...
        ./script
        if [ -e archivo_resultante.txt ];then
            rm archivo_resultante.txt
        fi
        ./script >> archivo_resultante.txt
        sleep 3
        clear
        bash menu.sh
    ;;
    4)
        echo Saliendo del script
        sleep 2
        exit
    ;;
    *)
        echo Ingrese una opcion valida
        sleep 3
        bash menu.sh
    ;;
esac