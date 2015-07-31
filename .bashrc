# -i asks before deleting and -v tattles after
alias rm='rm -vi'

# Aliases for convenience
alias sd='sudo'
alias ls='ls -F'
alias lla='ls -la'
alias la='ls -a'
alias ll='ls -l'
alias lh='ls -lhart'

# Change terminal prompt
#PS1="[\u@\h-\W]$ "
if [ "$EUID" -eq 0 ]; then
    export PS1="# "
else
    export PS1="$ "
fi

# Use vim as system editor
export EDITOR="vim"

# Echo all non-zero exit codes to caller
EXIT_STATUS="l=\$?; if [[ \$l -ne 0 ]]; then echo \$l; fi;"
WINDOW_NAME='echo -ne "\033]0;`uname -n`:"$PWD" $$\007";'
PROMPT_COMMAND="$EXIT_STATUS $WINDOW_NAME"

# Ignore commands begun with spaces and duplicates
export HISTCONTROL="ignorespace:ignoredups"

# History can only be appended to


# Format history as: Month/date - xx:xx:xx
export HISTTIMEFORMAT="%h/%d - %H:%M:%S"

# <C-s> doesn't get remapped to stop
#if stty -a | grep -q ixon; then
    #stty -ixon
#fi

# cd lists directory names
cd ()
{
    builtin cd "$@"
    (($?)) || echo "$OLDPWD --> $PWD"
}

function tabname
{
    printf "\e]1;$1\a"
}


function winname
{
    printf "\e]2;$1\a"
}
# Login message
#FIXME broken on systems without fortune and cowsay
[ -z "$SSH_CLIENT" ] && fortune | cowsay

