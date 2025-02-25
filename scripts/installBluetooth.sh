#!/bin/bash
#
#  ____              _   _
# / ___|  __ _ _ __ | |_(_) __ _  __ _  ___
# \___ \ / _` | '_ \| __| |/ _` |/ _` |/ _ \
#  ___) | (_| | | | | |_| | (_| | (_| | (_) |
# |____/ \__,_|_| |_|\__|_|\__,_|\__, |\___/
#                                |___/
#
# Arch Linux post-installation script
# by Santiago Torres

# Check if the computer has PCIe bluetooth devices
echo "Checking for Bluetooth Devices"
dmesg | grep -i bluetooth                   > /dev/null
if [ $? -eq 0 ]; then
    echo "Found Bluetooth"
    echo "Installing Bluetooth utilities"
    pacman -S bluez bluez-utils bluedevil   > /dev/null 2>&1
    systemctl enable bluetooth              > /dev/null 2>&1
else
    echo "No Bluetooth devices were found"
fi
