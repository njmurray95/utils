# tmux

Terminal-multiplexer. Useful when ssh'ed into another session for splitting panes and persisting sessions across restarts.

## Config

Tmux has a bad habit of breaking old config with new versions. Here are some magic lines.

Config happens in `tmux.conf`. Where tmux expects this file to live depends on the version:

* 3.2: `$XDG_CONFIG_HOME/tmux/tmux.conf`
* 3.1: `~/.config/tmux/tmux.conf`
* <3.1: `~/.tmux.conf`

Configuring the mouse:

2.1+
```
set -g mouse on
```

TODO: There are different formulas for different versions

Configuring vi-keybindings on copy-mode:


2.1+
```
Nothing. Works by default.
```

<2.1
```
bind-key -T vi-copy 'v' begin-selection
```

## Misc.

Magic two lines should restore tmux to default keybindings:

```
tmux -f /dev/null -L temp start-server \; list-keys > ~/.tmux.tmp.conf
tmux source ~/.tmux.tmp.conf
```
