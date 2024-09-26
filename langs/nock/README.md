# Nock

It's a pain to install a standalone interpreter. They say to write your own. Maybe I will later.

The best way to do it was to install [J. Tobin's haskel implementation](https://github.com/jtobin/hnock):

```
ghci install hnock
```

And then, in $BASHRC:

```
HNOCK_EXECUTABLE="$HOME/.cabal/bin/hnock"

hnock () {
    while true; do
        read -e -p "nock> " input
        echo "$input" | "$HNOCK_EXECUTABLE"
    done
}
```

## Lang

The infamously short nock specification, reproduced:

```
nock(a)             *a
[a b c]             [a [b c]]

?[a b]              0
?a                  1
+[a b]              +[a b]
+a                  1 + a
=[a a]              0
=[a b]              1

/[1 a]              a
/[2 a b]            a
/[3 a b]            b
/[(a + a) b]        /[2 /[a b]]
/[(a + a + 1) b]    /[3 /[a b]]
/a                  /a

#[1 a b]            a
#[(a + a) b c]      #[a [b /[(a + a + 1) c]] c]
#[(a + a + 1) b c]  #[a [/[(a + a) c] b] c]
#a                  #a

*[a [b c] d]        [*[a b c] *[a d]]

*[a 0 b]            /[b a]
*[a 1 b]            b
*[a 2 b c]          *[*[a b] *[a c]]
*[a 3 b]            ?*[a b]
*[a 4 b]            +*[a b]
*[a 5 b c]          =[*[a b] *[a c]]

*[a 6 b c d]        *[a *[[c d] 0 *[[2 3] 0 *[a 4 4 b]]]]
*[a 7 b c]          *[*[a b] c]
*[a 8 b c]          *[[*[a b] a] c]
*[a 9 b c]          *[*[a c] 2 [0 1] 0 b]
*[a 10 [b c] d]     #[b *[a c] *[a d]]

*[a 11 [b c] d]     *[[*[a c] *[a d]] 0 3]
*[a 11 b c]         *[a c]

*a                  *a
```

`?`: Wut: -- `0` if an Atom, `1` if Cell
`+`: Lut: -- Add 1
`=`: Tis
`/`: Net
`#`: Hax
`*`: Tar
