#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>


int main(){

	if(fork()==0){
		printf("Soy el proceso HIJO, mi PID es: %d\n", getpid());
		system("bash hijo.sh");
	}else{
		printf("Soy el proceso PADRE, mi PID es: %d\n", getpid());
		system("bash padre.sh");
	}
return 0;
}