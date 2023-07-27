# Linux Desktop

## Config

### GNOME

Install the GNOME shell integration chrome extension:

https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep

And install whichever version of the config host matches the distro:

https://wiki.gnome.org/action/show/Projects/GnomeShellIntegration/Installation

Then plugins can be installed from the (Gnome Extensions List)[https://extensions.gnome.org/] by clicking-through on the website.

#### Useful extensions

Windows 10 Tiling for GNOME (adds quarter-tiling by button clicks)
https://extensions.gnome.org/extension/1723/wintile-windows-10-window-tiling-for-gnome/

## Misc.

Version information about the distrol:
```
cat /etc/issue
```

Find information about a file's type and structure (see `man magic`):
```
file /path/to/file
```

Find dynamically-loaded libraries and missing dependencies:
```
ldd /path/to/exe
```

Check cpu / architecture / endian info:
```
lscpu
```
