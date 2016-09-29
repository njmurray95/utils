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
    export PS1="\h-# "
else
    export PS1="\h-$ "
fi

# Echo all non-zero exit codes to caller
EXIT_STATUS="l=\$?; if [[ \$l -ne 0 ]]; then echo \$l; fi;"
WINDOW_NAME='echo -ne "\033]0;`uname -n`:"$PWD" $$\007";'
PROMPT_COMMAND="$EXIT_STATUS $WINDOW_NAME"

################################################################################
#  => Aliases (XXX)
################################################################################

alias vim=/usr/local/Cellar/vim/8.0.0002/bin/vim
alias python="ipython"

################################################################################
#  => Builtins (XXX)
################################################################################

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

# Use rmdir when needed
rm ()
{
    command rm -dv "$@"
}

################################################################################
#  => Startup (XXX)
################################################################################

# Login message
#which fortune >/dev/null && which cowsay >/dev/null && fortune | cowsay

echo "Sourced bashrc!"
