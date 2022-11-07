#!/bin/bash


ps -fea|grep $USER > procesos
if [ -e mi-proc ]; then
	rm mi-proc 
fi

cat procesos | while read line; do
	echo $line|tr -s " "|cut -d" " -f1,2,8 >> mi-proc
done


rm procesos