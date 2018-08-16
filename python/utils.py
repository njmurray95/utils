#!/usr/bin/env python2

# Utilities for Python

from __future__ import print_function

import sys
import time
import inspect
import linecache

stime = None

def gettime():
    global stime
    if stime == None:
        settime()
    return time.time() - stime

def settime():
    global stime
    stime = time.time()

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

def tracer(delay=0):
    '''Debug by printing the stack during program execution.
       Creates a trace function and sets it to the global sys trace function.
            @delay -> optional delay to slow program execution
    '''

    def trace(frame, event, arg):
        # Only report function calls
        if event != 'call':
            return

        name = frame.f_code.co_name
        filename = frame.f_code.co_filename
        lineno = frame.f_lineno
        line = linecache.getline(filename, lineno)

        dprint(filename + ":" + str(lineno) + " " + name)
        print(line)
        time.sleep(delay)

    sys.settrace(trace)

def stack(show=None):
    """
    >>> (lambda: stack())()
    <module> -> <lambda>
    """
    print(" -> ".join([s[3] for s in inspect.stack()][2:0:-1]))
    #stack = [ s for s in inspect.stack()][::-1]
    #start = show if show else 0
    #print(" -> ".join([s[3] for s in inspect.stack()][start::]))

def ngrams(line, n):
    '''Returns a list of ngrams from some string.
        @line -> string to split
        @n -> ngram size
    '''
    return zip(*[line[i:] for i in range(n)])

def pdb_kill():
    '''Sets the SIGINT handler, thrown on KeyboardInterrupt, to run pdb'''
    import signal
    import pdb
    def pdb_handler(signal, frame)
        pdb.set_trace()
    signal.signal(signal.SIGINT, pdb_handler)

################################################################################
## Useful Notes
################################################################################

''' Iterating through by two
    >>> mylist = [1, 2, 3, 4]
    >>> for first, second in zip(mylist, mylist[1:]):
    >>>     print(first, second)
    1 2
    2 3
    3 4
'''

if __name__ == "__main__":
    import doctest
    doctest.testmod()
    print("Ran utils")
