# Git Subtree and Git Submodule

# Subtree

Update a subtree:

Run this step if never updated the subtree before (where REMOTE is something like "MYCODEBASE_remote"):
```
git remote add -f <REMOTE> <URL>
```
```
git subtree pull --prefix <PREFIX> <URL> <BRANCH> --squash
```

