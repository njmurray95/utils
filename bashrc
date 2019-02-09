################################################################################
#   _                 _
#  | |__   __ _  ___ | |__
#  |  _ \ / _` |/ __||  _ \
#  | |_| | |_| |\__ \| | | |
#  |_^__/ \__^_||___/|_| |_|

################################################################################
#  => General (XXX)

unalias -a                                  # Clean in case being sourced again

source "$HOME/files/prog/bash/utils.sh"
source "$HOME/files/prog/bash/tools.sh"

export XDG_CONFIG_HOME="~/.config"          # Set configuration file home
export VISUAL="vim"                         # Use vim as system editor
export EDITOR="$VISUAL"                     # Some programs use this too
export PATH="$PATH:~/bin/"                  # Local binaries

################################################################################
#  => History (XXX)

# Ignore commands begun with spaces and duplicates
export HISTCONTROL="ignorespace:ignoredups"

# Format history as: Month/date - xx:xx:xx
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "

################################################################################
#  => Prompt (XXX)

# Change terminal prompt
if [ "$EUID" -eq 0 ]; then
    export PS1="# "
else
    export PS1="$ "
fi

# Echo all non-zero exit codes to caller
EXIT_STATUS="l=\$?; if [[ \$l -ne 0 ]]; then echo \$l; fi;"
PROMPT_COMMAND="$EXIT_STATUS"

################################################################################
#  => Aliases (XXX)

alias py="ipython"
alias py2="ipython2"
alias py3="ipython3"

alias info="info --vi-keys"
alias ls="ls -F"                # Show line endings
alias rm="rm -dv"               # -d for directories, -v vesbore

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

