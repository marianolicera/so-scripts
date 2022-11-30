#!/bin/bash
chmod o+t $1 #PERMISO STICKY
chmod u+s $1 #PERMISO SUID
chmod g+s $1 #PERMISO SGID