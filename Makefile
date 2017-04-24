TARGET_CFLAGS="-march=$TARGET_CPU -mtune=$TARGET_CPU -m64"
PROJECT_CFLAGS="-mmovbe -mmmx -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mpopcnt -maes -mpclmul -mrdrnd -mfpmath=sse"

rtk_hciattach:hciattach.c hciattach_rtk.o  
	cc $TARGET_CFLAGS $PROJECT_CFLAGS -o rtk_hciattach hciattach.c hciattach_rtk.o  

hciattach_rtk.o:hciattach_rtk.c
	cc $TARGET_CFLAGS $PROJECT_CFLAGS -c hciattach_rtk.c

clean:
	rm -f *.o  rtk_hciattach

install:
	mkdir -p /lib/firmware/rtl_bt
	cp -p rtlbt_* /lib/firmware/rtl_bt/.
