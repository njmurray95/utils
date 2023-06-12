```
                              _ _
 _ __   _____      _____ _ __| (_)_ __   ___
| '_ \ / _ \ \ /\ / / _ \ '__| | | '_ \ / _ \
| |_) | (_) \ V  V /  __/ |  | | | | | |  __/
| .__/ \___/ \_/\_/ \___|_|  |_|_|_| |_|\___|
|_|
```

# Overview

[Docs](https://powerline.readthedocs.io/en/latest/index.html)

Powerline configuration happens primarily in json. Powerline will look in the `$XDG_CONFIG_HOME` folder, here `~/.config`, for `powerline/config.json`. Common attributes for all powerline config happens here. Per-application configs can be set as such:

```
"tmux": {
    "colorscheme": "default",
    "theme": "newton"
}
```

`"theme"` changes the layouts of widgets ("segments") on the status bar while `"colorscheme"` changes the look. These files have to be located in the system powerline folder where the application has been installed. Here the config files in the local `~/.config` have been syslinked to the system file locations. Thus tmux powerline will look for `default.json` in the system `powerline/config_files/colorschemes/tmux` and for `newton.json` in the system `powerline/config_files/themes/tmux`.

In order to display special characters correctly, tmux requires a terminal set with a utf-8 compliant font.

# Segments

Segments are listed in the theme json file, as such:

```
"right": [
	{
		"function": "powerline.segments.common.time.date"
		"args": {
			"format": "%H:%M",
			"istime": true
		}
	}
]

```

Here the "function" is the python segment powerline defines, and "args" are the optional arguments passed when that function is called. Powerline defines different positions based on the application, generally,  "left", "right", or "above".

# Tmux

```
source "/anaconda3/lib/python3.6/site-packages/powerline/bindings/tmux/powerline.conf"
```
