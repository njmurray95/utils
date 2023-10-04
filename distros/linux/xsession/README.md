# Linux Xorg setup

By default, every time an `X` session is created (i.e., after system boot), `/etc/X11/Xsession` is sourced. This file itself sources other config files for the `X` session. (By default, on a 2023 system running Ubuntu 22.04, `X` sources everything in `/etc/X11/Xsession.d/`)

Per [the Debian Wiki](https://wiki.debian.org/Xsession), `X` will then attempt to source the following user files:

1. `~/.xsessionrc`
2. A specific session selected in the DM
3. `~/.xsession` or `~/.Xsession`

Since none of these are compliant with `$XDG_CONFIG_HOME`, we instead do this, to make `Xsession` source everything in `$HOME/.config` (can't guarantee that `$XDG_CONFIG_HOME` is sourced yet):

```
$ sudo sed -i 's/\(SESSIONFILES=$([^)]*\)\()\)/\1 \&\& run-parts --list \$HOME\/\.config\/xsession)/g' /etc/X11/Xsession
```

## Keyboard Setup

Primarily using `setxkbmap` (default) and `xcape` (installed package).

---

Clear all setxkbmap options:
```
setxkbmap -option
```

Query options that have been enabled:
```
setxkbmap -query
```
