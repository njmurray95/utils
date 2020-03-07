# Vim

>  Vim is a highly configurable text editor for efficiently creating and changing any kind of text.

> -- Vim Homepage: https://www.vim.org/



## Installation

Very few machines don't have `vim`; very few machines have the latest `vim`. It is usually worthwhile to acquire version 8 or above. Among other features:

* Built-in plugin support
* Asynchronous I/O

On Linux and OSX, vim will automatically read `~/.vimrc` or `~/.vim/vimrc` for config.

Windows is a special case -- it generally comes with `vim` and `gvim`, `vim` with a GUI wrapper. Vim looks for config files in `~/.vimrc`, `~/.gvimrc`, `~/vimfiles/vimrc`, and `~/vimfiles/gvimrc`.

## Common Uses

### Find/Replace Tricks

Replace **word** within file:
```
:%s/word/new/g
```

Replace **word** within highlighted section:
```
:'<,'>s/word/new/g
```

Replace **word** within all active buffers (and auto-write):
```
:bufdo %s/word/new/ge | update
```

Appended Options:
* `g` -- "global" replace within selection (i.e. don't stop at first match)
* `i` -- case "insensitive" match
* `c` -- ask for "confirmation" before each replace
* `e` -- no "error" if pattern not found

## Misc.

List available filetypes:

```
:echo glob($VIMRUNTIME . '/ftplugin/*.vim')
:echo glob($VIMRUNTIME . '/syntax/*.vim')
```

Automatically change line endings (see `fileformat`, `ff`):
```
:set ff=dos
:set ff=unix
:set ff=mac
```

Do an in-buffer vim-diff:
```
:split
<open both files>
:diffthis
```
