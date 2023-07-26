#!/usr/bin/env bash
# Wrapper script to run ctags 
set -o errexit

[[ -z "$1" ]] && echo "usage: ./gen_tags.sh <repo>" && exit 1

repo="$1"
[[ ! -d "${repo}" ]] && echo "Repo '${repo}' does not exist." && exit 1
echo "Building tags file for '${repo}' ..."
cd "${repo}"
ctags -R -f ./tags . >/dev/null 2>&1
cd $OLDPWD
