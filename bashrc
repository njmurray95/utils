################################################################################
#   _                 _
#  | |__   __ _  ___ | |__
#  |  _ \ / _` |/ __||  _ \
#  | |_| | |_| |\__ \| | | |
#  |_^__/ \__^_||___/|_| |_|

#   Table of Contents
#    | General
#    | History
#    | Prompt
#    | Builtins
#    | Startup

#    Plugins
#       N/A
#

################################################################################
#  => General (XXX)
################################################################################

# Clean in case being sourced again
unalias -a

# Clear <C-w> from deleting to last space
# <C-w> later redefined with backward-kill-word in ~/.inputrc
# stty werase undef

# Set configuration file home
export XDG_CONFIG_HOME="~/.config"

# Use vim as system editor
export VISUAL="vim"
export EDITOR="$VISUAL"
export PATH="$PATH:~/bin/"

################################################################################
#  => History (XXX)
################################################################################

# Ignore commands begun with spaces and duplicates
export HISTCONTROL="ignorespace:ignoredups"

# Format history as: Month/date - xx:xx:xx
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "

################################################################################
#  => Prompt (XXX)
################################################################################

# Change terminal prompt
if [ "$EUID" -eq 0 ]; then
    export PS1="# "
else
    export PS1="$ "
fi

# Echo all non-zero exit codes to caller
EXIT_STATUS="l=\$?; if [[ \$l -ne 0 ]]; then echo \$l; fi;"
WINDOW_NAME='echo -ne "\033]0;`uname -n`:"$PWD" $$\007";'
PROMPT_COMMAND="$EXIT_STATUS"

################################################################################
#  => Aliases (XXX)
################################################################################

# Better python terminals fast
alias py="ipython"
alias py2="ipython2"
alias py3="ipython3"

# Found at https://gitlab.com/gnachman/iterm2/issues/3898
alias imgcat=~/lib/hack_imgcat.sh

################################################################################
#  => Builtins (XXX)
################################################################################

# Aliases
alias info="info --vi-keys"

# cd lists directory names
cd ()
{
    builtin cd "$@"
    (($?)) || echo "$OLDPWD --> $PWD"
}

ls ()
{
    command ls -F "$@"
}

# Build help pages into man
man ()
{
    case "`type -tf $1 2>/dev/null`" in
        builtin)      help "$1" | less            ;;
        function)     command -p man "$@"         ;;
        *)            command -p man "$@"         ;;
    esac
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

# Use rmdir when needed
rm ()
{
    command rm -dv "$@"
}

wiki ()
{
    lynx -dump https://en.wikipedia.org/wiki/"$1" | less
}

################################################################################
#  => Appearance (XXX)
###############################################################################

# Escape codes for iterm2 to fade title bar
#echo -e "\033]6;1;bg;red;brightness;0\a"
#echo -e "\033]6;1;bg;green;brightness;0\a"
#echo -e "\033]6;1;bg;blue;brightness;0\a"

################################################################################
#  => Startup (XXX)
################################################################################

# Login message
#which fortune >/dev/null && which cowsay >/dev/null && fortune | cowsay
