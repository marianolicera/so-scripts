#!/bin/bash
clear
echo "1) 0% nivel de intercambio"
echo "2) 50% nivel de intercambio"
echo "3) 100% nivel de intercambio"
echo "4) salir"
read opcion
case $opcion
in
1)  sysct1 -w vm.swappiness=0
    echo "Valor establecido en 0%"
    sleep 10
    bash /home/mariano/practicas/tp5/ejer7
    ;;
2)  sysct1 -w vm.swappiness=50
    echo "Valor establecido en 50%"
    sleep 10
    bash ejer7
    ;;
3)  sysct1 -w vm.swappiness=100
    echo "Valor establecido en 100%"
    sleep 10
    bash ejer7
    ;;
4) echo "Adios"
    exit
    ;;
*) echo "Ingrese opcion del 1 al 4"
    if [ $opcion !=1 -o $opcion != 2 -o $opcion != 3 -o $opcion != 4 ];then
        echo "Opcion invalida"
        bash ejer7
    fi
esac