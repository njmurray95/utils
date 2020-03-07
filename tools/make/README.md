# GNU Make

> GNU Make is a tool which controls the generation of executables and other non-source files of a program from the program's source files. 

> -- Make Homepage: https://www.gnu.org/software/make/

Make is for building projects. A wrapper around the compiler It is very old and crufty and not very resilient, highly platform-dependent. Still it's the simplest option for building small projects that (definitely, surely) will not become very complicated. 

## Installation

Most Unix systems probably have it, since compiling is such a fundamental unit of computer organization. Windows does not. The easiest way to get it is to use chocolatey, instead of trusting pre-compiled builds or building from source.

```
> choco install make
```

## Files

* `Makefile` or `makefile`: the main configure file for a Make project

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
