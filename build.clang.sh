#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018 Raphiel Rollerscaperers (raphielscape)
# Copyright (C) 2018 Rama Bondan Prakoso (rama982)
# Android Kernel Build Script

# Main environtment
KERNEL_DIR=$PWD
KERN_IMG=$KERNEL_DIR/out/arch/arm64/boot/Image.gz-dtb
ZIP_DIR=$KERNEL_DIR/AnyKernel3
CONFIG=mido_defconfig
CROSS_COMPILE="aarch64-linux-android-"
CROSS_COMPILE_ARM32="arm-linux-androideabi-"
PATH=:"${KERNEL_DIR}/clang/clang-r377782c/bin:${PATH}:${KERNEL_DIR}/stock/bin:${PATH}:${KERNEL_DIR}/stock_32/bin:${PATH}"

# Export
export ARCH=arm64
export CROSS_COMPILE
export CROSS_COMPILE_ARM32

# Build start
make O=out $CONFIG
make -j$(nproc --all) O=out \
                      ARCH=arm64 \
                      CC=clang \
CLANG_TRIPLE=aarch64-linux-gnu- \
CROSS_COMPILE=aarch64-linux-android-

if ! [ -a $KERN_IMG ]; then
    echo "Build error!"
    exit 1
fi

cd $ZIP_DIR
make clean &>/dev/null
cd ..

cd $ZIP_DIR
cp $KERN_IMG zImage
cp $OUTDIR/arch/arm64/boot/dtbo.img $ZIP_DIR
make normal &>/dev/null
echo "Flashable zip generated under $ZIP_DIR."
cd ..
# Build end
