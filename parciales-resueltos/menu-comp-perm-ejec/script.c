#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    pid_t pid;
    pid = fork();
    if (pid == 0){
        printf("Proceso hijo PID %d y Proceso padre PID %d\n",getpid(),getppid());
    }else{
        printf("Soy el proceso padre PID %d\n",getpid());
    }
}