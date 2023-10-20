# Miscellaneous

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

iptables -S # list all iptable rules

Things to look into:

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



