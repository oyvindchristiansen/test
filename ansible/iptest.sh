#!/bin/bash
iptables -F
iptables -t nat -F
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.0.0.11

iptables -A FORWARD -i eth0 -o eth0 -s 10.0.0.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

echo 0 > /proc/sys/net/ipv4/conf/all/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/accept_redirects
echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects
