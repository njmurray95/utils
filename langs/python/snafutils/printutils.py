#!/usr/bin/env python
# Utils for python printing -- neat dictionaries, stack trace prints, etc.

from __future__ import print_function # Python 2 compatibility

import sys

# See also: import pprint

class Tee:
    '''
    Write output to an artibrary number of file descriptors.
    '''
    def __init__(self, fd_list):
        self.fd_list = fd_list
    def __del__(self):
        pass
    def write(self, text):
        for fd in self.fd_list:
            fd.write(text)
    def flush(self):
        pass

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

    with open('test.txt', 'w') as testlog:
        with open('testtwo.txt', 'w') as testtwolog:
            testthreelog = open('testthree.txt', 'w')
            sys.stdout = Tee([sys.stdout, testlog, testtwolog, testthreelog])
            print('test')


