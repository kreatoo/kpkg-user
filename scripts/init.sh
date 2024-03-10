#!/bin/sh
# kpkg-user online install script
#

err() {
    echo "please install git to continue"
    exit 1
}

command -v git >/dev/null || err

git clone https://github.com/kreatoo/kpkg-user /tmp/kpkg-user
cd /tmp/kpkg-user
sh scripts/install.sh
