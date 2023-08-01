#!/usr/bin/env bash

# Clone kernel
git clone --depth=1 https://github.com/projects-nexus/nexus_kernel_xiaomi_sm8250 -b staging kernel

# Build
cd kernel
bash build.sh null alioth null
bash build.sh null munch null
bash build.sh null lmi null
bash build.sh null apollo null
