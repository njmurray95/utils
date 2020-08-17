# Python

Above are some useful functions and tricks I've picked up over time. They're grouped by topic, roughly according to what tasks call for each. Each is intended to be backwards-compatible as much as possible, anything with a generic shebang of "python" should run in python2. Many can be tested by invoking the files as main, although some don't lend themselves well to docstrings. Most imports are handled on a per-function basis, to make dependencies obvious when copy-pasting.

## General notes

### Invoking PDB (Python Debugger)

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

