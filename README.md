# Simple firewall with knockd
## Drian - 2022

# Knockd
1. Requeriments
```
apt install iptables
apt install knockd
apt install nmap
```

2. Edit file /etc/knockd.conf
```
[openSSH]
	command	= /sbin/iptables -I INPUT -s %IP% -p tcp --dport 22 -j ACCEPT
```

3. Edit file /etc/default/knockd
```
START_KNOCKD=1
```

4. Enable and Start daemon
```
/etc/init.d/knockd enable
/etc/init.d/knockd start
```
5. Setting and Start firewall script
```
sudo chmod +x firewall.sh
bash firewall.sh
```

# Port Knock
1. Setting
```
sudo chmod +x pknock.sh
```
2. Open ports
```
bash pknock.sh open
```
3. Close ports
```
bash pknock.sh close
```

