#!/bin/bash
## Adriano Freitas - 2022
## Port knock script

for x in 7000 8000 9000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done

#!/bin/bash
for x in 9000 8000 7000; do nmap -Pn --host-timeout 201 --max-retries 0 -p $x adrianofreitas; done



