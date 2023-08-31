# Dotfiles

Runtime configurations, scripts, and notes on maintaining a consistent dev environment.

* Most files and folders are loaded automatically by their corresponding software by sitting in `~/.config`. Many others will do this once the environment variable `$XDG_CONFIG_HOME` is set to `$HOME/.config`.

The arch wiki maintains an extensive list of which programs are behaving-well and reading from `$XDG_CONFIG_HOME`:


https://wiki.archlinux.org/title/XDG_Base_Directory


Notably, `bash` and `ssh` will not read from `$XDG_CONFIG_HOME` and require work-arounds.

Lots of miscellaneous tools take minor config but these are the most important:

* bash
* neovim (`nvim` and `nvim-qt`)
* readline
* tmux

