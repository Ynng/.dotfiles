#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
    HOMEDIR=$HOME
else
    echo "Don't run this as root!"
    exit 1
fi
# Absolute path of this script
CURRENTDIR=$(dirname "$(readlink -f "$0")")

# backs up a file with time stamp
backup() {
    if [ -f $1 ]; then
        echo "$1 already exists, backing up..."
        mv $1 $1.bak.$(date +%s)
    fi
}

# symlinks a file and backs up the original
symlink_and_backup() {
    backup $1
    ln -s $2 $1
    echo "Symlinked $1 to $2"
}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_name>"
else
    symlink_and_backup "$HOMEDIR/$1" "$CURRENTDIR/$1"
fi
