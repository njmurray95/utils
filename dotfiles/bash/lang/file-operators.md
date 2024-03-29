Single bracket `[ ]` notation is compliant on all shells, double-bracket `[[ ]]` notation is bash-specific.

## File operators

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

## Misc.

`-t fd`: True if `fd` is an open terminal file descriptor
```
[[ -t 0 ]] && echo "This command was invoked on shell" || echo "This command is on a pipe"
```


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
