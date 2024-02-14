#!/bin/bash

# 判断是否为root用户
if [ `id -u` -ne 0 ]; then
    echo "请使用sudo或作为root用户运行此脚本以执行必要的操作。"
    #在这里1是状态码，表示脚本执行出现了某种问题或错误。通常，成功的执行返回状态码为0，而非零的状态码通常表示错误或异常情况。
    exit 1
fi

# 提示用户输入交换文件大小
read -p "请输入交换文件大小（例如16G）: " swap_size

# 验证输入是否符合格式，以G结尾表示
if [[ ! $swap_size =~ ^[0-9]+[Gg]$ ]]; then
    echo "无效的输入格式，请使用格式如'16G'表示大小。"
    exit 1
fi

# 提示用户确认操作
read -p "将创建大小为 $swap_size 的交换文件，是否继续？(y/n): " confirm

if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "操作已取消."
    exit 1
fi

# 计算交换文件大小（这里把上面获取到大小系数和1024相乘，例如，如果swap_size的值是"16G"，那么${swap_size%G}将会得到"16"，去掉了末尾的 "G"。）
swap_size=$(( ${swap_size%G} * 1024 ))

# 创建交换文件
dd if=/dev/zero of=/swapfile bs=1M count=${swap_size} status=progress

# 设置正确的权限
chmod 600 /swapfile

# 格式化交换文件
mkswap /swapfile

# 启用交换文件
swapon /swapfile

# 将/swapfile追加到/etc/fstab文件内
echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab

echo "交换文件创建成功并已启用，而且追加到/etc/fstab内。"