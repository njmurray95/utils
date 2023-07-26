# lua

Small fast programming language written in ~20k lines of C. Used as config for many different projects (now notably neovim).

## Installation

```
$ apt-get install lua[5.4]
```

## Use

```
lua
```

## Interpreter

* Old Lua interpreters do not normally display values:
```
> "hello world"
stdin:1: unexpected symbol near '"hello world"'
>
```

* Values must be explicitly returned to achieve this affect
```
> return "hello world"
hello world
>
```

* The '=' can be used as a shortcut for this purpose
```
> = "hello world"
hello world
>
```

## Tables

* All structures in lua are really tables

* indexing can be done two ways
```
a['x'] = 10
a.y = 5
print(a.x) -- 10
print(a['y']) -- 5
```

* Table fields evaluate to `nil` when not initialized

* Tables can be any mixture of types

## Functions
* Lua supplies 'nil' for all blank parameters
```
> function test(a)
>> print(a)
>> end
> test()
> nil
```

* lua can return multiple values and discards any not used
```
> function test()
>> return 1, 2
>> end
> a = test()
```

## Useful

* load code:
`dofile(FILE)`

or
```
f = loadfile(FILE)
f()
```

* swap
`a, b = b, a`

* assert
`assert(CONDITIONAL)`
