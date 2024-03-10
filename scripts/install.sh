#!/bin/sh
# kpkg-user installation script
#

set -e

[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"

NC='\033[0m'

err() {
    RED='\033[0;31m'
    echo -e "kpkg-user: ${RED}error${NC}: $@"
    exit 1
}

info() {
    echo "$@"
}

check() {
    command -v bwrap >/dev/null || err "bubblewrap isn't installed on the host system, please install it before continuing"
    command -v wget >/dev/null || err "wget isn't installed on the host system, please install it before continuing"
}

installScript() {
    cp "$1" "$XDG_DATA_HOME"/kpkg/bin/"$2"
    chmod +x "$XDG_DATA_HOME"/kpkg/bin/"$2"
}

main() {
    [ -d "$XDG_DATA_HOME"/kpkg/rootfs ] && err "directories already exist, please run kpkg-uninstall first"

    info "creating initial directories"
    
    mkdir -p "$XDG_DATA_HOME"/kpkg/rootfs
    mkdir -p "$XDG_DATA_HOME"/kpkg/bin
    
    info "downloading sandbox rootfs"
    wget https://nightly.link/kreatolinux/src/workflows/build-rootfs/master/builder-rootfs.zip -O "$XDG_DATA_HOME"/kpkg/rootfs.tar.xz # TODO: add the option to choose between builder and nocc
    
    info "download success, extracting"
    tar -hxf "$XDG_DATA_HOME"/kpkg/rootfs.tar.xz -C rootfs
    
    installScript scripts/uninstall.sh kpkg-uninstall
    installScript scripts/kpkg.sh kpkg

    rm -f "$XDG_DATA_HOME"/kpkg/rootfs.tar.xz

    info "All done!"
    info "Please add this to your .shellrc:\n"
    info 'export PATH=$PATH:'$XDG_DATA_HOME/kpkg/bin
}

check
main

