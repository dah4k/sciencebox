#!/bin/sh
# Copyright 2025 dah4k
# SPDX-License-Identifier: EPL-2.0

asciinema_buildreq="
    rustup
"

sudo zypper --quiet --non-interactive refresh
sudo zypper --quiet --non-interactive install --no-recommends ${asciinema_buildreq}
rustup toolchain install stable

if [ ! -d asciinema ]; then
    git clone https://github.com/asciinema/asciinema
fi
cd asciinema
git checkout v3.0.0-rc.3

cargo build --release

