#!/usr/bin/env python
# Utils for python printing -- neat dictionaries, stack trace prints, etc.

from __future__ import print_function # Python 2 compatibility

# See also: import pprint

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


def side_by_side_diff(a, b):
    '''Return a side-by-side diff of the texts.'''
    breakpoint()
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
