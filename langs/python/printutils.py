#!/usr/bin/env python
# Utils for python printing -- neat dictionaries, stack trace prints, etc.

from __future__ import print_function # Python 2 compatibility

def dict_print(dictionary):
    import json
    print(
        json.dumps(
            dictionary,
            sort_keys=True,
            indent=4,
            separators=(',', ': ')
        )
    )

def dprint(*args, **kwargs):
    """
    debug print
    Print a time stamp, stack depth, and a debug message
    """
    import time
    import inspect

    prefix = ""

    if stime:
        prefix += "[{:f}] ".format(gettime())

    depth = len(inspect.stack())
    prefix += "--" * (depth - 1)

    caller = inspect.stack()[-1][3]

    print(prefix, *args, **kwargs)
    
def side_by_side_diff(a, b):
    '''Return a side-by-side diff of the texts.'''
    from side_by_side import print_side_by_side
    import io
    import sys
    
    # Use the side-by-side module which covers all the tricky edge cases
    # It doesn't have any method to buffer output so we do a stdout redirect
    s = io.StringIO()
    sys.stdout = s
    print_side_by_side(a, b)
    sys.stdout = sys.__stdout__
    return s.getvalue()

if __name__ == "__main__":
    import doctest
    doctest.testmod()
