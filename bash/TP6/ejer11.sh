#!/bin/bash
ARQUI=$(uname -p)
NMAQU=$(uname -n)
SOINS=$(uname -o)
KERNE=$(uname -v)

echo Arquitectura del procesador: $ARQUI
echo Nombre de la maquina: $NMAQU
echo Sistema Operativo instalado: $SOINS
echo Version del Kernel: $KERNE