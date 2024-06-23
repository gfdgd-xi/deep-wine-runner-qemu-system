#!/bin/bash
# $1=arm64
# $2=buster
sudo apt update
sudo apt install debootstrap qemu-user-static -y
bottlePath=./system-bottle
sudo debootstrap --arch=$1 $2 $bottlePath
sudo bash .github/workflows/pardus-chroot $bottlePath
# 配置 git
sudo chroot $bottlePath apt update
sudo chroot $bottlePath apt install git -y
sudo chroot $bottlePath git clone https://github.com/gfdgd-xi/deep-wine-runner-qemu-system --depth=1
# 修改版本号
bash .github/workflows/run-command-in-chroot.sh sed -i "s/) UNRELEASED; urgency=medium/~buster) UNRELEASED; urgency=medium/g" $bottlePath/deep-wine-runner-qemu-system/debian/changelog
bash .github/workflows/run-command-in-chroot.sh .github/workflows/configure-building-enviroment.sh
exit 0