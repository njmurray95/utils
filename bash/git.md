# Git

Git can be a right pain. The documentation is too verbose for most cases. Commands are poorly organized.

In many cases the best solution involves working around git entirely, and cloning fresh before adding backups of necessary files will usually solve any issues.

Most man pages can be found by searching for individual commands, i.e., `man git-commit`.

# Setting username and password

```
$ git config [--local|--global] user.name VALUE
$ git config [--local|--global] user.password VALUE
```

# Deleting one commit from git's history

# Creating a merge conflict

More than once I've found it useful to force a merge conflict for didactic purposes:

```
$ git checkout -b conflict_branch
$ # edit, save, commit the file to conflict
$ git checkout master
$ # edit, save, commit the file to conflict
$ git merge conflict_branch
```