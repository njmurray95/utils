# ctags

Tags all names in a codebase so vim has an index to jump to for reading code.

## Installation

There are different implementations, we usually want `exuberant-ctags`:

```
apt-get install exuberant-ctags
```


First install a version of ctags -- exuberant ctags is the best for now:
```
<brew/apt-get/pacman> install ctags
```
Run this in the root dir of a project:
```
ctags -R -f ./tags .  >/dev/null 2>&1
```


`vimrc` config (`neovim` should have beter defaults):
```
set tags=./tags;/
```

This will look in the current directory for the "tags" folder and recurse up toward root until one is found.

## Use

Default vim bindings:
* `Ctrl + ]` - go to definition
* `Ctrl + T` - jump back from definition (you've probably remapped this to `CTRL-[`)
* `g]` - jump to list of all possible definitions
* `Ctrl + W Ctrl + ]` - open definition in horizontal split
