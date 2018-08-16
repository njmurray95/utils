#!/usr/bin/env python

########################################
# Utilities
########################################

def naturals():
    '''A generator for all natural numbers.'''
    i = 0
    while True:
        yield i
        i += 1

def integers():
    '''A generator for all integers, using Cantor's enumeration.'''
    i = 0
    while True:
        yield i
        i = i * -1 + 1 # 1, 2, 3...
        yield i
        i = i * -1 # -1, -2, -3...

########################################
# Visualizations
########################################

def fermat(a, p):
    """A quick sketch of fermat's little theorem"""
    print(a, "^", p, "=", a, "mod", p)
    for i in range(1, a):
        r = pow(i, p)
        print("{0:3} {1:20} {2:5}".format(i, r, r % i))

