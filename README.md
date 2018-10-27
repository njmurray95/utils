# .config

Runtime configurations, scripts, and notes on maintaining a consistent dev environment.

* Most files and folders are loaded automatically by their corresponding software by sitting in `~/.config`. Many others will do this once the environment variable `$XDG_CONFIG_HOME` is set to `$HOME/.config`.

* A few files (vimrc, bashrc, tmux.conf, screenrc, and inputrc) expect to live in the home directory. These files should be system linked with `ln $file $HOME/`.

* The `windows`, `osx`, and `linux` folders do not contain config files as such, but notes on system config that vary by system. Some settings unfortunately cannot be modified via CLI and notes are kept here instead.
