#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    int i,j,suma;
    for(i=0;i<3;i++){
        if(fork()==0){
            if(i==0){
                printf("Soy HIJO %d, mi PID: %d, de mi padre: %d\n",i+1,getpid(),getppid());
            }
            if(i==1){
                printf("Soy HIJO %d, mi PID: %d, de mi padre: %d\n",i+1,getpid(),getppid());
            }
            if(i==2){
                printf("HIJO %d, PADRE %d\n",getpid(),getppid());
                suma = getpid() + getppid();
                printf("Suma de PIDs: %d\n",suma);
            }
            break;
        }
    }
    while(1);
}