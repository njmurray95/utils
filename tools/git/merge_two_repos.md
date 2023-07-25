# Merge one repo into another

See: https://stackoverflow.com/questions/1683531/how-to-import-existing-git-repository-into-another

```
git remote add other /path/to/XXX
git fetch other
git checkout -b ZZZ other/master
mkdir ZZZ
git mv stuff ZZZ/stuff                      # repeat as necessary for each file/dir
git commit -m "Moved stuff to ZZZ"
git checkout master                
git merge ZZZ --allow-unrelated-histories   # should add ZZZ/ to master
git commit
git remote rm other
git branch -d ZZZ                           # to get rid of the extra branch before pushing
git push                                    # if you have a remote, that is
```
