#!/bin/sh
# kpkg-user kpkg wrapper
#

set -e

[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"

err() {
    echo "couldn't find $1"
    exit 1
}

command -v bwrap >/dev/null || err "bwrap"

bwrap --bind "$XDG_DATA_HOME"/kpkg/rootfs / /bin/sh -c "kpkg $@"
