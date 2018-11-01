# Pass variables into awk with -v
# Easier than dealing with quotes and escapes

```
$ awk -v var="value" 'BEGIN {print var}'
value
```

# This reads anything from the environment
```
$ export var="value"
$ awk 'BEGIN {print ENVIRON["var"]}'
value
```
