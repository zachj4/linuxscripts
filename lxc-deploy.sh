#!/bin/bash

# Update LXC Container and minimize SSD wear.

# Perform full upgrade

apt update
apt -y full-upgrade

# Only swap to prevent SSD wear

echo "# only swap to prevent OOM" >> /etc/sysctl.d/sysctl.conf
echo "vm.swappiness = 0" >> /etc/sysctl.d/sysctl.conf

# Install unattended-upgrades to automatically keep LXC up to date.

apt-get update
apt-get install unattended-upgrades apt-listchanges
cp /usr/share/systemd/tmp.mount /etc/systemd/system/
systemctl enable tmp.mount

# Configure LXC time zone

timedatectl set-timezone America/Kentucky/Louisville