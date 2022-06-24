#!/bin/bash
## Adriano Freitas - 2022
## Port knock script


if [ -z $1 ];then
	echo "No parameter passed!"
elif [ $1 == "open" ];then
	echo "Opening SSH port..."
	for x in 7000 8000 9000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done
elif [ $1 == "close" ];then
	echo "Closing SSH port..."
	for x in 9000 8000 7000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done
else
	echo "Invalid parameter"
fi






