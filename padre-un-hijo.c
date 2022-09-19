#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
int main(){
    int pid;
    pid = fork();
    if (pid == -1){
        printf("Error\n");
        exit(-1);
    }
    if (pid == 0){
        printf("Soy el proceso hijo\n");
    }else{
        printf("Soy el proceso padre\n");
    }
    while(1);
}