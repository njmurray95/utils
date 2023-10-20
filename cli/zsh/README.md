# zsh

(Don't use it, too much hassle.)

**zsh** is a newer shell (c. 1990) which has lately grown popular for its improved quality of life features. Zsh is completely backwards-compatible with bash -- though not by default but only when `emulate sh` is set. Given that zsh is rarely installed by default anyways, it's mostly better to stick with `bash` defaults.

`zsh` does not bind with `readline`. By default it will scan `$EDITOR` and `$VISUAL` for the string `"vi"` and use vi keys if found, emacs otherwise. `bindkey -e` and `bindkey -v` can set these manually, respectively.

