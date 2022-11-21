#!/bin/bash
USU=$(users | grep -v '^so' | wc -l)
echo La cantidad de usuarios que no comienzan con nombre 'so' es: $USU