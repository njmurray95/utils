# Git

>  Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency. 

> -- Git Homepage: https://git-scm.com/

> Git development began in April 2005, after many developers of the Linux kernel gave up access to BitKeeper, a proprietary source-control management (SCM) system that they had formerly used to maintain the project. The copyright holder of BitKeeper, Larry McVoy, had withdrawn free use of the product after claiming that Andrew Tridgell had created SourcePuller by reverse engineering the BitKeeper protocols. The same incident also spurred the creation of another version-control system, Mercurial.
>
> Linus Torvalds wanted a distributed system that he could use like BitKeeper, but none of the available free systems met his needs. Torvalds cited an example of a source-control management system needing 30 seconds to apply a patch and update all associated metadata, and noted that this would not scale to the needs of Linux kernel development, where synchronizing with fellow maintainers could require 250 such actions at once. [...]
>
> Torvalds sarcastically quipped about the name git (which means unpleasant person in British English slang): "I'm an egotistical bastard, and I name all my projects after myself. First 'Linux', now 'git'." The man page describes Git as "the stupid content tracker".
>
> -- Wikipedia: https://en.wikipedia.org/wiki/Git

Git can be a right pain. The documentation is too verbose for most cases. Commands are poorly organized.

In many cases the best solution involves working around git entirely, and cloning fresh before adding backups of necessary files will usually solve any issues.

Most man pages can be found by searching for individual commands, i.e., `man git-commit`.

## Installation

Many systems have git. For those that don't, grab the suitable install from the Git Homepage, git does not have many fussy version requirements.

To get git installed on any project, simply run:

```
$ git init
```

## Files

* `~/.gitconfig`: Global config file for all git projects
* `.git/`: Per-project folder for git metadata
* `.gitignore`: per-project list of string patterns of filenames that git will ignore (i.e., not track changes to)

## Notes

### Add

Git is greedy about adding subdirectories, i.e. will add everything in any specified folder recursively:
```
$ ls project
config src README.txt
$ git add project # Adds everything under project
```

---

Sometimes it's useful to add only certain changes made to a file as part of one commit. The simplest way is to do this with `--patch` (`-p`):

```
$ git add --patch hello.cpp
```

Git will try to break the file into "hunks" (more or less contiguous sets of changes) and ask you to approve each one manually:

```
Stage this hunk [y,n,q,a,d,/,j,J,g,s,e,?]?
```

Where each option means:

* y stage this hunk for the next commit
* n do not stage this hunk for the next commit
* q quit; do not stage this hunk or any of the remaining hunks
* a stage this hunk and all later hunks in the file
* d do not stage this hunk or any of the later hunks in the file
* g select a hunk to go to
* / search for a hunk matching the given regex
* j leave this hunk undecided, see next undecided hunk
* J leave this hunk undecided, see next hunk
* k leave this hunk undecided, see previous undecided hunk
* K leave this hunk undecided, see previous hunk
* s split the current hunk into smaller hunks
* e manually edit the current hunk
* ? print hunk help

---

### Checkout

Easiest way to make a new branch and update the remote:
```
$ git checkout -b [branch name]
$ git push -u origin [branch name]
```

---

Checkout the most recent commit before a given date:
```
git checkout `git rev-list -1 --before="<date>" [branch]`
```

---

### Config

Set username and password:
```
$ git config [--local|--global] user.name VALUE
$ git config [--local|--global] user.password VALUE
```

---

List all git configurations:
```
$ git config --list
```

---

Cache passwords for an hour (no need to retype on every command):
```
git config --global credential.helper 'cache --timeout=3600'
```

---

### Diff

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

---

### Log

Find all commits which affect only one file/folder
```
$ git log --follow FILE
```

---

### Stash

Stash all changes (anything staged but not committed will be unstaged and stashed):
```
$ git stash
```

Stash all unstaged changes (this is usually what you really want):
```
$ git stash --keep-index
```

---

List all stashed changes that can be applied:
```
$ git stash list
stash@{0}: WIP on master: 049d078 added the index file
stash@{1}: WIP on master: 0fe0732 added number to log
```

---

Reapply stashed changes:
```
git stash apply
```

---

### Rebase

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

---

**If something goes wrong, bail with:** 
```
$ git rebase --abort
```

---

Editing old commits by running a rebase. We can edit the second commit by saving this file:
```
pick ecf349e first commit
edit ea78103 second commit
pick 56203ab third commit
```

(Note the **edit** written for the second commit.)

Git will drop us in the shell after the second commit but before the third commit. We can then edit the commit however we like with `git commit --amend`. To continue with the rebase use `git rebase --continue`.

---

### Misc.

More than once I've found it useful to create a merge conflict for didactic purposes:
```
$ git checkout -b conflict_branch
$ # edit, save, commit the file to conflict
$ git checkout master
$ # edit, save, commit the file to conflict
$ git merge conflict_branch
```
