# RTL8723BS Bluetooth
Realtek UART HCI Bluetooth driver

Tested on:
- Intel Compute Stick STCK1A8LFC

The BayTrail UART HCI drivers require patches under the 4.9 Linux kernel.

Ensure Kernel is built to support GPIO RFKILL driver, support for Synopsys
DesignWare 8250 quirks, and HCI UART driver with three-wire UART (H5)
protocol support.

- CONFIG_RFKILL_GPIO=m
- CONFIG_SERIAL_8250_DW=m
- CONFIG_BT_HCIUART=m
- CONFIG_BT_HCIUART_3WIRE=y


### Patches
Verified against Linux kernel 4.9.13
Current dirver includes required patches:
- patches/
  - 0001-Add-Realtek-RTL8723BS-Bluetooth-to-rfkill-gpio.patch


### Firmware
Verified against Linux kernel 4.9.13
Current dirver includes required firmwares:
- firmware/
  - rtl8723bs_btcnfg.bin
  - rtl8723bs_btfw.bin
  - rtl8723bs_btfw-new.bin			*[can be used, in certain cases, if renamed to rtl8723bs_btfw.bin]*


### Install
```
 make
 sudo make install
 sudo start_bt.sh
 
 ```
