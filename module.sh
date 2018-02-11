#!/bin/bash
rm -rf /home/raj/rkkernel/srt/dsm/modules
rm -rf /home/raj/rkkernel/srt/dsm/Image.gz-dtb
mkdir /home/raj/rkkernel/srt/output/modules
mkdir /home/raj/rkkernel/srt/dsm/modules
cd
cp /home/raj/rkkernel/srt/output/arch/arm64/boot/Image.gz-dtb /home/raj/rkkernel/srt/dsm/
mv /home/raj/rkkernel/srt/dsm/Image.gz-dtb /home/raj/rkkernel/srt/dsm/zImage
cd /home/raj/rkkernel/srt/output
find /home/raj/rkkernel/srt/output -name '*.ko' -exec cp {} modules/ \;
cd
cd /home/raj/rkkernel/srt/output/modules
/home/raj/uber/bin/aarch64-linux-android-strip --strip-unneeded *.ko
cp -a  wlan.ko pronto_wlan.ko
mkdir pronto
mv pronto_wlan.ko pronto
cd ../
mv modules/ /home/raj/rkkernel/srt/dsm
