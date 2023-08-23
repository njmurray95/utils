# Bash

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

### Hello World

hello.sh:
```
#!/bin/env bash
echo hello world
```

CLI:
```
bash -c "echo hello world"
```

## Misc.

List all available key shortcuts:
```
bind -lp
```

---

#### File Operators

* `-e`: file exists
* `-a`: file exists (deprecated `-e`)
* `-f`: file is file (not dir or device)
* `-s`: file is not zero size
* `-d`: file is a directory
* `-b`: file is a block device
* `-c`: file is a character device
* `-p`: file is a pipe
* `-h`: file is a symbolic link
* `-L`: file is a symbolic link
* `-S`: file is a socket
* `-t`: file is associated with terminal device (i.e., test stdin/stdout is from terminal)
* `-r`: file has read permission (for current user)
* `-w`: file has write permission (for current user)
* `-x`: file has execute permission (for current user)
* `-g`: file has set-group-id flag set
* `-u`: file has set-user-id flag set
* `-k`: file has sticky bit set
* `-O`: file is owned by current user
* `-G`: file has same group-id as current user
* `-N`: file modified since last read
* `-nt`: file A is newer than file B
* `-ot`: file A is older than file B
* `-er`: file A and file B are hard links to the same file

i.e.,

```
if [ -e "$file" ]; then
  # Do something
else
  # Do something else
fi;
```
```
[[ -d "$folder" ]] && # Do something
```

(See Linux Documentation Project [Bash Guide, Chapter 7.2](http://tldp.org/LDP/abs/html/fto.html))

## Getopts (argparsing)

```
while getopts <OPTSTRING> opt; do
  case $opt in
    <OPTION A> ) <DO SOMETHING> ;;
    <OPTION B> ) <DO SOMETHING> ;;
  esac
done
```

`OPTSTRING` is a string of each single-character option with the following rules:
* Any character preceded by `:` takes an optional argument, read into `$OPTARG`
* `:` at the beginning of the string disables `getopt`'s automatic error checking
* `?` cannot be specified in `OPTSTRING` but always matches to any wrong arguments

i.e.,

```
while getopts "ab:" opt; do
  case $opt in
    a) echo "Flag a" ;;
    b) echo "Flag b with $OPTARG" ;;
    \?) echo "Invalid argument: $OPTARG" >&2 && exit 1;;
  esac
done
```
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

### diff

Diff two file systems or folders:
`$ diff -rq A B`

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

