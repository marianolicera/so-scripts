# COMANDOS UTILES
users --> obtenemos lista de usuarios registrados en el servidor
while --> recorremos ARCHIVOS DE TEXTO. Podemos hacer cat archivo | while do y en done no va el < archivo
find (-name) (-f / -d) --> lo usamos para obtener la lista de archivos o directorios que contienen un caracter como parametro al ladod el -name. Solemos enviar el resultado a un archivo aux y trabajar sobre ese
du --> obtenes tamaño de un archivo. Usamos el awk print $1 para tener solo el numero
wc -l --> lo usamos para tener la cantidad de lineas en un archivo. Lo usamos cuando tenemos un find o un archivo aux.
uname --> mediante diversos parametros nos trae informacion del servidor
free --> Informacion de la memoria. Usamos con grep Mem y awk para tener los distintos datos requeridos. 2 total, 3 usada, 4 libre, 5 compartida, 6 buffer cache, 7 disponible. Tambien nos da info de la swap con grep Swa
sleep 1 --> pausar la ejecucion por un momento
ps -fea --> informacion de los procesos. El awk 8 da nombre y 2 el PID
df --> nos da informacion sobre las particiones del disco y demas. El / es raiz y /boot el porcentaje de boot
tar zcvf --> comprimimos. Ej: tar zcvf backup_$(date +%F)_practicas.tar.gz /directorio/practicas
date --> nos trae la fecha. Usamos +%F para tener el formato YYYY mm dd. Tambien hay otras formas como +%Y-%m-%d
last --> lista de ultimos usuarios conectados.
sort --> ordena de menor a mayor
uniq -c --> cuenta la cantidad de repetidos unicos de la forma numero nombre
tail --> la ultima linea. Con -1 traemos solo la ultima linea.
$USER --> en esa variable se almacena el nombre del usuario activo que esta trabajando. Por ej: $USER = root / so / mariano
who --> información de los usuarios que están conectados al sistema y también otras informaciones como cuándo se arrancó el sistema y cuál es el nivel de ejecución del sistema
cp --> copiamos los archivos a otro directorio
chmod u-s --> saca permiso setuid
chmod g-s --> saca permiso setgid
chmod o-t --> saca permiso sticky
ps -fea | grep $USER --> mis procesos. Con cut 1 2 y 8 tenemos usuario, PID y nombre
$# --> cantidad de parametros
find path -perm -u=s --> archivos permiso setuid
find path -perm -g=s --> archivos permiso setgid
find path -perm -1000 --> archivos permiso sticky
