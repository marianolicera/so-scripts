#!/bin/bash
#Este script se usa con un archivo txt con el formato Segmento,Base,Longitud
#Ejemplo: s1,2300,14
echo "Ingrese el archivo que desea evaluar"
read ARCHIVO
if [ ! -f "$ARCHIVO" ];then #EVALUAMOS SI EL ARCHIVO INGRESADO ES REALMENTE UN ARCHIVO ORDINARIO
    echo "El archivo ingresado no existe"
    else
    rta = "s"
    while [ $rta == "s" ];do #EN BUCLE MIENTRAS DESEE CALCULAR
        echo "Ingrese el numero de segmento que desea calcular"
        read NS
        echo "Ingrese el desplazamiento del segmento"
        read DESPLAZAMIENTO
        LONGITUD=$(grep s$NS "$ARCHIVO" | cut -d "," -f 3)
        if [ $DESPLAZAMIENTO -gt $LONGITUD ];then #DEBEMOS EVALUAR SI EL DESPLAZAMIENTO ES MENOS QUE LA LONGITUD, SI NO FUESE ASI NO SE PUEDE CALCULAR
            echo "El desplazamiento es mayor a la longitud del segmento. Imposible de calcular"
            else
            BASE=$(grep s$NS "$ARCHIVO" | cut -d "," -f 2)
            DIRFISICA=$((BASE + DESPLAZAMIENTO))
            echo "La direccion fisica es $DIRFISICA"
        fi
        echo "¿Desea calcular otra direccion fisica?"
        read rta
    done
fi