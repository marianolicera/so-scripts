#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>

int i;
int main(){
	for(i=0;i<5;i++){
		if(fork()==0){
			printf("SOY EL HIJO %d MI PID ES: %d\n", i+1, getpid());
			if(i==0){
				if(fork()==1){break;}
			}
			if(i==1){
				system("bash script.sh");
			}
			if(i==2){
				for(i=0;i<3;i++){
					if(fork()==0){
						break;
					}
				}
			}
			if(i==4){
				printf("SOY EL PROCESO PADRE, MI PID ES: %d\n", getppid());
			}
			break;
		}
	}
while(1);
return 0;
}