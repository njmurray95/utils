# GDB

> GDB, the GNU Project debugger, allows you to see what is going on `inside' another program while it executes -- or what another program was doing at the moment it crashed. 

> -- GNU's GDB Homepage: https://www.gnu.org/software/gdb/

Although GDB supports a variety of languages in theory, in practice it's mainly useful for C++.

## Installation

Linux should have it already. OSX is `brew install gdb`. Windows is as usual more complicated -- here again it's best to rely on Chocolatey with `choco install gdb`.

## Files

* `.gdbinit`: Default config file -- gdb executes any statements as if typed in manually during session
