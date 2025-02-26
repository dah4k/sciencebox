#!/bin/sh
# Copyright 2025 dah4k
# SPDX-License-Identifier: EPL-2.0

capa_buildreq="
    git
    python311
    python311-pip
"

sudo zypper --quiet --non-interactive refresh
sudo zypper --quiet --non-interactive install --no-recommends ${capa_buildreq}

if [ -d capa ]; then
    cd capa
else
    git clone https://github.com/mandiant/capa
    cd capa
    git submodule update --init rules
fi

python3.11 -m venv capa-venv
. capa-venv/bin/activate
pip3 install -r requirements.txt
pip3 install pyinstaller
pip3 install -e .[build]
pyinstaller .github/pyinstaller/pyinstaller.spec

