#!/usr/bin/env python3
# Utils for OS-related tasks -- paths, files, subprocess calls, etc.

def interactive():
    '''
    Return True if run in script, false otherwise.
    '''
    import __main__
    return not hasattr(__main__, __file__)

def basename(path):
    """
    Return the basename of a path.
    >>> basename("/usr/bin/env")
    'env'
    >>> basename("one/two/three/")
    'three'
    >>> basename("C:\Users\admin\notes.txt")
    'notes.txt'
    """
    import os
    return os.path.basename(os.path.normpath(path))

def get_cur_filepath():
    '''
    Return the path of the file where this code is run.
    '''
    import os
    if interactive():
        return os.getcwd()
    else:
        os.path.abspath(__file__)
        
    
def noisefile(filename, bytesize=1, zero=False):
    """
    Write a file of arbitrary or null data for n bytes.
    Useful for testing file limits, file transfers, etc.
    """
    import os
    import struct
    bytesize *= (1024**2) # 1 MB
    with open(filename + '.bin', 'wb') as f:
        if zero:
            f.seek(bytesize)
            f.write(struct.pack('B', 0))
        else:
            f.write(os.urandom(bytesize))
