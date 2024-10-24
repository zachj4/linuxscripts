#!/bin/bash

# Update LXC Container and minimize SSD wear.

echo "===LXC Deploy Script - zjones==="

# Perform full upgrade

echo "Performing full upgrade..."
apt update
apt -y full-upgrade

# Configure swap and tmp to prevent SSD wear

echo "Configuring swap and tmp to prevent SSD wear..."
echo "# only swap to prevent OOM" >> /etc/sysctl.d/sysctl.conf
echo "vm.swappiness = 0" >> /etc/sysctl.d/sysctl.conf
cp /usr/share/systemd/tmp.mount /etc/systemd/system/
systemctl enable tmp.mount

# Install unattended-upgrades to automatically keep LXC up to date

echo "Installing unattended-upgrades..."
apt-get update
apt-get install unattended-upgrades apt-listchanges

# Add package-upgrade.sh to crontab

echo "Running script to add package-upgrade.sh script to crontab..."
wget -O /tmp/auto-upgrades.sh https://raw.githubusercontent.com/zachj4/linuxscripts/refs/heads/main/auto-upgrades.sh
chmod a+x /tmp/auto-upgrades.sh
./tmp/auto-upgrades.sh

echo "Auto-upgrades script completed..."

# Configure LXC time zone

echo "Configuring time-zone to Eastern Time..."

timedatectl set-timezone America/Kentucky/Louisville

# Completed

echo "Finished!"