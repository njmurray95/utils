# GNU Make and Makefiles

```
                _
 _ __ ___   __ _| | _____
| '_ ` _ \ / _` | |/ / _ \
| | | | | | (_| |   <  __/
|_| |_| |_|\__,_|_|\_\___|
```

* Executable: `/usr/bin/env make`

## Notes

* Escaping `$`
Use `$$`
```echo $$bash_var```

* Wildcard rules can be defined with the `%` symbol:

```
check-%:
        @echo "Checking syntax of $*..."
        @g++ $(CXXFLAGS) -fsyntax-only $*
```

* `@` preceded by a bash command specifies no echo, i.e.,

```
$ cat makefile1
echo hello world
$ make all
echo hello world
hello world
$ cat makefile2
@echo hello world
$ make all
hello world
```

* Automatic variables
1. `$@`: filename of target of rule
2. `$<`: first prerequisite
3. `$?`: all prerequisites, separated by spaces

* `.PHONY` specifies commands which do not represent files
