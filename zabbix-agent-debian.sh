#!/bin/bash

# Install and configure Zabbix agent for Debian

# Install sudo

apt install -y sudo

# Download Zabbix 7.0 Debian release

sudo wget https://repo.zabbix.com/zabbix/7.0/debian/pool/main/z/zabbix-release/zabbix-release_7.0-1+debian$(cut -d"." -f1 /etc/debian_version)_all.deb

# Extract .deb file

dpkg -i zabbix-release_7.0-1+debian$(cut -d"." -f1 /etc/debian_version)_all.deb

# Update sources

sudo apt update
sudo apt -y upgrade

# Install Zabbix agent

sudo apt -y install zabbix-agent

# Configure Zabbix agent

sudo nano /etc/zabbix/zabbix_agentd.conf

# Restart Zabbix service

sudo systemctl restart zabbix-agent && sudo systemctl enable zabbix-agent