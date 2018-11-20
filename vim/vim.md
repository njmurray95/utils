# Vim Notes

Automatically change line endings (see 'fileformat', 'ff'):
```
:set ff=dos
:set ff=unix
:set ff=mac
```

Do an in-buffer vim-diff:
```
:split
<open both files>
:diffthis
```

## Find/Replace Tricks

Replace word within file:
```
:%s/word/new/g
```

Replace word within highlighted section:
```
:'<,'>s/word/new/g
```

Replace word within all active buffers:
```
:bufdo %s/word/new/ge 
```

Appended Options:
* `g` -- "global" replace within selection (i.e. don't stop at first match)
* `i` -- case "insensitive" match
* `c` -- ask for "confirmation" before each replace
* `e` -- no "error" if pattern not found
