# Linux Desktop

## Config

Make the global Xsession config file `/etc/X11/Xsession` source scripts in `$HOME/.config/xsession`):

```
$ sudo sed -i 's/\(SESSIONFILES=$([^)]*\)\()\)/\1 \&\& run-parts --list \$HOME\/\.config\/xsession)/g' /etc/X11/Xsession
```

### GNOME

Install the GNOME shell integration chrome extension:

https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep

And install whichever version of the config host matches the distro:

https://wiki.gnome.org/action/show/Projects/GnomeShellIntegration/Installation

Then plugins can be installed from the [Gnome Extensions List](https://extensions.gnome.org/) by clicking-through on the website.

#### Useful extensions

All config done here:

https://extensions.gnome.org/local/

* Windows 10 Tiling (adds quarter-tiling by button clicks)

https://extensions.gnome.org/extension/1723/wintile-windows-10-window-tiling-for-gnome/

* GNOME window graphics

https://github.com/Schneegans/Burn-My-Windows

## Misc.

Version information about the distro:
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

Remount all drives:
```
sudo mount -av
```
