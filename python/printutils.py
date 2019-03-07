#!/usr/bin/env python2

# Utilities for Python

from __future__ import print_function

import os
import sys
import json
import time
import inspect
import linecache

def dict_print(dictionary)
    print(json.dumps(
        dictionary,
        sort_keys=True,
        indent=4,
        separators=(',', ': ')
    )

def dprint(*args, **kwargs):
    """
    debug print
    Print a time stamp, stack depth, and a debug message
    """

    prefix = ""

    if stime:
        prefix += "[{:f}] ".format(gettime())

    depth = len(inspect.stack())
    prefix += "--" * (depth - 1)

    caller = inspect.stack()[-1][3]

    print(prefix, *args, **kwargs)

if __name__ == "__main__":
    import doctest
    doctest.testmod()
