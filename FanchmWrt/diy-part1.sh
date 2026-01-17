#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git gecoosac https://github.com/lwb1978/openwrt-gecoosac.git' >>feeds.conf.default
echo 'src-git ddnsgo  https://github.com/sirpdboy/luci-app-ddns-go' >>feeds.conf.default
echo 'src-git watchdog https://github.com/sirpdboy/luci-app-watchdog' >>feeds.conf.default
echo 'src-git lucky https://github.com/gdy666/luci-app-lucky.git' >>feeds.conf.default
git clone https://github.com/timsaya/openwrt-bandix.git package/openwrt-bandix
git clone https://github.com/timsaya/luci-app-bandix.git package/luci-app-bandix
git clone https://github.com/kiddin9/luci-app-timedreboot.git package/luci-app-timedreboot
# echo 'src-git kwrtpackages https://github.com/kiddin9/kwrt-packages.git' >>feeds.conf.default
