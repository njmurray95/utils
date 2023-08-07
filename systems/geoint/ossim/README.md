# ossim

> OSSIM is an open source, C++ (mostly), geospatial image processing library used by government, commercial, educational, and private entities throughout the solar system. It has been in active development since the last millenium.
>
> --https://github.com/ossimlabs/ossim

## Use

```
> ossim-info
```



### Elevation Setup

To point `ossim` to a specific preferences file:
```
$ ossim-info -P /path/to/ossim_preferences
```

To query information about the config `ossim` is using:
```
$ ossim-info [-P /path/to/ossim_preferences] --config
```

By default `ossim` will read from `$OSSIM_PREFS_FILE`.

https://trac.osgeo.org/ossim/wiki/ossimElevationSetup
