# Neovim

>  Neovim is a refactor, and sometimes redactor, in the tradition of Vim (which itself derives from Stevie). It is not a rewrite but a continuation and extension of Vim. Many clones and derivatives exist, some very clever—but none are Vim. Neovim is built for users who want the good parts of Vim, and more.
> 
> -- https://neovim.io/charter/

A vim rewrite with new or different features. Many have since been backported into vim, but the deprecation of vimscript in favor of Lua is worth the hassle of maintaining two sets of dotfiles between neovim and vim.

Documentation: https://neovim.io/doc/user/index.html
(Also try: `:help` and `:help starting`)

## Install

Linux:
```
[apt install] nvim
[apt install] nvim-qt
```

These aliases in bashrc are useful:
```
alias vim="nvim-qt"
alias nvim="nvim-qt"
```

## General 

The config file `init.vim` should live:

```
                  *$XDG_CONFIG_HOME*            Nvim: stdpath("config")
    Unix:         ~/.config                   ~/.config/nvim
    Windows:      ~/AppData/Local             ~/AppData/Local/nvim
```
