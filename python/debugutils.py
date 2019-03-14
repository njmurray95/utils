#!/usr/bin/env python3
# Utils for debugging code.

import sys
import time
import inspect

def tracer(delay=0):
    '''Debug by printing the stack during program execution.
       Creates a trace function and sets it to the global sys trace function.
            @delay -> optional delay to slow program execution
    '''
    import linecache
    from printutils import dprint

    def trace(frame, event, arg):
        # Only report function calls
        if event != 'call':
            return

        name = frame.f_code.co_name
        filename = frame.f_code.co_filename
        lineno = frame.f_lineno
        line = linecache.getline(filename, lineno)

        print(filename + ":" + str(lineno) + " " + name)
        dprint(line)
        time.sleep(delay)

    sys.settrace(trace)

def stack(show=None):
    """
    Print the stack at time this function is called.
    >>> (lambda: stack())()
    <module> -> <lambda>
    """
    print(" -> ".join([s[3] for s in inspect.stack()][2:0:-1]))
    stack = [ s for s in inspect.stack()][::-1]
    start = show if show else 0
    print(" -> ".join([s[3] for s in inspect.stack()][start::]))
    
def pdb_kill():
    '''Run pdb on a KeyboardInterrupt (which maps to SIGINT)'''
    import signal
    import pdb
    def pdb_handler(signal, frame)
        pdb.set_trace()
    signal.signal(signal.SIGINT, pdb_handler)
    
def name(var):
    '''
    Hack to get the name of the variable passed in.
    '''
    import inspect
    local_vars = inspect.currentframe().f_locals.items()
    return [ name for name, val in local_vars if name is var ][0]
