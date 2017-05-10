#!/bin/bash
#
#  Shell script to install firmware and activate the RTL8723BS Bluetooth device.
#
# Note: The script attempts to select the seiral tty listed under the first 80860F0A device
# 

if [ "$1" = "" ]
then
    # Find the Serial TTY attached to the Bluetooth device
    TTY=`ls /sys/devices/platform/80860F0A:00/tty/`
else
    # Use the TTY device passed via command line
    TTY=$1
fi

TTY="/dev/$TTY"
echo "Using device $TTY for Bluetooth"

# Slow the sample rate to a more managable level
echo 30000 > /proc/sys/kernel/perf_event_max_sample_rate

#Attach serial device via UART HCI to the Bluetooth stack
rtk_hciattach -n -s 115200 $TTY rtk_h5 > /var/log/hciattach.log 2>&1 &
