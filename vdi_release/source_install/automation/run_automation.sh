#!/bin/bash
# VDI 自动化启动脚本

export DISPLAY=:99

echo ">>> 等待 X 服务器就绪..."
for i in {1..30}; do
    if xdpyinfo -display :99 >/dev/null 2>&1; then
        echo ">>> X 服务器就绪"
        break
    fi
    sleep 1
done

echo ">>> 等待 VDI 应用启动..."
sleep 10

echo ">>> 启动自动化脚本..."
cd "$(dirname "$0")"
python3 vdi_automation.py
