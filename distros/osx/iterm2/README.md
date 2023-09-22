```
  _ _                      ____
 (_) |_ ___ _ __ _ __ ___ |___ \
 | | __/ _ \ '__| '_ ` _ \  __) |
 | | ||  __/ |  | | | | | |/ __/
 |_|\__\___|_|  |_| |_| |_|_____|
```

# Overview

iterm2, like most OSX apps, is primarily configured through menu settings. Finnicky and tedious. But a number of settings are worth changing regardless. This documentation is for iterm2 v. 3.1.5.

# Appearance

iterm2 stores information about appearance in two places, under "Preferences" -> "Appearance" and under individual profiles in the "Window" tab.

### Transparency

Transparency is a per-window profile property. It's under "Profiles" -> "Window". It's set by a slide bar and doesn't take effect until iterm2 has been restarted. I find a value around 40% sufficient.

### Title Bar

iterm2 doesn't have the ability to remove the title bar, but it is open source. First download the source: https://github.com/gnachman/iTerm2

Then under `sources/` edit the `PseudoTerminal.m` file and search for "NSTitledWindowMask". There should be a default switch case that looks something like this:

```
default:
	return (NSTitledWindowMask |
	NSClosableWindowMask |
	NSMiniaturizableWindowMask |
	NSResizableWindowMask |
	NSTexturedBackgroundWindowMask);
```

Remove "NSTitledWindowMask", which is the inheritance from which iterm2 gets the title bar. `cd` into the root project directory and `make`. (You will need XCode tools to build.) This will produce a new iterm2.app. Replace the one in the system "Applications" folder. iterm2 is now sans title bar.

# Hotkey Window

iterm2 can create a Hotkey Window to pull down in front of other apps. Under "Preferences" -> "Keys" select "Create a Dedicated Hotkey Window". Do not check the box for "Show/hide all windows with a system-wide hotkey," which will toggle all iterm2 instances with one hotkey.

Once the window is created it gets stored in "Preferences" -> "Profiles". Going to "Profiles" -> "Hotkey Window" -> "Keys" should show a checked box and an option to "Configure Hotkey Window". Check both "Floating Window" (iterm2 will appear in front of other apps) and "Pin hotkey window" (iterm2 will stay in front of other apps). This is also the place to reconfigure the hotkey itself.
