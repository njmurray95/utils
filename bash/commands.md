# Builtins

### compgen

[Docs](https://www.gnu.org/software/bash/manual/html_node/Programmable-Completion-Builtins.html)

Completion generator, useful for listing all available commands.

List all aliases:
`compgen -a`

Accepts an optional WORD pattern. Commands for string 'python'
`compgen -c py`

Main options:

* aliases: -a
* builtins: -b
* commands: -c
* directories: -d
* exported vars: -e
* files: -f
* keywords: -k
* groups: -g

The `-A` flag takes an ACTION parameter and can autocomplete another set of variables:
`compgen -A function`

Main options:
* alias
* directory
* export
* file
* function
* hostname
* running
* signal
* variable

# coreutils

# binutils

## objdump


# Useful scripting commands

## xargs

Remove all files from a find command:
`find . -name "test" | xargs echo`

Equivalent:
`find . -name "test" | xargs -I '{}' echo '{]'`

`-I` defines a "replstr" which is replaced by xargs in the subsequent command with each line of input piped into xargs.

## expect (???)

# Powerful tools

## pandoc

* Convert files between different formats
`pandoc file.oldformat -o file.newformat`

## Imagemagick

* Convert image to another format:
`convert a.jpg b.pdf`
`convert a.png b.jpg`

* Convert multiple images into one pdf:
`convert a.jpg b.jpg ... out.pdf`

## Figlet

* Make big letters

```
$ figlet "test"
 _            _
 | |_ ___  ___| |_
 | __/ _ \/ __| __|
 | ||  __/\__ \ |_
  \__\___||___/\__|

$
```

