# Plugins

## Natively

Vim 8 and above have automatic support for plugins -- no need to first configure a third-party plugin manager. The folders can get messy, but vim will generally look in `VIMFOLDER/pack/<PLUGIN>/start` to run a plugin. I.e., to install the TypeScript syntax plugin on a Linux system, this should suffice:

```
$ mkdir -p ~/.vim/pack/typescript/start
$ cd ~/.vim/pack/typescript/start
$ git clone https://github.com/leafgarland/typescript-vim.git
```

(Where vim on Windows will look under `~/vimfiles/pack` etc.)

A quick script to install wanted plugins might look like this:

```
#!/usr/bin/env bash

VIMHOME="<VIM CONFIG HOME>"

REPOS="<REPO ONE> <REPO TWO> [...]"

for repo in $REPOS; do
    dirname=`basename $repo`
    fulldir="${VIMHOME}/pack/${dirname}/start/${dirname}"
    mkdir -p "${fulldir}"
    git clone "${repo}" "${fulldir}"
done 
```

## Vim Plug

Vim Plug is the simplest vim plugin manager (and is sometimes simpler to set up than dealing with issues of Vim versioning or fussing with vim/neovim differences). 

Install instructions are here: https://github.com/junegunn/vim-plug

After downloading call `:PlugInstall`

### Syntax checkers:
* Typescript: https://github.com/leafgarland/typescript-vim

### Mappings
* Surround: https://github.com/tpope/vim-surround

### Visual
* Gitgutter: https://github.com/airblade/vim-gitgutter

## Misc
* vim-instant-markdown
* vim-pencil
* limelight
* Goyo
