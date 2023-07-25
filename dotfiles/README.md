# .config

Runtime configurations, scripts, and notes on maintaining a consistent dev environment.

* Most files and folders are loaded automatically by their corresponding software by sitting in `~/.config`. Many others will do this once the environment variable `$XDG_CONFIG_HOME` is set to `$HOME/.config`.

* A few files (vimrc, bashrc, tmux.conf, screenrc, and inputrc) expect to live in the home directory. These files should be system linked with `ln $file $HOME/`.

* The `windows`, `osx`, and `linux` folders do not contain config files as such, but notes on system config that vary by system. Some settings unfortunately cannot be modified via CLI and notes are kept here instead.

## The easiest ways to get everything working on a new system

Everything should live under `$XDG_CONFIG_HOME`, which should be defined as `$HOME/.config`. Bash refuses to adopt, so the workaround is to modify `/etc/bash.bashrc`:

`/etc/bash.bashrc/` (Under everything else)
```
### USER MODIFIED
export XDG_CONFIG_HOME="$HOME/.config"
source "$XDG_CONFIG_HOME/bash/bashrc"
```

`~/.config/bash/bashrc` should then contain all local redefinitions and aliases. (I.e., `vim` -> `nvim`, `readline`, etc.)

### Readline

If readline doesn't read from `$XDG_CONFIG_HOME` by default, it should always read from `INPUTRC`:

`bashrc`
```
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
```

### neovim

Neovim is robust and should work with `$XDG_CONFIG_HOME` by default.

For plugins, install: `https://github.com/junegunn/vim-plug`

Then open a vim session and execute:
```
:PlugInstall<cr>
```




