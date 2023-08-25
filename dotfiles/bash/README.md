# Bash

# Installation

Bash comes installed on everything. Usually not how we want it.

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

After this:
```
mkdir -p ~/.config/bash/scripts
```

Copy over `bashrc` to `~/.config/bash/bashrc`, and copy over any alias scripts to `~/.config/bash/scripts`.


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
### Bash Builtins

#### compgen

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

#### diff

Diff two file systems or folders:
```
$ diff -rq A B
```

Diff two commands in place (process substitution):
```
diff <(cmd) <(cmd)
```

### coreutils

#### timeout

Run a command with a time limit. `timeout [limit] command` will run 'command' until it terminates or the time limit is reached, whichever happens first. (Time limit defaults to seconds.)

Timeout [complicates signal handling](https://unix.stackexchange.com/questions/57667/why-cant-i-kill-a-timeout-called-from-a-bash-script-with-a-keystroke) when invoked in a script. Timeout places itself and all its children in a separate process group. This group by intention is different from the caller's process group. 

The simplest solution is to background the timeout call and invoke `wait` on its pid, so that a trap can be set to kill the job on CTRL-C or some other signal.

#### wait

`wait` pauses execution until jobs have completed. This is useful for backgrounding processes, but if you want to maintain exit status you need to actually specify the process id when invoking `wait`.

This hack only preserves the exit status of the last job finished but is simpler than trapping a handler:

```wait $(jobs -l | awk '{print $2}')```


### Scripting commands

#### xargs

Remove all files from a find command:
`find . -name "test" | xargs echo`

Equivalent:
`find . -name "test" | xargs -I '{}' echo '{}'`

`-I` defines a "replstr" which is replaced by xargs in the subsequent command with each line of input piped into xargs.

#### expect (???)

#### Figlet

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
