#!/bin/bash
find $1 -type f -name "*.sh" >> aux
cat aux | while read line;do
        sed -i '3 s/bash/sh/g' $line
done
rm aux