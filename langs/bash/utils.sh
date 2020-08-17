#!/usr/bin/env bash

# Permission utilities

isRoot()
{
    [ "$EUID" -eq 0 ]
}

isInteractive()
{
    # True in terminal false in script
    [[ "$-" == *i* ]]
}

onWindows()
{
    [[ `uname -s` == "MINGW"* ]] ||
    [[ `uname -s` == "CYGWIN"* ]]
}

onLinux()
{
    [[ `uname -s` == "Linux"* ]]
}

onMac()
{
    [[ `uname -s` == "Darwin"* ]]
}

# Print Utilities

# Three-Fingered Claw. See https://stackoverflow.com/questions/1378274/#25515370
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

exists()
{
    # True when executable in path false otherwise
    which "$1" >/dev/null 2>&1
}

require()
{
    # Throw if named executable not in path
    exists "$1" || die "No $1 in path."
}

bool()
{
    # "Casts" the output of a command's success status to true/false
    # i.e., `bool onWindows`, `bool onLinux`
    "$@" && echo "true" || echo "false"
}
