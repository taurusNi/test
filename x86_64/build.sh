#!/bin/bash

[ -x ./setup.sh ] && ./setup.sh

# mkdir package
# pushd package || exit 1
# git clone --depth 1 --branch master https://github.com/jerrykuku/luci-theme-argon.git
# git clone --depth 1 --branch master https://github.com/jerrykuku/luci-app-argon-config.git
# popd || exit 1

# ls -Rl

# Packages: dnsmasq-full luci ca-bundle curl yq ip-full kmod-tun kmod-inet-diag kmod-nft-tproxy luci-i18n-base-zh-cn luci-i18n-firewall-zh-cn luci-i18n-package-manager-zh-cn adguardhome luci-theme-argon luci-app-argon-config base-files ca-bundle dropbear e2fsprogs firewall4 fstools grub2-bios-setup kernel kmod-amazon-ena kmod-amd-xgbe kmod-bnx2 kmod-button-hotplug kmod-drm-i915 kmod-dwmac-intel kmod-e1000 kmod-e1000e kmod-forcedeth kmod-fs-vfat kmod-igb kmod-igc kmod-ixgbe kmod-nft-offload kmod-r8169 kmod-tg3 libc libgcc libustream-mbedtls logd mkf2fs mtd netifd nftables odhcp6c odhcpd-ipv6only opkg partx-utils ppp ppp-mod-pppoe procd-ujail uci uclient-fetch urandom-seed urngd

# echo "src-git argon https://github.com/jerrykuku/luci-theme-argon.git" >> repositories.conf
# echo "src-git argonConfig https://github.com/jerrykuku/luci-app-argon-config.git" >> repositories.conf

pushd packages || exit 1
wget --no-check-certificate https://github.com/jerrykuku/luci-theme-argon/releases/download/v2.3.1/luci-theme-argon_2.3.1_all.ipk
wget --no-check-certificate https://github.com/xiaorouji/openwrt-passwall2/releases/download/25.1.27-1/luci-23.05_luci-app-passwall2_25.1.27_all.ipk
wget --no-check-certificate https://github.com/xiaorouji/openwrt-passwall2/releases/download/25.1.27-1/luci-23.05_luci-i18n-passwall2-zh-cn_git-25.027.36329-c2b5fb7_all.ipk
popd || exit 1

PACKAGES=""
PACKAGES="$PACKAGES -dnsmasq"
PACKAGES="$PACKAGES dnsmasq-full"
PACKAGES="$PACKAGES luci"
PACKAGES="$PACKAGES ca-bundle"
PACKAGES="$PACKAGES curl"
PACKAGES="$PACKAGES yq"
PACKAGES="$PACKAGES ip-full"
PACKAGES="$PACKAGES kmod-tun"
PACKAGES="$PACKAGES kmod-inet-diag"
PACKAGES="$PACKAGES kmod-nft-tproxy"
PACKAGES="$PACKAGES luci-i18n-base-zh-cn"
PACKAGES="$PACKAGES luci-i18n-firewall-zh-cn"
PACKAGES="$PACKAGES luci-i18n-package-manager-zh-cn"
PACKAGES="$PACKAGES adguardhome"
PACKAGES="$PACKAGES -luci-theme-bootstrap"
PACKAGES="$PACKAGES luci-theme-argon"
PACKAGES="$PACKAGES luci-app-passwall2 luci-i18n-passwall2-zh-cn"

make image PACKAGES="$PACKAGES" ROOTFS_PARTSIZE=950 CONFIG_VMDK_IMAGES=y CONFIG_GRUB_IMAGES=y