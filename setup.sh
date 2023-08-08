#!/usr/bin/env bash

# Clone kernel
git clone --depth=1 https://github.com/projects-nexus/nexus_kernel_xiaomi_sm8250 -b lineage kernel

# Build
cd kernel
bash build.sh null alioth null

