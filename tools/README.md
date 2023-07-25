# tools

Notes on miscellanoeous useful tools (still to be sorted)


## The easiest ways to get everything working on a new system

Everything should live under `$XDG_CONFIG_HOME`, which should be defined as `$HOME/.config`. Bash refuses to adopt, so the workaround is to modify `/etc/bash.bashrc`:

`/etc/bash.bashrc/` (Under everything else)
```
### USER MODIFIED
export XDG_CONFIG_HOME="$HOME/.config"
source "$XDG_CONFIG_HOME/bash/bashrc"
```

`~/.config/bash/bashrc` should then contain all local redefinitions and aliases. (I.e., `vim` -> `nvim`, `readline`, etc.)

### neovim

Neovim is robust and should work with `$XDG_CONFIG_HOME` by default.

For plugins, install: `https://github.com/junegunn/vim-plug`

Then open a vim session and execute:
```
:PlugInstall<cr>
```

### zsh

**zsh** is a newer shell (c. 1990) which has lately grown popular for its improved quality of life features. Zsh is completely backwards-compatible with bash -- though not by default but only when `emulate sh` is set. Given that zsh is rarely installed by default anyways, it's mostly better to stick with `bash` defaults.

`zsh` does not bind with `readline`. By default it will scan `$EDITOR` and `$VISUAL` for the string `"vi"` and use vi keys if found, emacs otherwise. `bindkey -e` and `bindkey -v` can set these manually, respectively.

### tcsh / csh

**tcsh**, an extension of **csh**, a shell with """c-like syntax""". It is not POSIX-compatible. It's old (c. 1975) and this generally explains most of its builtin redefinitions and other assorted oddities.

General:
* Key bindings: `bindkey`

Startup config order:
* `/etc/csh.cshrc`
* `~/.tcshrc`
* `~/.cshrc` (if no `~/.tcshrc`)

tcsh and csh **should not be used for scripting**. The csh scripting language is severely flawed, because, among other reasons:

1. Csh parses while it executes, leading to very inconsistent syntax interpretation (whitespace matters):

```
 ) set a="b"
 ) set a = "b"
 ) set a= "b"
set: Variable name must begin with a letter.
 ) set a ="b"
set: Variable name must begin with a letter.
```
(This also implies that working code can crash when a rarely-executed branch is reached.)

2. Csh offers poor support for I/O redirection or piping with complex commands. 
3. Csh offers poor support for process and signal management (with only one signal trap).
4. Because of its age, Csh supplies many builtins that overwrite now-standard binaries. Causing problems like this:

```) time | echo # this will hang

 )  ) jobs
[1]  + Running                       time |
```

5. The interactive shell differs from executable scripts. Among other differences: interactive shell lacks comments.

In general tcsh/csh should be avoided.

### Miscellaneous
cat /proc/cpuinfo -- Check stats about core
Note: if only one processor shows, check `uname -a` for SMP.
        Non-SMP kernals may not handle multiple processors.

getent group <groupname>
    fetches list of all members in that group (full /etc/group line)

Attributes:
    a: append only
    c: compressed (?)
    d: no dump (?)
    e: extent format (?)
    i: immutable (?)
    j: data journaling (?)
    s: secure deletion (?)
    t: no tail-merging (?)
    u: undeletable
    A: no atime updates (?)
    C: no copy on write (?)
    D: synchronous directory updates (?)
    S: synchronous updates (?)
    T: top of directory hierarchy (?)

seq  -- prints sequence of numbers (who comes up with this stuff?)

w -- shows who is logged on and what they are doing

blkid -- locate and print block device attributes

cut --  '-d' and a char sets the delimeter
        '-f' and a range of numbers sets the fields to retain

column -- columnate input
        -- '-t' automatically constructs a table from # of inputs

$RANDOM in bash returns a random int

$CDPATH is a variable that sets directories for cd to search in
        Note: if ~ is in CDPATH, ~/temp/ precedes ./temp/
        Note: Does not work with bash expansion

BASH SHORTCUTS:
    Alt + *     :   Insert all possible completions
    Alt + Ctrl-e:   Expose aliases, history, and completions
    C-x C-e     :   Open current line's command in $EDITOR

type -- "type ls" will expose the alias on ls
        '-t' lists the type of the command invoked
        '-a' lists the types of all binaries of the command
        '-f' suppresses shell lookup when listing types

\ls -- will execute ls without it's aliased value (unless it's a function)

pbcopy -- copies text to Mac system clipboard. I.e., pwd | pbcopy

Bash conditionals:
    -z -- True iff variable is unset
    -n -- True iff variable is set

NEW ARCHLINUX SECTION

startx -- launch Xorg server
pkill X -- kill Xorg server

ssh ProxyCommands:

    %h refers to the hostname as defined above
    %p refers to the port as defined above

    i.e.,

    ProxyCommand ssh -q nick@login.quadmetrics.com nc %h %p

Really Obscure bash

    `set -- one` makes "$1" == 'one'
    `n=1 && echo ${!n}` evaluates to "$1"

du -h <dirname> -- get size of files in directory recursively


PYTHON

dis.dis(<some python>) -- dissemble python into bytecode

PRINT ALL COLORS AVAILABLE TO TERM 256
for i in {0..255} ; do     printf "\x1b[38;5;${i}mcolour${i}\n"; done

`script` -- enter interactive shell that leves an lpr-compatible print record of session

ssh-keygen -lv -f $FILE # Print randomart representation of ssh key

### Use heredoc to read from stdin
    ssh-keygen -lvf /dev/stdin <<<$(ssh-keyscan $HOST)

iptables -S # list all iptable rules

Things to look into:

* iptables
* ident/identd
* nmap
* nc
* telnet
* tcpdump

### Simple NC examples

* chat-line connection

    nc -l 1234              # On one terminal
    nc 127.0.0.1 1234       # On another terminal

* File transfer

    nc -l 1234 > file.out
    nc 127.0.0.1 1234 < file.in

### Check for sudo access
    sudo -v

### Reverse shell w/ ncat (nmap version)
    ncat -vl -p $PORT -e /bin/bash

### tcpdump

https://danielmiessler.com/study/tcpdump/

