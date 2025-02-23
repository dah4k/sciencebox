#!/bin/sh
# Copyright 2025 dah4k
# SPDX-License-Identifier: MIT-0

devtools="
    binutils
    bpftool
    capstone
    cmake
    ctags
    curl
    dust
    fd
    file
    gcc
    gcc-c++
    gdb
    git
    jq
    libbpf-devel
    libcapstone-devel
    libcapstone4
    libopenssl-devel
    lz4
    make
    man
    man-pages
    man-pages-posix
    patch
    plocate
    ripgrep
    sqlite3
    tmux
    tokei
    valgrind
    vim
    vim-data
    w3m
    xz
    zip
    zstd
"

sudo zypper --quiet --non-interactive refresh
sudo zypper --quiet --non-interactive install --no-recommends ${devtools}
