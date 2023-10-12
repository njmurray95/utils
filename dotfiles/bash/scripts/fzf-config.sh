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
        ls)           fzf --preview 'tree -f -C {} | head -200'   "$@" ;;
        cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        docker-login) fzf --preview-window='+{1}' --preview "docker inspect {} | jq '.[].State'" "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}

git-select()
{
    # Check for unstaged and error *before* we go to the trouble of switching
    unstaged=`git diff-index HEAD --`
    if [[ "$unstaged" ]]; then
         echo "Cannot switch branches: checkout would overwrite the following files:"
         echo "$unstaged" | awk '{print "\t"$NF}'
         return 1
    fi
    # Select a new branch using fzf
    branch=$(git for-each-ref --format='%1B[0;35m%(refname:short)' |
        fzf --ansi --reverse --preview 'git log --color=always {}' |
        # Filter out 'origin' if it's a remote branch. This will force checkout to cooperate
        sed 's:origin/::g'
    )
    # Checkout if local, or checkout + create if remote
    [[ -n "$branch" ]] && git checkout "$branch"
}

# Prompt `docker-login` alias with list of all active running docker-images
_fzf_complete_docker-login()
{
    _fzf_complete --reverse -- "$@" 2>&1 < <(
        docker ps | awk 'NR > 1 {print $NF}'
    )
}
complete -F _fzf_complete_docker-login -o default -o bashdefault docker-login

# _fzf_complete_git-check()
# {
#     _fzf_complete --multi --reverse -- "$@" < <(
#         git branch --format "%(refname)"
#     )
# }
# # complete -F _fzf_complete_git-check -o default -o bashdefault git-check

# Keybinding to search bookmarks

# Open an interactive file-finder filtering search-results from ag
ff()
{
    [[ -n "$1" ]] && builtin cd $1 # Go to folder or noop
    AG_DEFAULT_COMMAND="ag --ignore-case --files-with-matches --hidden --path-to-ignore $HOME/.config/git/gitignore"
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
        --preview "ag -i --silent --color --context=3 {q} {} || echo 'Enter a search term.'"))
    if [[ -n "$selected" ]]; then
        if [[ "${#selected[@]}" == 1 ]]; then
            "$VISUAL" ${selected[0]}
        else
            "$VISUAL" ${selected[@]:1} -- -c "/${selected[0]}"
        fi
    fi
    [[ -n "$1" ]] && builtin cd - || return 0 # Return if we changed dirs
}


