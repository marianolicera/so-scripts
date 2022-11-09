#!/bin/bash

clear
#Dibujamos el menú
echo MENU DE OPCIONES
echo '1) BUSCAR ARCHIVOS CON PERMISO SETUID'
echo '2) BUSCAR ARCHIVOS CON PERMISO SETGID'
echo '3) BUSCAR ARCHIVOS CON PERMISO STICKY'
echo '4) INFORME DE MEMORIA RAM'
echo '0) SALIR'
echo "-------------------------------------"
read opc

#evaluamos cada opcion
if [ $opc -eq 1 ]; then

	if [ -d 'a-setuid' ];then #si el directorio existe, se borra
		rm -r a-setuid
	fi

	mkdir a-setuid
	find /usr/bin -perm -4000 >> aux
	cat aux|while read line;do
		cp $line a-setuid
	done
	cant1=$(ls a-setuid|wc -l)
	for arch in a-setuid/*;do
		chmod 0000 $arch
	done
	rm aux

	echo CANTIDAD DE ARCHIVOS CON PERMISO SETUID: $cant1

elif [ $opc -eq 2 ]; then

	if [ -d 'a-setgid' ]; then
		rm -r a-setgid
	fi

	mkdir a-setgid
	find /usr/bin -perm -2000 >> aux

	cat aux|while read line; do
		cp $line a-setgid
	done
	cant2=$(ls a-setgid|wc -l)
	for arch in a-setgid/*; do
		chmod  -g-s $arch
	done
	rm aux

	echo CANTIDAD DE ARCHIOS CON PERMISO SETGID: $cant2

elif [ $opc -eq 3 ];then
    if [ -d 'a-sticky' ];then
        rm -r a-sticky
    fi

    find /usr/bin/ -perm -1000 >> aux

    sticky=$(wc -l aux | cut -d " " -f1)
    if [ $sticky -eq 0 ];then
        echo No existen archivos sticky
        exit
    fi

    mkdir a-sticky
    cat aux | while read line do;
        cp $line a-sticky
    done
    
    cant3=$(ls a-sticky | wc -l)
    for arch in a-sticky/*;do
        chmod o-t $arch
    done
    
    rm aux

    echo CANTIDAD DE ARCHIVOS CON PERMISO STICKY: $cant3

elif [ $opc -eq 4 ]; then

if [ -f 'info-ram' ];then
    rm info-ram
fi

echo PROCESANDO INFORME DE RAM...

tot=$(free -m | grep Mem | tr -s " " | cut -d " " -f2)
echo MEMORIA TOTAL DE LA RAM: $tot Mb >> info-ram
usa=$(free -m | grep Mem | tr -s " " | cut -d " " -f3)
echo MEMORIA USADA DE LA RAM: $usa Mb >> info-ram
lib=$(free -m | grep Mem | tr -s " " | cut -d " " -f4)
echo MEMORIA LIBRE DE LA RAM: $lb Mb >> info-ram
com=$(free -m | grep Mem | tr -s " " | cut -d " " -f5)
echo MEMORIA COMPARTIDA DE LA RAM: $com Mb >> info-ram
buf=$(free -m | grep Mem | tr -s " " | cut -d " " -f6)
echo MEMORIA EN BUFFER/CACHE DE LA RAM: $buf Mb >> info-ram
dis=$(free -m | grep Mem | tr -s " " | cut -d " " -f7)
echo MEMORIA DISPONIBLE EN LA RAM: $dis Mb >> info-ram

elif [ $opc -eq 0 ];then
    exit
else
	echo valor invalido, reintentelo
    sleep 1
    bash menu_permisos.sh
fi