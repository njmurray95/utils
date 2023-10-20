# CLI

Notes on miscellaneous CLI tools.

#### Man Pages

See also `man man` (`man 1 man`):

```
  The standard sections of  the
       manual include:

       1      User Commands

       2      System Calls

       3      C Library Functions

       4      Devices   and  Special
              Files

       5      File Formats and  Con-
              ventions

       6      Games et. Al.

       7      Miscellanea

       8      System  Administration
              tools and Deamons
```

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

