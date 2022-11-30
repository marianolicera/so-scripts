#!/bin/bash
if [ $# -eq 0 ];then
    echo Ingrese un parametro
elif [ $# -gt 1 ];then
    echo Ingrese solo un parametro
fi

chgrp $1 grupo
chown mariano $1
chmod o=r