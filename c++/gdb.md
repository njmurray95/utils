# Notes on using GDB for C++

## Breakpoints

gdb can set breakpoints on functions or file lines:

```
(gdb) b[reak] class::function()
(gdb) b[reak] file.cpp:100
```

`info break` will summarize all active breakpoints while `del n` will delete the breakpoint numbered `n`.
