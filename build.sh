#!/bin/bash
echo Welcome To Automated Kernel Compiler For smartron
echo By rajkale99
make clean && make mrproper && rm -rf output && rm -rf dsm/modules && rm -rf dsm/zImage
echo Cleaned Some Old Crappy Files
export CROSS_COMPILE=~/toolchain/bin/aarch64-opt-linux-android-


mkdir output && mkdir modules && mkdir -p output/modules
echo Compiler Set Sucessful
export ARCH=arm64
echo Compiler Set To Build For ARM64
make -C $(pwd) O=output rk_defconfig
echo Picked Stock Config
make -j16 -C $(pwd) O=output
cp ~/rkkernel/srt/output/arch/arm64/boot/Image.gz-dtb ~/rkkernel/srt/dsm
mv ~/rkkernel/srt/dsm/Image.gz-dtb ~/rkkernel/srt/dsm/zImage
cd ~/rkkernel/srt/output && mkdir -p modules/
find ~/rkkernel/srt/output -name '*.ko' -exec cp {} modules/ \;
cd ~/rkkernel/srt/output/modules
~/toolchain/bin/aarch64-opt-linux-android-strip --strip-unneeded *.ko && mkdir pronto && cp -a wlan.ko pronto_wlan.ko && mv pronto_wlan.ko pronto
mv ~/rkkernel/srt/output/modules/ ~/rkkernel/srt/dsm
echo Building Has Been Completed
