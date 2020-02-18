# TypeScript

> TypeScript is a typed superset of JavaScript that compiles to plain JavaScript.

> -- TypeScript Homepage: https://www.typescriptlang.org/index.html

Developed by Microsoft and released in 2012, TypeScript was designed to offer the benefits of static typing within JavaScript without obviating JavaScript.

Beware!

> You can use TypeScript even if there are errors in your code. But in this case, TypeScript is warning that your code will likely not run as expected.

> -- "TypeScript in 5 Minutes": https://www.typescriptlang.org/docs/handbook/typescript-in-5-minutes.html

## Installation

Using `npm`:
```
$ node install -g typescript
```

Vim Syntax Plugin:
```
$ git clone https://github.com/leafgarland/typescript-vim.git
```

## Building

Default:
```
$ tsc <files>
```

## Files

* `*.ts`: TypeScript source files
* `*.tsx`: TypeScript source files with JSX enabled
* `*.d.ts`: ["Declaration" files](https://en.wikipedia.org/wiki/TypeScript#Declaration_files) that declare types of JavaScript files so they can be statically-checked in TypeScript
* `*.js`: JavaScript source files, TypeScript output files
