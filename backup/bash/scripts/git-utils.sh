
which git >/dev/null || { echo "$0: Missing git"; return 1; }

# Checkout a branch using FZF to preview
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
    branch=$(
        git for-each-ref --format='%1B[0;35m%(refname:short)' |
        fzf --ansi --reverse --preview 'git log --color=always {}' |
        # Filter out 'origin' if it's a remote branch. This will force checkout to cooperate
        sed 's:origin/::g'
    )
    # Checkout if local, or checkout + create if remote
    if [[ -z "$branch" ]]; then
        return 0
    elif [[ -n "$branch" ]]; then
        git checkout "$branch"
    else
        echo "Branch '$branch' does not exist. Create it?"
        read -p "[y/n] " ans

        case $ans in
            [Yy]* )
                git checkout -b "$branch"
                ;;
            [Nn]* )
                return 0
                ;;
            *)
                return 1
                ;;
            esac
    fi
}


# Purge local branches merged into master on origin
git-rekt()
{
    candidates=($(
        git for-each-ref --merged master refs/heads/ --format='%1B[0;35m%(refname:short)%1B[00m' |
        grep -v "master"
    ))

    [[ -z "$candidates" ]] && { echo "No git branches to purge."; return 0; }

    echo "Delete all local copies of these branches?"
    printf '* %s\n' "${candidates[@]}"
    read -p "[y/n/q]: " ans

    case $ans in
        [Yy]*)
            :
            ;;
        [Nn]*)
            echo "Select which branches to delete."
            candidates=($(
                printf '%s\n' ${candidates[@]} |
                fzf --ansi --multi --reverse --preview 'git log --color=always {}'
                                ))
            ;;
        [Qq]*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
    echo "Deleting these branches:"
    printf '%s\n' "${candidates[@]}" | xargs -I {} git branch -d {}
}
