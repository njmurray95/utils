#!/usr/bin/env bash

#
# wallpaper.sh

# Imagemagic size prep
# convert wallpapers/file.jpeg -resize 64x64 ./tiny.jpeg

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
BLACK_SCREEN="black.png"

WALLPAPER=""
QUIET=0
BLACK=0

wallpaper() {
    while [[ "$1" ]]; do
        case $1 in
            -h | --help)
                echo "$0: [-q|--quiet] [-p|--path] </path/to/wallpaper/dir> [-w|--wallpaper] </path/to/wallpaper>"
                exit 0
                ;;
            -p | --path)
                if [[ "$2" ]]; then
                    WALLPAPER_DIR="$2"
                    shift
                else
                    echo "$0: Error: --path requires a directory."
                fi
                ;;
            -w | --wallpaper)
                if [[ "$2" ]]; then
                    WALLPAPER="$2"
                    shift
                else
                    echo "$0: Error: --wallpaper requires a file."
                fi
                ;;
            -q | --quiet)
                QUIET=1
                ;;
            -b | --black)
                BLACK=1
                # Quiet on black by default
                QUIET=1
                ;;
            *)
                echo "$0: Unknown option: $1"
                return 1
                ;;
        esac
        shift
    done

    if [[ -z "$WALLPAPER" ]]; then
        if [[ ! -d "$WALLPAPER_DIR" ]]; then
            echo "Wallpaper dir $WALLPAPER_DIR does not exit"
            exit 1
        fi

        # Select a random wallpaper
        WALLPAPER=$(find "$WALLPAPER_DIR" -type f | grep -v "$BLACK_SCREEN" | shuf -n 1)
    fi

    if [[ ! -e "$WALLPAPER" ]]; then
        echo "Error: could not find wallpaper $WALLPAPER"
        exit 1
    fi

    if [[ "$BLACK" -eq 1 ]]; then
        WALLPAPER="$BLACK_SCREEN"
    fi

    if [[ "$QUIET" -ne 1 ]]; then
        echo "Setting wallpaper to $WALLPAPER"
    fi

    # Set it
    if [[ `ps -ef | pgrep "gnome"` ]]; then
    # if [[ $XDG_CURRENT_DESKTOP == *"GNOME" ]]; then
        # Using gnome, have to use gsettings

        # Necessary on crontab
        export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

        gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER"
        gsettings set org.gnome.desktop.background picture-options "scaled"
        # For other options, see:
        # `gsettings range org.gnome.desktop.background picture-options
    else
        feh --bg-fill "$WALLPAPER"
    fi
}

[[ -z $BASH_SOURCE ]] && wallpaper $@
