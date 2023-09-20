#!/usr/bin/env bash

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

# Wrapper for fzf, "find files"
ff()
{
    [[ -n "$1" ]] && builtin cd $1 # Go to folder or noop
    AG_DEFAULT_COMMAND="ag --ignore-case --files-with-matches --hidden"
    IFS=$'\n'
    selected=($(
        fzf \
        -m \
        -e \
        --ansi \
        --disabled \
        --reverse \
        --print-query \
        --bind "change:reload:$AG_DEFAULT_COMMAND {q} || true" \
        --preview "ag -i --color --context=2 {q} {}"))
    # TODO: this fails if no search is loaded into fzf
    [[ -n "$selected" ]] && "$VISUAL" ${selected[1]:-${selected[0]}} -- -c "/${selected[1]:+${selected[0]}}"
    # echo "$VISUAL" ${selected[1]:-${selected[0]}} -- -c "/${selected[1]:+${selected[0]}}"

    [[ -n "$1" ]] && builtin cd - || return 0 # Return if we changed dirs
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

# Echo cmd before execution
verbose() { echo "$*"; "$@"; }

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

