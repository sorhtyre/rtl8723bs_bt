
rtk_hciattach:hciattach.c hciattach_rtk.o  
	cc $(CFLAGS) -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	cc $(CFLAGS) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p /lib/firmware/rtl_bt
		cp -p firmware/rtl8723bs_config.bin /lib/firmware/rtl_bt/.
		cp -p firmware/rtl8723bs_fw.bin /lib/firmware/rtl_bt/.
		cp -p rtk_hciattach /usr/bin/.
		cp -p start_rtkbt.sh /usr/bin/.