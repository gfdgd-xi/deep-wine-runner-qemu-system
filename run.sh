#!/bin/bash
set -e
export PATH=/opt/apps/deepin-wine-runner-qemu-system-extra/files/usr/local/bin:$PATH
echo 推荐使用 Wine 运行器的虚拟机管理工具调用 Qemu,如果安装了 Wine 运行器输入命令 
echo /opt/apps/deepin-wine-runner/StartVM.sh
echo 启动虚拟机管理工具
echo ==========================
echo 也可以通过命令调用，输入 qemu-system-x86_64 开始吧
echo 当前 Qemu 版本：
qemu-system-x86_64 --version
bash $@