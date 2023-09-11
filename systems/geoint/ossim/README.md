# ossim

> OSSIM is an open source, C++ (mostly), geospatial image processing library used by government, commercial, educational, and private entities throughout the solar system. It has been in active development since the last millenium.
>
> --https://github.com/ossimlabs/ossim

## Use

`ossim` comes with a lot of binaries. For a full list (you won't need one), run: `compgen -c 'ossim' | sort`

```
$ ossim-cli [info | orthoigen | ...]
$ ossim-info
$ ossim-orthoigen
```

Check available installed writers:
```
$ ossim-info --writers
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

By default `ossim` will read from: `$OSSIM_PREFS_FILE`.

https://trac.osgeo.org/ossim/wiki/ossimElevationSetup

---

Here is an elevation config that seems to "work":

```
cache_size: 4000
tile_size: 1024

// This data path seemed to break once when it ended in a '/' -- meaningless?
elevation_manager.elevation_source0.connection_string: /path/to/dted/data
elevation_manager.elevation_source0.enabled: true
elevation_manager.elevation_source0.extension: .dt2
elevation_manager.elevation_source0.type: dted_directory
elevation_manager.elevation_source0.min_open_cells: 25
elevation_manager.elevation_source0.max_open_cells: 50
elevation_manager.elevation_source0.memory_map_cells: false
elevation_manager.elevation_source0.geoid.type: geoid1996
elevation_manager.elevation_source0.upcase: false

// [ Insert other elevation sources here ]

elevation.enabled: true
elevation.auto_sort.enabled: true
elevation.auto_load_dted.enabled: true

geoid_egm_96_grid: /path/to/egm96.grd
```

Where `path/to/dted/data` might be structured like this:

```
data
├── w065
│   └── n18.dt2
└── w067
    └── n01.dt2
```

To test that a cell is loaded correctly, use `ossim`'s `--height` option:

```
ossim-info -P /path/to/ossim_preferences --height 18.24 -64.55
```
(Or whatever latitude/longitude pair matches the available elevation data cells.)
