# Python

Above are some useful functions and tricks I've picked up over time. They're grouped by topic, roughly according to what tasks call for each. Each is intended to be backwards-compatible as much as possible, anything with a generic shebang of "python" should run in python2. Many can be tested by invoking the files as main, although some don't lend themselves well to docstrings. Most imports are handled on a per-function basis, to make dependencies obvious when copy-pasting.

## Installation

Python 3 should come installed on all new systems. Check for `which python` or `which python3` to check which name it lives under.

The package manager pip does not always come installed (for some reason). Documentation on how to install is found here:

https://pip.pypa.io/en/stable/installation/

(Although usually it's proven more reliable to download `get-pip.py` and run manually instead of relying on the `ensurepip` module being present.)

## Profiling

Python should come with `profile` and `cProfile` by default:

```
python -m cProfile ./path/to/script
```

## Debugging (PDB -- the Python Debugger)

* Set a breakpoint in file

```
# Python 2-3.6
import pdb
pdb.set_trace()
# Python 3.7 and higher:
breakpoint()
```

* Invoke from commandline

```
$ python -m pdb [file.py]
```

* Invoke from python terminal

```
>>> import pdb
>>> pdb.run([module])
```

