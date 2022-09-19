#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    pid_t pid;
    pid = fork();
    if (pid == 0){
        printf("Soy el proceso hijo, mi pid es %d y el de mi padre %d\n",getpid(),getppid());
    }else{
        printf("Soy el proceso padre y mi pid es %d\n",getpid());
    }
}