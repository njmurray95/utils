#
# ~/.bashrc
#

# If not running interactively, return
[[ $- != *i* ]] && return

# Clean in case being sourced again
unalias -a

# -i asks before deleting and -v tattles after
alias rm='rm -div'
alias ping='ping -c 3'
alias vim='nvim'

# Change terminal prompt
if [ "$EUID" -eq 0 ]; then
    export PS1="# "
else
    export PS1="$ "
fi

# Use vim as system editor
export EDITOR="vim"

# Echo all non-zero exit codes to caller
EXIT_STATUS="e=\$?; [ \$e -ne 0 ] && echo \$e;"
WINDOW_NAME='echo -ne "\033]0;`uname -n`:"$PWD"\007";'
PROMPT_COMMAND="$EXIT_COMMAND $WINDOW_NAME"

#__vte_prompt_command() {
#  local pwd='~'
#  [ "$PWD" != "$HOME" ] && pwd=${PWD/#$HOME\//\~\/}
#  printf "\033]0;%s@%s:%s\007%s" "${USER}" "${HOSTNAME%%.*}" "${pwd}" "$(__vte_osc7)"
#}

# Remember 10k commands
export HISTSIZE=10000
export HISTFILESIZE=10000

# Ignore commands begun with spaces and duplicates
export HISTCONTROL="ignorespace:ignoredups"

# Format history as: Month/date - xx:xx:xx
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "

ls ()
{
    command ls -F "$@"
}

# Background GUI-based jobs
BG_IN_LINUX=" gedit emacs"
BG_IN_UNIX=""
BACKGROUND_COMMANDS="$BG_IN_LINUX"

for com in $BACKGROUND_COMMANDS; do
    alias $com="$com &"
done

# Login message
#FIXME broken on systems without fortune and cowsay
[ -z "$SSH_CLIENT" ] && fortune | cowsay

#EOF
