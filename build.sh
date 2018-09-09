#!/bin/bash
echo Welcome To Automated Kernel Compiler For smartron
echo By rajkale99
make clean && make mrproper && rm -rf output && rm -rf dsm/modules && rm -rf dsm/zImage
echo Cleaned Some Old Crappy Files
export CROSS_COMPILE=~/toolchains/bin/aarch64-opt-linux-android-

mkdir output && mkdir modules && mkdir -p output/modules
echo Compiler Set Sucessful
export ARCH=arm64
echo Compiler Set To Build For ARM64
make -C $(pwd) O=output rk_defconfig
echo Picked Stock Config
make -j16 -C $(pwd) O=output
cp ~/rk_kernel/output/arch/arm64/boot/Image.gz-dtb ~/rk_kernel/dsm
mv ~/rk_kernel/dsm/Image.gz-dtb ~/rk_kernel/dsm/zImage
cd ~/rk_kernel/output && mkdir -p modules/
find ~/rk_kernel/output -name '*.ko' -exec cp {} modules/ \;
cd ~/rk_kernel/output/modules
~/toolchains/bin/aarch64-opt-linux-android-strip --strip-unneeded *.ko && mkdir pronto && cp -a wlan.ko pronto_wlan.ko && mv pronto_wlan.ko pronto
mv ~/rk_kernel/output/modules/ ~/rk_kernel/dsm
echo Building Has Been Completed
