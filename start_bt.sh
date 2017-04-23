#!/bin/bash
#
# Shell script to install Bluetooth firmware and attach BT part of
# RTL8723BS
#
if [ "$1" = "" ]
then
    # Find the TTY attached to the BT device
    TTY=`dmesg | grep ttyS | cut -b 28-32`
else
    # Use the TTY device mentioned OI the call
    TTY=$1
fi

TTY="/dev/$TTY"
echo "Using device $TTY for Bluetooth"

./rtk_hciattach -n -s 115200 $TTY rtk_h5 > hciattach.txt 2>&1 &

