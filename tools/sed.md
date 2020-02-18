# sed

> sed is a stream editor. A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline). While in some ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass over the input(s), and is consequently more efficient. But it is sed’s ability to filter text in a pipeline which particularly distinguishes it from other types of editors. 

> -- GNU sed User Manual: https://www.gnu.org/software/sed/manual/sed.html

### Running

By default `sed` assumes editing is done on a stream. Hence, it prints directly to stdout:

```
$ sed SCRIPT INPUTFILE
```

And without an `INPUTFILE` sed will actually read directly from stdin.

In most cases it's easier to use the `-i` (for "inplace") option to make `sed` read from and write to the same file.

### Common Uses

Find replace all:

```
sed -i  's/a\.example\.com/b.example.com/g' [files]
```
