if [ -e salida1024 ];then
    rm salida1024
fi
if [ -e salida2048 ];then
    rm salida2048
fi
if [ $# -eq 0 ];then
    echo Ingrese como parametro las tablas
fi
if [ $# -eq 1 ];then
    echo Ingreso solo un archivo
fi
if [ $# -gt 2 ];then
    echo Ingreso demasiados archivos como parametro
fi
if [ "$1" != 'tablapagina'];then
    echo Ingrese primero la tabla de pagina
fi
if [ $# -eq 2 ];then
    if [ ! -f $1 ];then
        echo El primero no es un archivo
    fi
    if [ ! -f $2 ];then
        echo El segundo no es un archivo
    fi
    
    echo "Ingrese el tamaño de pagina (1024 - 2048)"
    read TP
    cat $1 | while read line;do
        NROPAG=$(echo $line | cut -d "," -f1)
        DIRINI=$(echo $line | cut -d "," -f2)
        BITVAL=$(echo $line | cut -d "," -f3)
        DESPLA=$(cat $2 | grep $NROPAG | cut -d "," -f2)
        if [ $BITVAL -eq 0 ];then
            if [ $TP -eq 1024 ];then
                echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = Incalculable debido a que no se encuentra en MEMORIA" >> salida1024
            else
                echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = Incalculable debido a que no se encuentra en MEMORIA" >> salida2048
            fi
        else
            if [ $DESPLA -gt $TP ];then
                if [ $TP -eq 1024 ];then
                    echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = Incalculable debido a que el desplazamiento es mayor que el tamanio de pagina" >> salida1024
                else
                    echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = Incalculable debido a que el desplazamiento es mayor que el tamanio de pagina" >> salida2048
                fi
            else
                if [ $TP -eq 1024 ];then
                    DIRFISICA=$((DIRINI + DESPLA))
                    echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = $DIRFISICA" >> salida1024
                else
                    DIRFISICA=$((DIRINI + DESPLA))
                    echo "La direccion fisica de la logica ($NROPAG,$DESPLA) es = $DIRFISICA" >> salida2048
                fi
            fi
        fi
    done
fi