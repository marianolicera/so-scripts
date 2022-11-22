#include <stlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/types.h>

int main(){
    int i,j,k
    for (i=0;i<3;i++){
        if (fork()==0){
            if (i==1){
                if (fork()!=0){
                    for (j=0;j<2;j++){
                        if (fork()==0){
                            if (j==1){
                                for (k=0;k<3;k++){
                                    if (fork()!=0){
                                        break;
                                    }
                                }
                            }
                            break;
                        }
                    }
                    break;
                }
            }
            break;
        }
    }
}