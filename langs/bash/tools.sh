#!/bin/bash

# Calculator, works on args or stdin
# Reads from $@ if set, stdin otherwise
# Evaluates via $(())
calc() { echo "$((${@:-$(</dev/stdin)}))"; }

# Print something in a terminal's titlebar
# \033]0 is the opening escape code
# \007 closes
title() { echo -ne "\033]0$*\007"; }

# Print all 256 colors in foreground
# The magic escape code here is "\e[38;5;${color}m"
# \e[0m clears the color
colors_fg()
{
    for i in {1..256}; do echo -e "\e[38;5;${i}mcolor${i} \e[0m"; done
}

# Prints all 256 colors in background
# Here the escape code is "\e[48;5;${color}m"
colors_bg()
{
    for i in {1..256}; do echo -e "\e[48;5;${i}m color${i} \e[0m"; done
}

# Lint files in different formats
lint()
{
    [ -z "$1" ] && echo "usage: lint <file>" && return 1
    filetype="${1##*.}"
    case $filetype in
        cpp)        g++ -std=c++11 -fsyntax-only "$1"           ;;
        py)         python -m py_compile "$1"                   ;;
        json)       jsonlint "$1"                               ;;
        sh)         bash -n "$1"                                ;;
        *)          echo "No linter set for filetype $filetype" ;;
    esac
}

wiki ()
{
    lynx -dump https://en.wikipedia.org/wiki/"$1" | less
}
