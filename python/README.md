# Python

## General notes

### Invoking PDB (Python Debugger)

* Set a breakpoint in file

```
import pdb
pdb.set_trace()
```

Python 3.7 and higher:
```
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

