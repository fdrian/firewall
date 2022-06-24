# Simple firewall with knockd
## Adriano Freitas - https://adrianofreitas.me

1. Requeriments
```
apt install iptables
apt install knockd
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
/etc/init.d/knockd start
```




