#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
#!/bin/bash

echo "优化 ddns-go 编译配置"
# 调整 Go 编译参数
cat >> .config << EOF
CONFIG_PACKAGE_ddns-go=y
EOF

# 优化 Go 编译选项
if grep -q "Go" feeds/ddnsgo/ddns-go/Makefile; then
  echo "找到 ddns-go 的 Makefile，进行优化"
  # 减少并行编译以节省内存
  sed -i '/^define Build\/Compile/i \
define Build/Compile \
\t$(call GoPackage/Compile) \
\tGOMAXPROCS=2 GOGC=50 $(GO_PKG_BUILD_VARS) \\
' feeds/ddnsgo/ddns-go/Makefile
fi

# 修改默认LAN口IP地址 Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate
# 关闭opkg源验证
#sed -i 's/option check_signature/#option check_signature/g' package/system/opkg/files/opkg.conf

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
