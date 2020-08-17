# Bash

Notes on bash.

## File Operators

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
