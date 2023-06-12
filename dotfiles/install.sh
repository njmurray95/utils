#!/usr/bin/env bash

# ~/.config/install.sh
# Set up config files throughout a new system

CONFIGDIR=$(pwd)

SYSTEM=$(uname -s)

VIMRC="vimrc"
VIMDIR="~/.vim"
VIMSUBDIRS="backup colors pack/start pack/opt swap undoo"

# Vim setup
mkdir -p "$VIMDIR"
for dir in $VIMSUBDIRS; do
    mkdir -p "$VIMDIR/$dir"
done
touch "$VIMDIR/install"
ln $CONFIGDIR/$VIMRC $VIMDIR/$VIMRC
