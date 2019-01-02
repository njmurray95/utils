# Git

Git can be a right pain. The documentation is too verbose for most cases. Commands are poorly organized.

In many cases the best solution involves working around git entirely, and cloning fresh before adding backups of necessary files will usually solve any issues.

Most man pages can be found by searching for individual commands, i.e., `man git-commit`.

## Checkout

Checkout the most recent commit before a given date:
```
git checkout `git rev-list -1 --before="<date>" [branch]`
```

## Config

### Setting username and password
```
$ git config [--local|--global] user.name VALUE
$ git config [--local|--global] user.password VALUE
```

### List all git configurations
```
$ git config --list
```

### Cache passwords for an hour (no need to retype on every command):
```
git config --global credential.helper 'cache --timeout=3600'
```


## Rebase

One of git's most useful and powerful features is the rebase. Rebase technically merges one branch onto HEAD while preserving some history, but practically can be used for anything involving merging different commits, including retroactively editing previous commits.

You almost always want to do this interactively with `-i`. You can specify any commit reference, including a hash or a tag:

```
$ git rebase -i [commit ref]
```

This will open a session in the editor with a file where each line is a commit and some rebase command. For example:

```
pick ecf349e first commit
pick ea78103 second commit
pick 56203ab third commit
```

Once this file is saved git will fast-forward through each commit, applying the rebase command as it goes. Every command defaults to `pick`. 

### Editing previous commits

We can edit the second commit by saving this file:

```
pick ecf349e first commit
edit ea78103 second commit
pick 56203ab third commit
```

Git will drop us in the shell after the second commit but before the third commit. We can then edit the commit however we like with `git commit --amend`. To continue with the rebase use `git rebase --continue`.

## Misc.

### Creating a merge conflict

More than once I've found it useful to force a merge conflict for didactic purposes:

```
$ git checkout -b conflict_branch
$ # edit, save, commit the file to conflict
$ git checkout master
$ # edit, save, commit the file to conflict
$ git merge conflict_branch
```
