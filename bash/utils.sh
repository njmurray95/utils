#!/usr/bin/env bash

# Utilities  for Bash

# True when the user is root
is_root() {
    [ "$EUID" -eq 0 ]
}

# True in terminal false in script
is_interactive() {
    [[ "$-" == *i* ]]
}

# Debug
yell() { echo "$0: $*" >&2; }
die() { yell "$*"; exit 111; }
try() { "$@" || die "cannot $*"; }

# Assert
# Evaluates all arguments as $@
# Silent on success, loud on fail
assert() {
    FAIL_CMD=$(is_interactive && echo "return" || echo "exit")
    [ -z "$1" ] && echo "$ASSERT_MSG No command given." && $FAIL_CMD 1
    $@ 2>/dev/null 1>&2
    EXIT_STAT=$?
    if [ $EXIT_STAT -ne 0 ]; then
        yell "assertion failed: $*`1" && $FAIL_CMD $EXIT_STAT
    fi
}