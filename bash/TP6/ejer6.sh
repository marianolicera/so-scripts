#!/bin/bash
userConected=$(uptime | awk '{print $5}')
onTime=$(uptime | awk '{print $3}')
loadAv1=$(uptime | awk '{print $9}')
loadAv5=$(uptime | awk '{print $10}')
loadAv15=$(uptime | awk '{print $11}')

echo Usuarios conectados: $userConected
echo Tiempo encendido: $onTime
echo Promedio de carga del ultimo minuto: $loadAv1
echo Promedio de carga de ultimos 5 minutos: $loadAv5
echo Promedio de carga de ultimos 15 minutos: $loadAv15