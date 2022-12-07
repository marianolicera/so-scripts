#!/bin/bash
IP=$(ifconfig | head -2 | grep inet | awk '{print $2}')
MASK=$(ifconfig | head -2 | grep netmask | awk '{print $4}')
DIRFISICA=$(ifconfig | head -3 | grep ether | awk '{print $2}')
echo Direccion Fisica: $DIRFISICA
echo IP: $IP
echo MASCARA: $MASK