# Bash Builtins

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

### timeout

Run a command with a time limit. `timeout [limit] command` will run 'command' until it terminates or the time limit is reached, whichever happens first. (Time limit defaults to seconds.)

Timeout [complicates signal handling](https://unix.stackexchange.com/questions/57667/why-cant-i-kill-a-timeout-called-from-a-bash-script-with-a-keystroke) when invoked in a script. Timeout places itself and all its children in a separate process group. This group by intention is different from the caller's process group. 

The simplest solution is to background the timeout call and invoke `wait` on its pid, so that a trap can be set to kill the job on CTRL-C or some other signal.

### wait

`wait` pauses execution until jobs have completed. This is useful for backgrounding processes, but if you want to maintain exit status you need to actually specify the process id when invoking `wait`.

This hack only preserves the exit status of the last job finished but is simpler than trapping a handler:
```wait $(jobs -l | awk '{print $2}')```


# binutils

## objdump


# Scripting commands

## xargs

Remove all files from a find command:
`find . -name "test" | xargs echo`

Equivalent:
`find . -name "test" | xargs -I '{}' echo '{}'`

`-I` defines a "replstr" which is replaced by xargs in the subsequent command with each line of input piped into xargs.

## expect (???)

# Powerful tools

## pandoc

Convert files between different formats:
`pandoc file.old -o file.new`

Format is specified by default by the extension on the filetype.

## Imagemagick

Convert image to another format:
`convert a.jpg b.pdf`
`convert a.png b.jpg`

Convert multiple images into one pdf:
`convert a.jpg b.jpg ... out.pdf`

## Figlet

Make big letters:

```
$ figlet "test"
 _            _
 | |_ ___  ___| |_
 | __/ _ \/ __| __|
 | ||  __/\__ \ |_
  \__\___||___/\__|

$
```

