#!/bin/bash
## @fdrian - 2022
## Port knock script
echo "Running $0"

if [ -z $1 ];then
	echo "No parameter passed!"
elif [ $1 == "open" ];then
	echo "Opening SSH port..."
	for x in $2 $3 $4; do nmap -q -Pn --host-timeout 201 --max-retries 0 -p $x drian 1>/dev/null; done
	echo "Done..."
elif [ $1 == "close" ];then
	echo "Closing SSH port..."
	for x in $4 $3 $2; do nmap -q -Pn --host-timeout 201 --max-retries 0 -p $x drian 1>/dev/null; done
	echo "Done..."
else
	echo "Invalid parameter"
fi
