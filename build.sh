#!/bin/bash


#Colors
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
purple='\033[1;35m'
cyan='\033[0;36m'
nc='\033[0m'

echo -e "$cyan---------------- ----";
echo -e "------------------------\n";
echo -e "██████╗--█████╗-- ███████╗";
echo -e "██╔══██╗██╔══██╗     ██  ╝";
echo -e "██████╔╝███████║     ██ ║";
echo -e "██╔══██╗██╔══██║     ██ ║";
echo -e "██║--██║██║--██║ ██████ ║";
echo -e "╚═╝--╚═╝╚═╝--╚═╝ ╚══════╝\n";


echo -e "$cyan  Welcome To Automated Kernel Compiler For sander"
echo -e "$red  By rajkale99"
make clean && make mrproper && rm -rf output && rm -rf ~/ank/zImage && rm -rf ~/ank/Image.gz-dtb
echo -e "$purple Cleaned Some Old Crappy Files"
export CROSS_COMPILE=~/toolchain/bin/aarch64-linux-android-
mkdir output && mkdir modules && mkdir -p output/modules
echo -e "$green Compiler Set Sucessful"
export ARCH=arm64
echo -e "$brown  Compiler Set To Build For ARM64"
make -C $(pwd) O=output rk_defconfig
echo -e "$blue  Picked Stock Config"
make -j32 -C $(pwd) O=output
cp -rf ~/msm8976/output/arch/arm64/boot/Image.gz-dtb ~/ank/
cd ~/ank/
mv Image.gz-dtb zImage
cd ~/msm8976/output && mkdir -p modules/
find ~/msm8976/output -name '*.ko' -exec cp {} modules/ \;
cd ~/msm8976/output/modules
~/toolchain/bin/aarch64-linux-android-strip --strip-unneeded *.ko && mkdir pronto && cp -a wlan.ko pronto_wlan.ko && mv pronto_wlan.ko pronto
mv ~/msm8976/output/modules/ ~/msm8976/ank
echo -e "$nc  Building Has Been Completed"
cd ~/msm8976
