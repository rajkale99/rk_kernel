#!/bin/bash
cp /home/raj/rkkernel/srt/output/arch/arm64/boot/Image.gz-dtb /home/raj/rkkernel/srt/dsm/
mv /home/raj/rkkernel/srt/dsm/Image.gz-dtb /home/raj/rkkernel/srt/dsm/zImage/
cd /home/raj/rkkernel/srt/output
find/home/raj/rkkernel/srt/output -name '*.ko' -exec cp {} modules/ \;
cd /home/raj/rkkernel/srt/output/modules
/home/raj/toolchain/bin/aarch64-opt-linux-android-strip --strip-unneeded *.ko
cp  wlan.ko pronto_wlan.ko
mv pronto_wlan.ko pronto
cd ../
mv modules/ /home/raj/rkkernel/srt/dsm
