#!/bin/bash

# 设置变量
DIST_DIR="/root/project/worker_web/dist"
TARGET_DIR="/var/www/worker_web"

echo "开始编译..."
npm run build

# 删除旧的部署目录
echo "正在删除旧的部署目录..."
sudo rm -rf $TARGET_DIR

# 移动新的构建文件到部署目录
echo "正在移动新的构建文件..."
sudo mv $DIST_DIR $TARGET_DIR

# 更改部署目录的所有权
echo "正在更改目录所有权..."
sudo chown -R www-data:www-data $TARGET_DIR

echo "部署完成!"