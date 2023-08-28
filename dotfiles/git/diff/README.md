# Git Diff

`git diff` is practically a separate tool in terms of usefulness.

---

Diff two commits:
```
git diff [--options] <commit> <commit> [--] [<path>...]
```

i.e.,

```
$ git diff HEAD^^ HEAD a.txt
$ git diff HEAD~2 HEAD -- a.txt
```

git-diff checks arg position not timestamp when doing a diff. I.e., `git diff refA refB` will produce the opposite diff of `git diff refB refA`.

---

Find all files changed since hash COMMIT:
```
$ git diff --name-only [<COMMIT>]
```

---

Compare only files that have been staged:
```
$ git diff --cached [<COMMIT>]
```
