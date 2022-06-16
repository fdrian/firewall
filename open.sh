#!/bin/bash
for x in 7000 8000 9000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done

