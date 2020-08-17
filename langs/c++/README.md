# C++

[http://www.cplusplus.com/](http://www.cplusplus.com/)

[https://en.cppreference.com/w/](https://en.cppreference.com/w/)

# GDB for C++

## Breakpoints

gdb can set breakpoints on functions or file lines:

```
(gdb) b[reak] class::function()
(gdb) b[reak] file.cpp:100
```

`info break` will summarize all active breakpoints while `del n` will delete the breakpoint numbered `n`.

`catch throw` will set a breakpoint any time an exception is thrown.

## Stack Tracing

gdb is useful for switching between stack frames while code is executing:

```
(gdb) b[ack]t[race] # get list of frame numbers
(gdb) f[rame] <N> # jump to frame N in the stack
```

## MPI
Spawn an xterm terminal (or equivalent) for each mpi process:
```
$ mpirun -np N [xterm -e] gdb [--args] /path/to/exe [program args]
```
