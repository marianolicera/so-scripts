#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    pid_t pid;
    pid = fork();
    if (pid == 0)
    {
        printf("Soy el hijo %d y mi padre es %d\n",getpid(),getppid());
        
    }else{
        printf("Soy el proceso padre %d\n y mi padre es %d\n",getpid(),getppid());
    }
    
}