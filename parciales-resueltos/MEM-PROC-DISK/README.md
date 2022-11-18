Hacer un script que realice lo siguiente:
1) Genere un archivo de nombre "MEM" con la siguiente informacion
 - Total de memoria RAM del sistema
 - Memoria usada del sistema
 - Memoria libre del sistema
 - Memoria buffers
 - Memoria cache
2) Genere un archivo de nombre "PROC" con la informacion de procesos de cualquier usuario que paso por parametro. En caso de pasar mi propio usuario debe dejar en un archivo de nombre "Mis-Proc" el PID y nombre del proceso, con el siguiente formato:
 - PID      Nombre Proceso
En caso de no pasar parametro, solamente realizo los pasos 1 y 3
3) Genere un archivo de nombre "DISK" con la informacion del porcentaje de uso de la particion donde esta montada la raiz del sistema linux y la particion /boot.