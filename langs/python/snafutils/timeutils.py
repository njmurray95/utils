#!/usr/bin/env python3
# Utils for time-related tasks -- timing program runtime, formatting dates, etc.

import time
import timeit
import subprocess

def gettime():
    """Time the execution of a program since its start.
    >>> gettime() == gettime()
    True
    >>> t1 = gettime()
    >>> t2 = gettime()
    >>> t1 == t2
    False
    """
    global stime
    if stime == None:
        settime()
    return time.time() - stime

def settime():
    """Set the start of the timer.""" 
    global stime
    stime = time.time()

def timecmd(cmd, quiet=False):
    """Time some system command."""
    if quiet:
        output="stdout=PIPE, stderr=PIPE,"
    else:
        output=""
    
    setup = "from subprocess import Popen, PIPE"
    cmd = "p = Popen('{}', {} shell=True); p.communicate()".format(cmd, output)
    timeit.timeit(setup=setup, stmt=cmd, number=1)
    