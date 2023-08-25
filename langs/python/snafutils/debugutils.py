#!/usr/bin/env python3
# Utils for debugging code.

import sys
import time
import inspect

def dprint(*args, **kwargs):
    """
    debug print
    Print a time stamp, stack depth, and a debug message
    """
    import time
    import inspect

    prefix = ""

    '''
    if stime:
        prefix += "[{:f}] ".format(gettime())
    '''

    depth = len(inspect.stack())
    prefix += "--" * (depth - 1)

    '''
    caller = inspect.stack()[-1][3]
    '''

    print(prefix, *args, **kwargs)


def getstack(trim=(0,0)):
    """
    Return the stack as a string at time this function is called.
    >>> (lambda: getstack(trim=((4,0))))()
    '<module> -> <lambda> -> getstack'
    >>> (lambda: (lambda: getstack(trim=(4,0)))())()
    '<module> -> <lambda> -> <lambda> -> getstack'
    >>> (lambda: (lambda: (lambda: getstack())())())() # doctest: +SKIP
    >>> (lambda: (lambda: (lambda: getstack(trim=(4,0)))())())()
    '<module> -> <lambda> -> <lambda> -> <lambda> -> getstack'

    (Note: doctest would prepend '<module> -> testmod -> run -> __run -> ' if we did not skip.)
    """
    import inspect
    # inspect.stack() returns a list of frames, [3] is the function name
    # Index from [::-1] -- reverse the sort
    # These are equivalent
    # stack = [t[2] for t in traceback.extract_stack()]
    # [::-1] -- Reverse the list
    # [:-len(stack)+1-trim:] -- Keep all elements on back up to the trim
    # [-(trim+1)::] -- Keep all elements on front after the trim
    return " -> ".join([s[3] for s in inspect.stack()][-(trim[0]+1):-(len(inspect.stack())+1-trim[1]):-1])


def subTracer():
    '''
    Debug by printing all the programs farmed out to subprocess.Popen.communicate()
    '''
    def trace(frame, event, arg):
        if event != 'call':
            return
        name = str(frame.f_code.co_name)
        # subprocess library's "communicate"
        if name != 'communicate':
            return
        print(frame.f_locals['self'].args)

    sys.settrace(trace)


def addDelay(delay=1):
    def outer(func):
        def inner(*args, **kwargs):
            func(*args, **kwargs)
            time.sleep(delay)
        return inner
    return outer


def stackTracer():
    '''
    Debug by printing all the programs farmed out to subprocess.Popen.communicate()
    '''
    @addDelay(1)
    def trace(frame, event, arg):
        if event != 'call':
            return
        # Trim length = decorator calls and this function from the stack
        print(getstack(trim=(0,3)))

    sys.settrace(trace)



def tracer(delay=0):
    '''
    Debug by printing the stack during program execution.
    Creates a trace function and sets it to the global sys trace function.
            @delay -> optional delay to slow program execution
    '''
    import linecache

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

def varAttrs(someVar):
    '''Easy way to print the attributes of some object'''
    from pprint import pprint
    pprint(vars(someVar))

'''


    import logging
    for item, val in edited_entry.items():
        logging.error("{}: {}".format(item, type(val).__name__))

    logging.error("Username: {}".format(current_user))

'''



def pdb_kill():
    '''Run pdb on a KeyboardInterrupt (which maps to SIGINT)'''
    import signal
    import pdb
    def pdb_handler(signal, frame):
        pdb.set_trace()
    signal.signal(signal.SIGINT, pdb_handler)

def name(var):
    '''
    Hack to get the name of the variable passed in.
    '''
    import inspect
    local_vars = inspect.currentframe().f_locals.items()
    return [ name for name, val in local_vars if name is var ][0]

if __name__ == "__main__":
    import doctest
    doctest.testmod()
    print(getstack())
