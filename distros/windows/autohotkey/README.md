# AutoHotkey

>  AutoHotkey is a free, open-source scripting language for Windows that allows users to easily create small to complex scripts for all kinds of tasks such as: form fillers, auto-clicking, macros, etc.
>
> -- AutoHotkey Homepage: https://www.autohotkey.com

AutoHotkey is a daemon that uses scripts to run keybindings and macros. It is highly configurable and very convenient.

* Documentation: `C:\Program Files\AutoHotkey\AutoHotkey.chm`
* Tutorial: `https://www.autohotkey.com/docs/Tutorial.htm`

AutoHotkey has no config file; to launch bindings on PC start, consult the doc [FAQ](https://www.autohotkey.com/docs/FAQ.htm#Startup). Basically it's using Windows startup:

1. `Win`+`R` to launch the Windows Run Dialogue
2. Enter `shell:startup` (or `shell:common startup` to configure for all users)
3. Copy/Paste the `ahk` file as a shortcut to the `.ahk` file.

## Keybindings

* `#`: `Win` (Windows logo key)
* `!`: `Alt`
* `^`: `Control`
* `+`: `Shift`
* `&`: Combination of keys and mouse buttons

To treat characters as literals instead of special tokens, surround them in `{`brackets`}`.
