#!/bin/bash
#
# Shell script to install Bluetooth firmware and attach BT part of
# RTL8723BS
#
if [ "$1" = "" ]
then
    # Find the TTY attached to the BT device
    TTY=`dmesg | grep ttyS | cut -b 32`

    if [ "$TTY" = "" ]
    then
	echo
	echo "No BT TTY device has been found"
	echo "Either this computer has no BT device that uses hciattach, or"
	echo "Your kernel does not have module 8250_dw configured."
	echo "Note: The configuration variable is CONFIG_SERIAL_8250_DW."
	echo
	exit 1
    fi
else
    # Use the TTY device mentioned OI the call
    TTY=$1
fi

TTY="/dev/$TTY"
echo "Using device $TTY for Bluetooth"

if [ ! -f /lib/firmware/rtl_bt/rtlbt_config ];
then
	mkdir -p /lib/firmware/rtl_bt/
	cp rtlbt_* /lib/firmware/rtl_bt/.
fi
./rtk_hciattach -n -s 115200 $TTY rtk_h5 > hciattach.txt 2>&1 &

