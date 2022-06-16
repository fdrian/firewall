#!/bin/bash
for x in 9000 8000 7000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done

