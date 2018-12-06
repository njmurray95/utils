# Git

(Hope eventually to replace this with some proper config file that can be loaded once.)

List all git configurations:
```
git config --list
```

Cache passwords for an hour (so you don't have to retype on every command):
```
git config --global credential.helper 'cache --timeout=3600'
```

Checkout any arbitrary commit before a given date:
```
git checkout `git rev-list -1 --before="<date>" <branch>`
```
