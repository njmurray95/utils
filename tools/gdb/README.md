# gdb

> GDB, the GNU Project debugger, allows you to see what is going on `inside' another program while it executes -- or what another program was doing at the moment it crashed. 
>
> -- https://www.gnu.org/software/gdb/

* Source: https://www.gnu.org/software/gdb/download/
* Docs: https://www.gnu.org/software/gdb/documentation/

## Warnings

None.

## Installation

Download from source or install `gdb` from any CLI package manager.

## Files

* `./.gdbinit` -- Set of gdb commands to issue upon opening gdb (same dir as from where gdb was invoked)

## Use

Invoke gdb:

`gdb ./program`

With arguments:

`gdb ./program arg1 arg2...`

With corefile:

`gdb ./program corefile`


