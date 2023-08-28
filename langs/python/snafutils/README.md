# snafutils

A folder for some useful utils when using python. (`snafu` + `utils` -- a unique name not likely to conflict with actual python packaes.)

To """install""":

1) Find the place where python puts packages

(`/usr/lib/python3/dist-packages`, `/opt/homebrew/anaconda3/lib/python3.9/site-packages/snafutils/` or thereabouts)

2)

```
sudo mkdir -p /usr/lib/python3/dist-packages/snafutils/
sudo ln -s ~/code/utils/langs/python/snafutils/* /usr/lib/python3/dist-packages/snafutils/
```

Now these utils can be imported anywhere, like this:

```
>>> import snafutils
>>> from snafutils import debugutils
>>> debututils.dprint('test')
-- test
>>>
```
