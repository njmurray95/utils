# Ctags

Use ctags to jump to function/var definitions instead of having to hunt/peck through the filesystem every time.

First install a version of ctags -- exuberant ctags is the best for now:

```
<brew/apt-get/pacman> install ctags
```

The magic setup command is to run this in the root dir of a project:

```
ctags -R -f ./tags .  >/dev/null 2>&1
```

(This will need to be re-run periodically as files get changed -- TODO, find a better system for managing this...)

If vim can't find the ctags file (neovim has sane defaults but older vim might not) set this in the vimrc:

```
set tags=./tags;/
```

This will look in the current directory for the "tags" folder and recurse up toward root until one is found.

Default vim bindings:

* `Ctrl + ]` - go to definition
* `Ctrl + T` - jump back from definition (you've probably remapped this to `CTRL-[`)
* `g]` - jump to list of all possible definitions
* `Ctrl + W Ctrl + ]` - open definition in horizontal split