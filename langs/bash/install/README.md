# Installation

Everything related to installing and configuring bash the way we want it.

Bash doesn't respect `$XDG_CONFIG_HOME` and has no plans to, which means using the following workaround:

```
$ mkdir -p ~/.config/bash/
$ sudo vim /etc/bash.bashrc
```

In `/etc/bash.bashrc` append the following lines:

```
### USER MODIFIED
export XDG_CONFIG_HOME="$HOME/.config"
[[ -f "$XDG_CONFIG_HOME/bash/bashrc" ]] && source "$XDG_CONFIG_HOME/bash/bashrc"
```
