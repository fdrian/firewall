#!/bin/bash
## Adriano Freitas - 2022
## Simple firewall with knockd

# Clear rules
iptables -F
iptables -X

# Default policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Rules
# Loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# ICMP
iptables -A INPUT -i eth0  -p icmp --icmp-type echo-request -s 10.0.0.0/24 -j ACCEPT
iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT  -p icmp -m state --state ESTABLISHED,RELATED     -j ACCEPT


# SSH
iptables -A INPUT -i eth0 -p tcp --dport 22 -j LOG --log-prefix "SSH: " --log-level info
iptables -A INPUT -i eth0 -p tcp --dport 22 -s 10.0.0.101/32 -j ACCEPT

# DNS
iptables -A OUTPUT -o eth0 -p udp --dport 5053 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 5053 -m conntrack --ctstate ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 5053 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 5053 -m conntrack --ctstate ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth0 -p udp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 53 -m conntrack --ctstate ESTABLISHED  -s 10.0.0.0/24 -j ACCEPT

iptables -A OUTPUT -o eth0 -p tcp --dport 53 -m conntrack --ctstate NEW,ESTABLISHED  -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 53 -m conntrack --ctstate ESTABLISHED  -s 10.0.0.0/24 -j ACCEPT

# DHCP
iptables -I INPUT -i eth0 -p udp --source-port 67:68 --destination-port 67:68 -j ACCEPT
iptables -I OUTPUT -o eth0 -p udp --source-port 67:68 --destination-port 67:68 -j ACCEPT

# HTTP/HTTPS
iptables -A INPUT  -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --sports 80,443 -m conntrack --ctstate ESTABLISHED     -j ACCEPT

# NTP
iptables -A OUTPUT -p udp --dport 123 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT  -p udp --sport 123 -m state --state ESTABLISHED     -j ACCEPT


iptables -A OUTPUT -m conntrack  --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -m conntrack  --ctstate ESTABLISHED -j ACCEPT


iptables -A INPUT -j DROP


