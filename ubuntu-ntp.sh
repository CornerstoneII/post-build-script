#!/bin/bash
#=============================================================
# Author: Olanrewaju Bakare
#=============================================================

# Disabling timesyncd
timedatectl

timedatectl set-ntp no

# Firewall Settings

ufw allow out 123/udp

ufw allow 123/udp

# Installing ntpd

apt update

apt install -y ntp

# Activating ntpd

systemctl status ntp

# check ntpd’s connections to other time servers using the ntpq -p

ntpq -p

# Manual Sync
# Step 1. Stop the ntpd service.
systemctl stop ntpd

# Step 2. Run the ntpd -gq command to force a manual time sync.
ntpd -gq

# Step 3. Restart the ntpd service.
systemctl start ntpd