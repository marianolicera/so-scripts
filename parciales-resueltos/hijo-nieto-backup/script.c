#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main(){
    int id=fork();
    if(id == -1){
        return -1
    }
    if(id == 0){
        //es el hijo
        printf("Soy el hijo %d mi padre es %d\n",getpid(),getppid());
        int id_nieto=fork();
        if(id_nieto == 0){
            //es el nieto
            printf("Soy el nieto %d mi padre es %d\n",getpid(),getppid());
        }
    } else{
        // es el padre
        printf("Soy el padre %d mi padre es %d\n",getpid(),getppid());
    }
    sleep(10);
}