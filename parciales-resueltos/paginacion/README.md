Dada la tabla de paginas de nombre "tablapagina" que tiene:
 - Nro pagina, Direccion Fisica, Bit Validez
Y dada la tabla de nombre "tablacalculo" que tiene las direcciones logicas:
 - Nro pagina, desplazamiento
Hacer un script que calcule las direcciones fisicas de las logicas dadas en "tablacalculo"

Hacer el calculo para un tamaño de pagina de 1024bytes y 2048 bytes, el script una vez ejecutado me debe solicitar con que tamaño de pagina voy a hacer el calculo

Las tablas deben ser pasadas por parametro y ademas chequear que el pasaje sea correcto

El resultado dejarlo en el archivo de nombre "salida1024" y "salida2048" en el siguiente formato

Resultado del calculo de direcciones fisicas
--------------------------------------------
La direccion fisica de la logica (Px1, Despy2) es = zzz1
La direccion fisica de la lofica (Px2, Despy2) es = zzz2
........................................................
Si alguna no se puede calcular aclarar porque