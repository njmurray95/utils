# Get Everything Working

## Unix

Everything should live under `$XDG_CONFIG_HOME`, which should be defined as `$HOME/.config`. Bash refuses to adopt, so the workaround is to modify `/etc/bash.bashrc`:

`/etc/bash.bashrc/` (Under everything else)
```
### USER MODIFIED
export XDG_CONFIG_HOME="$HOME/.config"
source "$XDG_CONFIG_HOME/bash/bashrc"
```

## Windows

TBD
