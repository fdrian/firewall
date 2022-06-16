#!/bin/sh
## Adriano Freitas - 2022
## adrinofreitas.me
## Simple firewall with knockd

# Clear rules
iptables -F
iptables -X

# Default policy
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Rules
iptables -A INPUT -i lo -j ACCEPT

iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j DROP



