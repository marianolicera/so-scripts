#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    pid_t pid;
    int i,j;
    for (i=1; i<6; i++){
        pid=fork();
        if (pid == 0){
            printf("Soy el hijo %d: %d\n",i,getpid());
                if (i==1){
                    printf("Soy el proceso padre: %d\n",getppid());
                }
                if (i==2){
                    fork();
                }
                if (i==3){
                    fork();
                }
                if (i==4){
                    system("bash usuarios.sh")
                }
                if (i==5){
                    fork();
                }
            break;
        }
    }
    while(1);
    return 0;
}