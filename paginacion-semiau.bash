#!/bin/bash
#Este script se usa cuando tenemos un archivo externo como tabla de página, con el formato Pagina,DireccionInicio,BitValidez
#Ejemplo: p0,1200,1
echo "Ingrese el archivo que desea evaluar"
read ARCHIVO
if [ ! -f $ARCHIVO ];then #EVALUAMOS SI ES UN ARCHIVO ORDINARIO
    echo "El archivo ingresado no existe"
    else
    rta = "s"
    echo "Ingrese el tamaño de las paginas en bytes"
    read TP
    while [ $rta == "s" ];do #EN BUCLE MIENTRAS DESEE CALCULAR PAGINAS
        echo "Ingrese el numero de pagina que desea calcular"
        read NP
        BITVALIDEZ=$(grep p$NP "$ARCHIVO" | cut -d "," -f 3)
        if [ -z "$BITVALIDEZ" ];then #SI LA VARIABLE BITVALIDEZ ESTÁ VACÍA ENTONCES NO EXISTE LA PÁGINA
            echo "No existe la pagina"
            exit
        fi
        if [ $BITVALIDEZ -eq 0 ];then #SI EL BIT DE VALIDEZ ES IGUAL A 0, ENTONCES LA PAGINA SE ENCUENTRA EN DISCO Y NO SE PUEDE CALCULAR
            echo "La pagina se encuentra en disco"
            else
            echo "Ingrese el desplazamiento"
            read DP
            if [ $DP -le $TP ];then #EL DESPLAZAMIENTO DEBE SER MENOR QUE EL TAMAÑO DE PAGINA
                DIRINICIO=$(grep p$NP "$ARCHIVO" | cut -d "," -f 2)
                DIRFISICA=$((DIRINICIO + DP))
                echo "La Direccion Fisica de la pagina $NP es $DIRFISICA"
                else
                    echo "El desplazamiento es mayor que el tamaño"
            fi
        fi
        echo "¿Desea calcular otra pagina? s/n"
        read rta
    done
fi