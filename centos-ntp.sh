#!/bin/bash
#=============================================================
# Author: Olanrewaju Bakare
#=============================================================
# Disabling Chrony
systemctl stop chronyd

systemctl disable chronyd

sudo systemctl status chronyd

# Installing ntpd

yum install -y ntp

# Configuring ntpd and Checking the Firewall
grep UDP_ /etc/csf/csf.conf
UDP_IN = “20,21,53”
UDP_OUT = “20,21,53,113,123,873,6277”


firewall-cmd --zone=public --add-port=123/udp --permanent

timedatectl

timedatectl list-timezones | grep Detroit

# To set the listed timezone

timedatectl set-timezone America/Detroit

# Activating ntpd

systemctl start ntpd

systemctl enable ntpd

# confirm the service is running using the systemctl status ntpd command

systemctl status ntpd

