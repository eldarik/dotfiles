#!/bin/sh
echo $1
if $1
then tar -czf "../${PWD##*/}.tar.$1" .
else echo "not pass argument (bz2, gz or bz)"
fi
