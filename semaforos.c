#include <stdio.h>
#include <stdlib.h>
#include <pthread>
#include <semaphore.h>

static void * function_hilo1(void* arg);
static void * function_hilo2(void* arg);

sem_t sem1;

int main(void)
{
    pthread_t hilo1, hilo2;
    sem_init(&sem1, 0, 0);
    pthread_create(&hilo1, NULL, *function_hilo1, NULL);
    pthread_create(&hilo2, NULL, *function_hilo2, NULL);
    pthread_join(hilo1, NULL);
    pthread_join(hilo2, NULL);
    return 0;
}

static void * function_hilo1(void* arg)
{
    printf("Primero aprendo lenguaje C\n"); //Seccion critica
    sem_post(&sem1);
}
static void * function_hilo2(void* arg)
{
    sem_wait(&sem1);
    printf("Segundo trataré de aprender semáforos\n"); //Seccion critica
    sem_post(&sem1);
}