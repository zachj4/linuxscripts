#!/bin/bash

# Create zj-scripts directory
echo "Creating zj-scripts directory..."
mkdir -p /opt/zj-scripts

# Create package-upgrade.sh script
echo "Downloading package-upgrade script..."
wget -O /opt/zj-scripts/package-upgrade.sh https://raw.githubusercontent.com/zachj4/linuxscripts/refs/heads/main/package-upgrade.sh
chmod a+x /opt/zj-scripts/package-upgrade.sh

# Create crontab job
echo "Adding package-upgrade script to crontab..."
(crontab -l 2>/dev/null; echo "0 17 * * 1 /bin/bash /opt/zj-scripts/package-upgrade.sh") | crontab -

# Finished
echo "Finished!"