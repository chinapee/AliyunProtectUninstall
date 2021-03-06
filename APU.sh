#!/bin/sh

echo 正在执行. . .

yum install iptables-services -y

wget https://cdn.jsdelivr.net/gh/HXHGTS/AliyunProtectUninstall/uninstall.sh -O uninstall.sh

chmod +x uninstall.sh

./uninstall.sh

wget https://cdn.jsdelivr.net/gh/HXHGTS/AliyunProtectUninstall/quartz_uninstall.sh -O quartz_uninstall.sh

chmod +x quartz_uninstall.sh

./quartz_uninstall.sh

pkill aliyun-service

rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service

rm -rf /usr/local/aegis*

iptables -I INPUT -s 140.205.201.0/28 -j DROP

iptables -I INPUT -s 140.205.201.16/29 -j DROP

iptables -I INPUT -s 140.205.201.32/28 -j DROP

iptables -I INPUT -s 140.205.225.192/29 -j DROP

iptables -I INPUT -s 140.205.225.200/30 -j DROP

iptables -I INPUT -s 140.205.225.184/29 -j DROP

iptables -I INPUT -s 140.205.225.183/32 -j DROP

iptables -I INPUT -s 140.205.225.206/32 -j DROP

iptables -I INPUT -s 140.205.225.205/32 -j DROP

service iptables restart

/usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh stop

/usr/local/cloudmonitor/wrapper/bin/cloudmonitor.sh remove

rm -rf /usr/local/cloudmonitor

rm -rf /usr/local/share/aliyun-assist

rm -rf uninstall.sh

rm -rf quartz_uninstall.sh

echo 执行成功!
