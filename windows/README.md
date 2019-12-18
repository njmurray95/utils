# cmd.exe
Basic commands:

|     Windows Command     |     Linux Equivalent     |
|:-----------------------:|:------------------------:|
| cd                      | cd                       |
| dir                     | ls                       |
| echo                    | echo                     |
| path                    | echo $PATH               |
| schtasks                | crontab                  |
| doskey /history         | history                  |
| mkdir                   | mkdir                    |
| del                     | rm                       |
| fc                      | diff                     |
| type nul > <file>       | touch <file>             |

## Commands

### fc (file compare, diff)

binary compare:
```
C:> fc /b <file 1> <file 2>
```

## Misc.

### Quotes

Quotes are finnicky and inconsistently-defined. Most programs **expect double-quotes** by default, except for statements accepted by `FOR /F`. However there is **no consistent standard**. Use double-quotes in all cases except in exceptions. 

