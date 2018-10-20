#!/bin/bash
echo Welcome To Automated Kernel Compiler For smartron
echo By rajkale99

echo Cleaning some old files
rm -rf $(pwd)output
rm -rf $(pwd)dsm/zImage
make clean
make mrproper
echo Cleaned Some Old Crappy File

export CROSS_COMPILE=/home/rajkale99/google4.9/bin/aarch64-linux-android-

echo Compiler Set Succesfully

mkdir $(pwd)/output

echo Setting Compiler To Build For ARM64

export ARCH=arm64
export SUBARCH=arm64
export KBUILD_BUILD_USER="Rajkale99"
export KBUILD_BUILD_HOST="rk_kernel"

echo Picking rk_kernel configs

make -j4 -C $(pwd) O=output rk_defconfig

echo Compiling awesomeness

make -j32 -C $(pwd) O=output
echo Building Has Been Completed
