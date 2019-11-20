#!/usr/bin/env bash
set -o errexit

# Reqs:
# * utils
# * ctags

CODE_HOME="$HOME/code"

RUN_ON_ALL=0

source "$CODE_HOME/scripts/utils.sh"
require "ctags"

[[ ! -d "$CODE_HOME" ]] && die "$CODE_HOME does not exist."

while getopts ":ad:" opt; do
    case "$opt" in
        a) RUN_ON_ALL=1 ;;
        d) REPO="$OPTARG" ;;
    esac
done

if [[ "$RUN_ON_ALL" -eq 0 && -z "$REPO" ]]; then
    die "Must run with '-a' or '-d <reponame>'"
fi;

tagdir()
{
    repo="$1"
    [[ ! -d "$repo" ]] && die "Repo '${repo}' does not exist."
    echo "Building tags file for '${repo}' ..."
    cd $repo
    ctags -R -f ./tags .  >/dev/null 2>&1
    cd $OLDPWD
}

if [[ "$RUN_ON_ALL" -eq 1 ]]; then
    # Run ctags on every repo: */ matches folders only
    for repo in "$CODE_HOME/*/"; do
        tagdir "$repo"
    done
    echo "Finished tagging all repositories."
else
    # Run ctags on the given repo
    tagdir "$REPO"
fi;
