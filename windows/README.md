# Command Prompt

Basic commands:

|     Windows Command     |     Linux Equivalent     |
|:-----------------------:|:------------------------:|
| cd                      | cd                       |
| dir                     | ls                       |
| echo                    | echo                     |
| path                    | echo $PATH               |
| schtasks                | crontab                  |

## Notes

### Quotes

Quotes are finnicky and inconsistently-defined. Most programs **expect double-quotes** by default, except for statements accepted by `FOR /F`. However there is **no consistent standard**. Use double-quotes in all cases except in exceptions. 

## Commands

### History

Get history:
```
C:> doskey /history
```

### Path Manipulations

Show path:
```
C:> path
```

### Binary Compare

```
C:> fc /b <file 1> <file 2>
```
