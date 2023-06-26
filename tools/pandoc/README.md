# Pandoc

> Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library.

> -- Pandoc User Manual: https://pandoc.org/MANUAL.html

### Installing

The Pandoc package is named identically across all package managers, therefore:

```
[choco|brew|apt-get|pacman|...] install pandoc
```

### Running

Pandoc parses the filenames you provide to determine what kind of conversion to provide -- no other config necessary. By default the file specified after `-o` is assumed output, the other named file as input. Thus:

```
$ pandoc -o output.html input.txt # Text to HTML
$ pandoc -o output.html input.md # Markdown to HTML
$ pandoc -o output.pdf input.tex # Latex to PDF
```
