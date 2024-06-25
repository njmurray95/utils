#!/bin/env bash

# Check if we have fzf
which fzf >/dev/null || return 0

# Note: this was necessary on ubuntu v.22.04 with bash v.5.1.16
# See: https://github.com/junegunn/fzf/issues/1843
# sed -i '337s/.*/eval \"complete \-F \\\"\$func\\" \$opts \$cmd\"/' /usr/share/bash-completion/completions/fzf

# Different on different systems apparently
# This is good for ubuntu v.22.04
# Sources the fzf default completion modules
source /usr/share/bash-completion/completions/fzf

# Automatically matches fzf commands to specific readline keybindings
# (Note: this will override settings in readline's `inputrc`
source /usr/share/doc/fzf/examples/key-bindings.bash

# export FZF_DEFAULT_OPTS=""

# fzf completions check this method for custom tiles (lower-right by default)
# fzf auto-generated some of these by default; custom commands need their own `_fzf_complete_` method
_fzf_comprun()
{
    local command=$1
    shift

    case "$command" in
        # ls)           fzf --preview 'tree -f -C {} | head -200'   "$@" ;;
        # cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        docker-login) fzf --preview-window='+{1}' --preview "docker inspect {} | jq '.[].State'" "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}

# Prompt `docker-login` alias with list of all active running docker-images
_fzf_complete_docker-login()
{
    _fzf_complete --reverse -- "$@" 2>&1 < <(
        docker ps | awk 'NR > 1 {print $NF}'
    )
}

complete -F _fzf_complete_docker-login -o default -o bashdefault docker-login

SHORTCUT_DIRS="/home/nmurray"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/home/nmurray/code/spotrgeo"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/home/nmurray/code/spotrflow"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/home/nmurray/code/spotredge"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/home/nmurray/.config/"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/home/nmurray/code/utils"
SHORTCUT_DIRS="$SHORTCUT_DIRS:/opt/AV/SpotrGeo"

source /usr/share/doc/fzf/examples/key-bindings.bash

# _fzf_complete_shortcut_cd()
# {
#     _fzf_complete --reverse -- "$@" 2>&1 < <(
#         local sdir=$(echo $SHORTCUT_DIRS | tr ':' '\n' | fzf)
#         if [[ -n "$sdir" ]]; then
#             cd "$sdir"
#         fi
#     )
# }

# complete -F _fzf_complete_shortcut_cd -o default -o bashdefault cd

# _fzf_complete_git-check()
# {
#     _fzf_complete --multi --reverse -- "$@" < <(
#         git branch --format "%(refname)"
#     )
# }
# # complete -F _fzf_complete_git-check -o default -o bashdefault git-check

# Keybinding to search bookmarks

# Open an interactive file-finder filtering search-results from ag
fa()
{
    [[ -n "$1" ]] && builtin cd $1 # Go to folder or noop
    FD_DEFAULT_COMMAND="fd --type f --hidden --ignore-file $HOME/.config/git/gitignore"
    IFS=$'\n'
    selected=($(
        fzf \
        -m \
        -e \
        --ansi \
        --disabled \
        --reverse \
        --print-query \
        --bind "change:reload:$FD_DEFAULT_COMMAND {q} || true" \
        --prompt='fd> ' \
        --preview "ag -i --silent --color --context=3 {q} {} || echo 'Enter a search term.'"))
    if [[ -n "$selected" ]]; then
        if [[ "${#selected[@]}" == 1 ]]; then
            "$EDITOR" ${selected[0]}
            # "$VISUAL" ${selected[0]}
        else
            "$EDITOR" ${selected[@]:1} -- -c "/${selected[0]}"
            # "$VISUAL" ${selected[@]:1} -- -c "/${selected[0]}"
        fi
    fi
    [[ -n "$1" ]] && builtin cd - || return 0 # Return if we changed dirs
}

# Open an interactive file-finder filtering search-results from ag
ff()
{
    [[ -n "$1" ]] && builtin cd $1 # Go to folder or noop
    AG_DEFAULT_COMMAND="ag --ignore-case --files-with-matches --hidden --path-to-ignore $HOME/.config/git/gitignore"
    FD_DEFAULT_COMMAND="fd --ignore-file $HOME/.config/git/gitignore"
    IFS=$'\n'
        # --bind "ctrl-d:reload:$FD_DEFAULT_COMMAND {q} || true" \
        # Play around with this to get fd as well
        # https://github.com/junegunn/fzf/wiki/Examples#dnf
    selected=($(
        fzf \
        -m \
        -e \
        --ansi \
        --disabled \
        --reverse \
        --print-query \
        --prompt="ag> " \
        --bind "change:reload:$AG_DEFAULT_COMMAND {q} || true" \
        --preview "ag -i --silent --color --context=3 {q} {} || echo 'Enter a search term.'"))
    if [[ -n "$selected" ]]; then
        if [[ "${#selected[@]}" == 1 ]]; then
            cmd="$EDITOR ${selected[0]}"
        else
            cmd="$EDITOR ${selected[@]:1} -c \"/${selected[0]}\""
        fi
        # Add this command to the history and make things easier
        echo "$cmd"
        eval "$cmd"
        history -s "$cmd"
    fi
    [[ -n "$1" ]] && builtin cd - || return 0 # Return if we changed dirs
}
