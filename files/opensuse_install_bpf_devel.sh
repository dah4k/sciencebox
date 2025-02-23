#!/bin/sh
# Copyright 2025 dah4k
# SPDX-License-Identifier: Apache-2.0

# https://docs.cilium.io/en/latest/reference-guides/bpf/toolchain/#development-environment
bpf_devel="
    bc
    bison
    clang
    flex
    gcc
    git
    glibc-devel-static
    graphviz
    libcap-devel
    libelf-devel
    libopenssl-devel
    llvm
    ncurses-devel
"

sudo zypper --quiet --non-interactive refresh
sudo zypper --quiet --non-interactive install --no-recommends ${bpf_devel}
