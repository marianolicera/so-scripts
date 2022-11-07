#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    pid_t pid;
    pid = fork();
    if (pid==0)
    {
        printf("Soy el hijo %d y mi padre %d",getpid(),getppid());
        system("ls");
        while(1);
    }
    if (pid > 0){
        printf("Soy el padre %d\n",getpid());
        while(1);
    }
}
//PID >0 ES PADRE Y PID == 0 ES HIJO
//PONER UN While EN CADA PROCESO NOS DA LOS PIDS INDICADOS