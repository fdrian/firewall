# Simple firewall with knockd
## Adriano Freitas - https://adrianofreitas.me

## Requeriments
apt install iptables
apt install knockd

## Edit file /etc/knockd.conf
[openSSH]
	command	= /sbin/iptables -I INPUT -s %IP% -p tcp --dport 22 -j ACCEPT

## Edit file /etc/default/knockd
START_KNOCKD=1

## Start daemon
/etc/init.d/knockd start




