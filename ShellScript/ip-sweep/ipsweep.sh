#!/bin/bash

if [ "$1" == "" ]
then
	echo "You forgot an IP adress!"
	echo "Syntax: ./ipsweep.sh 192.168.1"

else
	for ip in `seq 1 254`; do
		ping -c 1 $1.$ip | grep "64 バイト" | cut -d " " -f 4 | tr -d ":" &
	done
fi
