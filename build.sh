#!/bin/bash
echo Welcome To Automated Kernel Compiler For smartron
echo By rajkale99
make clean && make mrproper && rm -rf output && rm -rf dsm/modules
echo Cleaned Some Old Crappy Files
export CROSS_COMPILE=~/toolchains/linaro/bin/aarch64-linux-android-
mkdir output && mkdir mod && mkdir -p output/mod
echo Compiler Set Sucessful
export ARCH=arm64
echo Compiler Set To Build For ARM64
make -C $(pwd) O=output msm-perf_defconfig
make -C $(pwd) O=output menuconfig
echo Picked Stock Config
make -j16 -C $(pwd) O=output
cp ~/rkkernel/output/arch/arm64/boot/Image.gz-dtb ~/rkkernel/dsm
mv ~/rkkernel/dsm/Image.gz-dtb ~/rkkernel/dsm/zImage
cd ~/rkkernel/output && mkdir -p mod/
find ~/rkkernel/output -name '*.ko' -exec cp {} mod/ \;
cd ~/rkkernel/output/mod
~/toolchains/linaro/bin/aarch64-linux-android-strip --strip-unneeded *.ko && mkdir pronto && cp -a wlan.ko pronto_wlan.ko && mv pronto_wlan.ko pronto
mv ~/rkkernel/output/mod/ ~/rkkernel/dsm
echo Building Has Been Completed
