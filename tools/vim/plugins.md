# Plugins

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
