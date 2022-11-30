#!/bin/bash

for i in $(ls $1);do
    type=$(echo $i | cut -d "." -f2)
    if [ $type = 'mp3' ];then
        rm $1/$i
    fi
done

if [ ! -d exe ];then
    mkdir exe
fi
find $1 -perm 744 >> aux
while read line;do
    mv $line exe
done < aux
rm aux