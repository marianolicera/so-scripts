Hacer una rutina en lenguaje C, que genere el siguiente arbol de procesos, donde el Hijo 4, debe ejecutar un script que uestre por pantalla la cantidad de usuarios que **no** comienza con nombre "so" que hay en el server que estoy usando. El hijo2, 3 y 5 deben crear 1 hijo cada uno o sea nieto2, 3 y 5. Se debera mostrar el PID del padre y de los 4 hijos

**Padre (PID) ---> Hijo1 (PID)**
            **---> Hijo2 (PID) ---> Nieto2**
            **---> Hijo3 (PID) ---> Nieto3**
            **---> Hijo4 (PID) ---> ejecutar script**
            **---> Hijo5 (PID) ---> Nieto5**
La salida tiene que ser
Soy el padre: xxxx
Soy el hijo1: xxxx
Soy el hijo2: xxxx
Soy el hijo3: xxxx
Soy el hijo4: xxxx
Soy el hijo5: xxxx
La cantidad de usuarios que no comienzan con nombre "so" es: xxxx