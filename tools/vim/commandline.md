# Command Line Mode (`:h :`, `:h cmdline-mode`)

Vim ultimately descends from `ed` -- the "standard text editor," one of the first parts of the Unix operating system developed in 1969. `ex` was developed as an *ex*tended version of `ed`, and `vi` was developed as the *vi*sual mode of `ex`. `vim` is *vi* *im*proved.

`sed` and `grep` also share this heritage -- `sed` is the *s*tream *ed*itor, and `grep` comes from the `ex` mnemonic `:g/re/p` (*g*lobally match the regex *re* and *p*rint).

From this heritage vim acquires a powerful commandline syntax available through the `:` key. (see `:help :`, `:help cmdline`). The full robustness of this command set is almost always missing from vim emulations running in other editors.

## Basic : commands

`:` commands generally look like this:

```
:[range] command [args...]
```

### Range (`:h :range`)

The optional `range` specifies lines over which the command will be run. Most commands default no range as equivalent to specifying the current line.

From `:h :range`:

```
Line numbers may be specified with:		*:range* *E14* *{address}*
	{number}	an absolute line number
	.		the current line			  *:.*
	$		the last line in the file		  *:$*
	%		equal to 1,$ (the entire file)		  *:%*
	't		position of mark t (lowercase)		  *:'*
	'T		position of mark T (uppercase); when the mark is in
			another file it cannot be used in a range
	/{pattern}[/]	the next line where {pattern} matches	  *:/*
	?{pattern}[?]	the previous line where {pattern} matches *:?*
	\/		the next line where the previously used search
			pattern matches
	\?		the previous line where the previously used search
			pattern matches
	\&		the next line where the previously used substitute
			pattern matches


Each may be followed (several times) by '+' or '-' and an optional number.
This number is added or subtracted from the preceding line number.  If the
number is omitted, 1 is used.
```

Examples:

* `:d`: Delete current line
* `:.+3d`: Delete three lines below cursor
* `:23+d`: Delete line 24
* `:0,$d`: Delete all lines in current file
* `:%d`: Delete all lines in current file
* `:.,'ad`: Delete from current line until mark a

```
When separated with ';' the cursor position will be set to that line
before interpreting the next line specifier.  This doesn't happen for ','.
Examples: >
   4,/this line/
<	from line 4 till match with "this line" after the cursor line. >
   5;/that line/
<	from line 5 till match with "that line" after line 5.
```

### Command

Vim through `ex` inherits a number of cmdline-mode commands. Here are a few of the most useful:

* `d`: Delete lines in range
* `p`: Print lines in range
* `s/foo/bar`: Substitute `foo` with `bar` for lines in range
* `r [name]`: Read from file `[name]` or `range` and paste directly below cursor
* `r! [cmd]`: Execute `[cmd]` and paste output directly below cursor
* `!` [cmd]`: Execute `[cmd]` with `range` as input and paste output directly below cursor (deletes `range`)

With `:!` vim do very powerful things. The normal-mode command `![motion]` maps to `:[motion]!`, and `!!` maps to `:.!`. Some examples:

Sort all lines in file:
```
gg!Gsort<cr>
:0,$!sort
```

Apply external `markdown` package to file:
```
gg!Gmarkdown<cr>
:0,$!markdown
```

Run the python script currently in the buffer:
```
:!python %
```

## g and v (`:h :g`, `:h :v`)

Vim adds `:g` and `:v` for combining commands with pattern-matching:

```
:[range]g[lobal]/{pattern}/[cmd]
```

`:g` evaluates `[cmd]` on lines in `[range]` that match `{pattern}`; `:v` evaluates on lines that do *not* match ('v' for con**V**erse).

By default `[range]` is the whole file and `[cmd]` is `:p` (print).

Some examples:

Delete all lines containing `cout` statements:
```
:g/cout/d
```

## norm and exe (`:h :norm`, `:h :exe`)

```
:norm[al][!] {commands}
```

`:norm` is used to specify normal mode commands in the command-line. `:norm dd` is equivalent to typing `dd` in normal mode on the cursor's current position. 

```
:exe[cute] {expr1} ..
```

`:exe` is used to run string expressions as if they were `ex` commands. `:exe '25p'` is equivalent to `:25p`. `:exe` allows commands to be typed without regard to control characters -- pipes allowed, escape chars not needed.

## Operating across buffers

* `:bufdo`
* `:windo`
* `:tabdo`
* `:argdo`
