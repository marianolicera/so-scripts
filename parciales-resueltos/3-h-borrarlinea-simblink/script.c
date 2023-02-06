#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int main(){
    int i,j;
    for (i=0; i<3; i++){
        if (fork()==0){
            if(i==0){
                system("ls -l");
            }
            if (i==1){
                for(j=1; j<11; j++){
                    printf("%d\n",j);
                }
            }
            if (i==2){
                printf("PID: %d PID Padre: %d\n",getpid(),getppid());
            }
        break;
        }
    }
    while(1);
}