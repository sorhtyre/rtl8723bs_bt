
#Build for the Silvermont Atom processor
#CFLAGS	:=-march=silvermont -mtune=silvermont -m64
#CFLAGS	+=-mmovbe -mmmx -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mpopcnt -maes -mpclmul -mrdrnd -mfpmath=sse

rtk_hciattach:hciattach.c hciattach_rtk.o  
	cc $(CFLAGS) -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	cc $(CFLAGS) -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p /lib/firmware/rtl_bt
	cp -p firmware/rtl8723bs_btcnfg.bin /lib/firmware/rtl_bt/.
	cp -p firmware/rtl8723bs_btfw.bin /lib/firmware/rtl_bt/.
	cp -p rtk_hciattach /usr/bin/.
	cp -p start_bt.sh /usr/bin/.