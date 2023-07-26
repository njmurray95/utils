# `readline`

This is the program that intercepts and parses shortcuts and keybindings in terminal command-line interpreters. `bash`, `python`, and javascript's `node` terminals all use `readline`, among other programs. (Notably, `zsh` does not use readline.)

## Config

If readline doesn't read from `$XDG_CONFIG_HOME` by default, it should always read from `INPUTRC`:

`bashrc`
```
export XDG_CONFIG_HOME="$HOME/.config"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
```

## Use

To invoke readline manually, one can do this:

```
bind -f /path/to/readline/config
```

This is highly recommended when working with experimental changes -- if you bork your inputrc with a bad setting, bash and other readline-compliant software will become nigh-unusable.

If you end up in this state, try the following:

* Open a `zsh` session
* Edit / destroy the `inputrc` file using notepad or other external programs
