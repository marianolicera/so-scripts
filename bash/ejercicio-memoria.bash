#!/bin/bash
free --mega| head -2 | awk -F " " '{print $1, $2, $3}' > "Informe_Ram_Mega"