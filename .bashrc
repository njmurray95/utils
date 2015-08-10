#
# ~/.bashrc
#

# If not running interactively, return
[[ $- != *i* ]] && return

# -i asks before deleting and -v tattles after
alias rm='rm -vi'

# -F displays filetypes
alias ls='ls -F'

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

# cd lists directory names
cd ()
{
    builtin cd "$@"
    (($?)) || echo "$OLDPWD --> $PWD"
}

# Login message
#FIXME broken on systems without fortune and cowsay
[ -z "$SSH_CLIENT" ] && fortune | cowsay
