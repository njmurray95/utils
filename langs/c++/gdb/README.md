# GDB

> GDB, the GNU Project debugger, allows you to see what is going on 'inside' another program while it executes -- or what another program was doing at the moment it crashed.

> -- GNU's GDB Homepage: https://www.gnu.org/software/gdb/

Although GDB supports a variety of languages in theory, in practice it's mainly useful for C++.

* Source: https://www.gnu.org/software/gdb/download/
* Docs: https://www.gnu.org/software/gdb/documentation/


## Installation

Linux: default
OSX: `brew install gdb`
Windows: Use choco if you really need it: `choco install gdb`

## Files

* `.gdbinit` -- Set of gdb commands to issue upon opening gdb (same dir as from where gdb was invoked)

## Use

Invoke gdb:

```
gdb ./program
```

Debug program with arguments:

```
gdb ./program arg1 arg2...
```

Inspect corefile from after crash:

```
gdb ./program corefile
```

### Misc.

Useful bash alias (if $XDG_CONFIG_HOME not set):
```
gdb='gdb --init-command=/path/to/my/config.gdb`
```
