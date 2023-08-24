# PDB

The python debugger

---

To insert a breakpoint manually into any file, write:

3.7 or above:
```
breakpoint()
```

3.6 or below:
```
import pdb; pdb.set_trace()
```

Invoke from commandline:
```
$ python -m pdb [file.py]
```

Invoke from python terminal:
```
>>> import pdb
>>> pdb.run([module])
```

---

PDB sometimes gets stuck in a loop if you try to quit within an exception. To always force quit:
```
import os
os._exit(0)
```
