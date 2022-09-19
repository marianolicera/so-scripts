#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main()
{
    int i,j;
    printf("Soy el proceso PADRE con PID: %d\n",getpid()); //EL PROCESO PADRE EL PRIMERO QUE SE EJECUTA
    for (i = 0; i < 3: i++){ //ITERO POR LA CANTIDAD DE HIJOS QUE DESEO
        if (fork() == 0){
            printf("Soy el hijo %d con PID %d y padre PID %d\n",i,getpid(),getppid());
            if(i == 0){ //EL PRIMER HIJO, EL 1 EL SEGUNDO Y ASÍ
                for(j == 0; j <3; j++){ //creo nietos sobre el hijo iésimo
                    if(fork() == 0){
                        printf("nieto PID %d padre PID %d\n",getpid(),getppid());
                        break; //para que los nietos no creen procesos
                    }
                }
            }
            if( i == 2){ //Para hacer algo sobre el hijo 3
                printf("Soy el hijo 3 PID %d\n",getpid());
            }
            break; //para que los procesos hijos ya no creen más procesos
        }
    }
    while(1); //para que no se cierre y se puedan ver los PID bien
}