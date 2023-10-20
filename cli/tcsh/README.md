# tcsh / csh

(In general tcsh/csh should be avoided)

**tcsh**, an extension of **csh**, a shell with """c-like syntax""". It is not POSIX-compatible. It's old (c. 1975) and this generally explains most of its builtin redefinitions and other assorted oddities.

General:
* Key bindings: `bindkey`

Startup config order:
* `/etc/csh.cshrc`
* `~/.tcshrc`
* `~/.cshrc` (if no `~/.tcshrc`)

tcsh and csh **should not be used for scripting**. The csh scripting language is severely flawed, because, among other reasons:

1. Csh parses while it executes, leading to very inconsistent syntax interpretation (whitespace matters):

```
 ) set a="b"
 ) set a = "b"
 ) set a= "b"
set: Variable name must begin with a letter.
 ) set a ="b"
set: Variable name must begin with a letter.
```
(This also implies that working code can crash when a rarely-executed branch is reached.)

2. Csh offers poor support for I/O redirection or piping with complex commands. 
3. Csh offers poor support for process and signal management (with only one signal trap).
4. Because of its age, Csh supplies many builtins that overwrite now-standard binaries. Causing problems like this:

```) time | echo # this will hang

 )  ) jobs
[1]  + Running                       time |
```

5. The interactive shell differs from executable scripts. Among other differences: interactive shell lacks comments.

