# ctags

Tags all names in a codebase so vim has an index to jump to for reading code.

## Installation

There are different implementations, we usually want `exuberant-ctags`:

```
apt-get install exuberant-ctags
```

### Use

Put all tags under the current directory into a vim-compatible file named "tags":

```
ctags -R -f ./tags
```
