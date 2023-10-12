#!/bin/env bash

# Notification when something is done
beep()
{
    msg=${1:-"Task done."}
    spd-say "Done" && zenity --info --text "${msg}: $(date)" &
}

# Repeat something forever
always()
{
    # [[ -z "$1" ]] && return "Must specify command"
    while true
    do
        echo ">>> $@"
        eval "$@"
        sleep 1
    done
}

# cd lists directory names
cd ()
{
    builtin cd "$@"
    (($?)) || echo "$OLDPWD --> $PWD"
}

# Add help pages to man
man ()
{
    case "`type -tf $1 2>/dev/null`" in
        builtin)      help "$1" | less            ;;
        function)     command -p man "$@"         ;;
        *)            command -p man "$@"         ;;
    esac
}

# Save typing the column syntax all the time
# i.e., `echo "hello world" | fawk 2` -> `world`
fawk()
{
    awk "{print \$$1}";
}

# Run ctags to generate output for vim
gen-tags()
{
    [[ -z "$1" ]] && echo "usage: gen-tags <repo>" && return 1
    repo="$1"
    [[ ! -d "${repo}" ]] && echo "Repo '${repo}' does not exist." && return 1
    echo "Building tags file for '${repo}' ..."
    ctags -R -f "${repo}/tags" "${repo}" >/dev/null 2>&1
}
