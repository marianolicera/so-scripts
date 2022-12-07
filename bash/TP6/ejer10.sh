#!/bin/bash
MES=$(date | awk '{print $3}')
totalConectadosUnicos=$(last | grep -i $MES | awk '{print $1}' | sort | uniq -c | wc -l)
echo Ususarios conectados este mes: $totalConectadosUnicos