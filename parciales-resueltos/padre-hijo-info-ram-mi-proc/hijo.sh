#!/bin/bash

tot=$(free -m| grep Mem|tr -s " "|cut -d" " -f2)
libre=$(free -m | grep Mem | tr -s " " | cut -d " " -f4)
usada=$(free -m | grep Mem | tr -s " " | cut -d " " -f3)
disp=$(free -m | grep Mem | tr -s " " | cut -d " " -f7)
echo MEMORIA TOTAL DE RAM: $tot Mb >> info-ram
echo MEMORIA LIBRE DE RAM: $libre Mb >> info-ram
echo MEMORIA OCUPADA DE RAM: $usada Mb >> info-ram
echo MEMORIA DISPONIBLE DE RAM: $disp Mb >> info-ram