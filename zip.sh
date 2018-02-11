#!/bin/bash
rm .version
# Bash Color
green='\033[01;32m'
red='\033[01;31m'
cyan='\033[01;36m'
blue='\033[01;34m'
blink_red='\033[05;31m'
restore='\033[0m'

clear

# Resources
THREAD="-j$(grep -c ^processor /proc/cpuinfo)"
DEFCONFIG="rk_defconfig"
KERNEL="Image.gz-dtb"

# RK Kernel Details
BASE_VER="RK-KERNEL-OREO"
VER="-$(date +"%Y-%m-%d"-%H%M)"
K_VER="$BASE_VER$VER-rimo02a"

# Vars
export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER="rajkale99"
export KBUILD_BUILD_HOST="RAJ"
export TZ="Asia/Calcutta"

# Paths
KERNEL_DIR=`pwd`
RESOURCE_DIR="/home/raj/rkkernel/srt"
ANYKERNEL_DIR="$RESOURCE_DIR/dsm"
TOOLCHAIN_DIR="/home/raj/toolhain-8.2"
REPACK_DIR="$ANYKERNEL_DIR"
PATCH_DIR="$ANYKERNEL_DIR/patch"
MODULES_DIR="$ANYKERNEL_DIR/modules"
ZIP_MOVE="$RESOURCE_DIR/kernel_out"
ZIMAGE_DIR="$KERNEL_DIR/arch/arm64/boot"


# Functions
function make_zip {
		cd $REPACK_DIR
                zip -r `echo $K_VER`.zip *
                mkdir $ZIP_MOVE
		mv  `echo $K_VER`.zip $ZIP_MOVE
		cd $KERNEL_DIR
}

DATE_START=$(date +"%s")
		echo "Compiling RK-Kernel Using Ubertc-8.2  Toolchain"
echo -e "${restore}"
		make_zip

echo -e "${green}"
echo $K_VER.zip
echo "------------------------------------------"
echo -e "${restore}"

DATE_END=$(date +"%s")
DIFF=$(($DATE_END - $DATE_START))
echo "Time: $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
echo " "
cd $ZIP_MOVE
ls
