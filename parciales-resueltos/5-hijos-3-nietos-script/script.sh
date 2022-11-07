#!/bin/bash

cant=$(users| grep ^so|wc -l)
echo LA CANTIDAD DE USUARIOS QUE EMPIEZAN CON SO es: $cant
