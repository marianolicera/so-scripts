Hacer un script que recorra el directorio /usr/bin/ y determine:
1) Cantidad de archivos que tienen permisos "setuid", de cada uno de esos archivos determinar el tamaño en bytes, y guardar los resultados en "a-setuid"
2) Cantidad de archivos que tienen permisos "setgid", de cada uno de esos archivos determinar el tamaño en byes, y guardar el resultado en "a-setgid"
3) Cantidad de archivos que tienen permisos "sticky", de cada uno de esos archivos determinar su tamaño en bytes, y guardar el resultado en "a-sticky"
Cada uno de los archivos de salida debe tener el siguiente formato: "nombre-archivo"<--->"tamaño"
4) Mostar un informe de RAM con total, usada, libre y disponible y guardarla en info-ram