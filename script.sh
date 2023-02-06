if [ -e documentos_txt ];then
    rm -r documentos_txt
else
    mkdir documentos_txt
fi

find directorio1 -type f -name "*.sh" >> aux
cat aux | while read line;do
    sed -i "1d" $line
done
rm aux

find directorio1 -type f -name "*.txt" >> aux
cat aux | while read line;do
    ln -s simbolic$line $line | mv aux/simbolic$line documentos_txt
done
rm aux