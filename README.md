> [!WARNING]  
> This project is seperate from Kreato Linux project (for now) and will be unstable. Continue at your own risk.

# kpkg-user
This repository contains scripts and tools that allow installation of Kreato Linux packages across multiple Linux distributions.

# How
We achieve this by having a Kreato Linux sandbox that we run everything from.
This way, it can be run anywhere that has Bubblewrap and basic tools.

The Kreato Linux sandbox resides in `$XDG_DATA_HOME/kpkg/rootfs`, and all the binaries on the rootfs are wrapped and sent to `$XDG_DATA_HOME/kpkg/bin`.

# Dependencies
* A working Linux distro installation
* Bubblewrap
* An active internet connection
* 400MB-1GB of space 

The installation script will check if dependencies are available before attempting installation.
The space required will change depending on if you want to build packages or not.

# Installation
You can install by running;

`curl https://raw.githubusercontent.com/kreatoo/kpkg-user/main/scripts/init.sh -sSf | sh`


# Why
To allow more choice.
