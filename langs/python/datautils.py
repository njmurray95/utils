#!/usr/bin/env python3

def imagifyData(filename):
    '''Open a binary data file and display its contents as an image.'''
    import numpy as np
    from matplotlib.pyplot import imshow

    with open(filename, 'rb') as f:
        buf = f.read()
    data = np.array(struct.unpack('=' + 'f' * 2 * row * col, gfb[8:]))
    cdata = data[::2] + 1j * data[1::2]
    cdata = cdata.reshape(row, -1)
    imshow(np.log(np.abs(cdata)), cmap='gray')
