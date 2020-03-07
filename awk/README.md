Valid commands (i.e., inside brackets):
```
if ( conditional ) statement [ else statement ]
while ( conditional ) statement
for ( expression ; conditional ; expression ) statement
for ( variable in array ) statement
break
continue
{ [ statement ] ...}
variable=expression
print [ expression-list ] [ > expression ]
printf format [ , expression-list ] [ > expression ]
next
exit
```

Pattern matching rules:
```
awk 'NR % 2'            # print even lines
awk '!(NR % 2)'         # print odd lines
awk 'NR > 5'            # print lines 5-N (equivalent to tail -n +5)
awk 'NF == 1'           # print lines with exactly one field
awk '/foo/'             # print lines matching pattern /foo/
awk '/foo/ && !/bar/'   # print lines matching /foo/ but not /bar/
awk '/foo/ || /bar/'    # print lines matching /foo/ or /bar/
awk '/foo/,/bar/'       # print lines from /foo/ to /bar/, inclusive
awk '$0 = NR" "$0'      # prepend line number on all lines (can assign in conditions)
```

Special variables:
```
NR = Number of the current row (global)
FNR = Number of the current row (in this file)
```

Pass variables into awk with -v (easier than dealing with quotes and escapes):

```
$ awk -v var="value" 'BEGIN {print var}'
value
```

Read environment variables
```
$ export var="value"
$ awk 'BEGIN {print ENVIRON["var"]}'
value
```
