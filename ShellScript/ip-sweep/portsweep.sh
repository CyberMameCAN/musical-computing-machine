if [ "$1" == "" ]
then
	echo "You forgot an Port Number!"
	echo "Syntax: ./portsweep.sh 8080"

else
	for ip in $(cat iplist.txt); do
        nmap -sS -p $1 $ip &
	done
fi
