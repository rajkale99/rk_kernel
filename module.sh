#!/bin/bash
rm -rf $(pwd)/dsm/modules
rm -rf $(pwd)/dsm/Image.gz-dtb
rm -rf $(pwd)output/modules
rm -rf $(pwd)/dsm/zImage
mkdir $(pwd)/output/modules/
mkdir $(pwd)/dsm/modules/
cp $(pwd)/output/arch/arm64/boot/Image.gz-dtb $(pwd)/dsm/
mv $(pwd)/dsm/Image.gz-dtb $(pwd)/dsm/zImage
find $(pwd)/output -name '*.ko' -exec cp {} $(pwd)/output/modules/ \;
cd $(pwd)/output/modules
~/google4.9/bin/aarch64-linux-android-strip --strip-unneeded *.ko
cp -a  wlan.ko pronto_wlan.ko
mkdir pronto
mv pronto_wlan.ko pronto
cd ~/test/output
mv modules/ $(pwd)/../dsm/
cd $(pwd)/../
