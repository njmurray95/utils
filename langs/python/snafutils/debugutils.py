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


def showStacks(trim=(1,1)):

    argstack = getArgstack(trim)
    localstack = getLocalstack(trim)

    import side_by_side
    import pprint
    side_by_side.print_side_by_side("Args: ", "Locals: ")
    for a, l in zip(argstack, localstack):
        side_by_side.print_side_by_side(
                pprint.pformat(a),
                pprint.pformat(l)
        )


def getArgstack(trim=(1,1)):
    """
    Return a string representing the current stack of args passed therein.
    >>> getArgstack(trim=(4,1))
    [('<module>', ([], None, None))]
    >>> (lambda x: getArgstack(trim=((4,1))))(x=5)
    [('<module>', ([], None, None)), ('<lambda>', (['x'], None, None))]
    """
    st = -1 * (trim[0] + 1)
    et = -1 * (len(inspect.stack()) + 1 - trim[1])
    stack = [s for s in inspect.stack()[st:et:-1]]
    namestack = [s[3] for s in stack]
    varstack = [inspect.getargvalues(s[0])[0:3] for s in stack]

    argstack = [(n, a) for n, a in zip(namestack, varstack)]
    return argstack


def getLocalstack(trim=(1,1)):
    """
    Return a string representing the current stack with locals at calltime.

    :param trim: Tuple of (unwanted) stack frames to remove from (start, end)
    >>> getArgstack(trim=(5,1))
    []
    >>> (lambda x: getLocalstack(trim=(5,1)))(x=5)
    [('<lambda>', {'x': 5})]
    >>> (lambda a, b: (lambda c : (getLocalstack(trim=(5,1))))(c=5))(a=1,b=3)
    [('<lambda>', {'a': 1, 'b': 3}), ('<lambda>', {'c': 5})]
    """
    st = -1 * (trim[0] + 1)
    et = -1 * (len(inspect.stack()) + 1 - trim[1])
    stack = [s for s in inspect.stack()[st:et:-1]]
    namestack = [s[3] for s in stack]
    varstack = [s.frame.f_locals for s in stack]

    localstack = [(n, a) for n, a in zip(namestack, varstack)]
    # import pprint
    # pprint.pprint(varstack)
    return localstack


def getStack(trim=(0,0)):
    """
    Return the stack as a string at time this function is called.
    >>> (lambda: getStack(trim=((4,0))))()
    '<module> -> <lambda> -> getStack'
    >>> (lambda: (lambda: getStack(trim=(4,0)))())()
    '<module> -> <lambda> -> <lambda> -> getStack'
    >>> (lambda: (lambda: (lambda: getStack())())())() # doctest: +SKIP
    >>> (lambda: (lambda: (lambda: getStack(trim=(4,0)))())())()
    '<module> -> <lambda> -> <lambda> -> <lambda> -> getStack'

    (Note: doctest would prepend '<module> -> testmod -> run -> __run -> ' if we did not skip.)
    """
    import inspect
    # inspect.stack() returns a list of frames, [3] is the function name
    # Index from [::-1] -- reverse the sort
    # These are equivalent
    # stack = [t[2] for t in traceback.extract_stack()]
    # stack = [s[3] for s in inspect.stack()]
    # argstack = inspect.getargvalues(

    # [::-1] -- Reverse the list
    # [:-len(stack)+1-trim:] -- Keep all elements on back up to the trim
    # [-(trim+1)::] -- Keep all elements on front after the trim
    st = -1 * (trim[0] + 1)
    et = -1 * (len(inspect.stack()) + 1 - trim[1])
    return " -> ".join([s[3] for s in inspect.stack()][st:et:-1])

    # The one-liner looks cool
    # return " -> ".join([s[3] for s in inspect.stack()][st:-(len(inspect.stack())+1-trim[1]):-1])


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

def setTracer(fn, delay=0):

    @addDelay(delay)
    def trace(frame, event, arg):
        if event != 'call':
            return
        # Trim length = decorator calls and this function from the stack
        fn()

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



def killForPDB():
    '''Run pdb on a KeyboardInterrupt (which maps to SIGINT)'''
    import signal
    import pdb
    def pdb_handler(signal, frame):
        pdb.set_trace()
    signal.signal(signal.SIGINT, pdb_handler)

def namestr(var):
    '''
    Hack to get the name of the variable passed in.
    '''
    import inspect
    local_vars = inspect.currentframe().f_locals.items()
    # This actually doesn't work because of a list comprehension scope issue
    # TODO: FIX (go for the simple loop?)
    return [ name for name, val in local_vars if name is var ]

def test():
    int_variable = 76
    breakpoint()
    return [name for name in locals() if locals()[name] == 76 ]

if __name__ == "__main__":
    import doctest
    doctest.testmod()
