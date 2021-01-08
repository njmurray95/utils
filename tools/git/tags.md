# Git tags

https://git-scm.com/book/en/v2/Git-Basics-Tagging

Git tags mark certain commits as important so they can be found later. Usually used for marking release points and deliveries.

Creating an annotated tag:

```
$ git tag -a v1.0 -m "Version 1 release" <commit>
$
$ git tag -a project-delivery-1-1-2020 -m "Project delivered from this commit" <commit>
```

To push tags:

```
$ git push --follow-tags
```
