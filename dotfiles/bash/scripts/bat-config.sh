#!/bin/env bash

# Check if we have bat
which bat >/dev/null || echo 0

bat ()
{
    command bat --theme "Solarized (dark)" "$@"
}
# alias bat="bat --theme \"Solarized (dark)\""

# Use bat for manpages
# See: https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat --theme \"Solarized (dark)\" -l man -p'"
