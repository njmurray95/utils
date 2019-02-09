#!/usr/bin/env bash

# Utilities  for Bash

# True when the user is root
isRoot() {
    [ "$EUID" -eq 0 ]
}

# True in terminal false in script
isInteractive() {
    [[ "$-" == *i* ]]
}

# Debug: Three-Fingered Claw. See here:
# https://stackoverflow.com/questions/1378274/#25515370
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# True when executable in path false otherwise
exists() {
    which "$1" >/dev/null 2>&1
}

require() {
    exists "$1" || die "No $1 in path."
}
