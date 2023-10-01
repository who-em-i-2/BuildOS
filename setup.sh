#!/bin/bash

df -h && free -h

cd /tmp

# pkg
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt update && apt install -y wget pigz gh jq aria2 lld git-lfs

# Clone kernel
git clone --depth=1 https://github.com/ImSpiDy/kernel_xiaomi_lavender-4.19 kernel
cd kernel

export CCACHE_DIR=/tmp/ccache
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
ccache -M 15G
ccache -o compression=true
ccache -z

# Build
bash build.sh

cd /tmp

tar --use-compress-program="pigz -k -0 " -cf ccache.tar.gz ccache

df -h
free -h
