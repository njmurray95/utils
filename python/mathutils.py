#!/usr/bin/env python
# Utils for math-related tasks -- iterations, plots, calculations, etc.

def naturals():
    """An iterator for natural numbers 0, 1, 2, 3...
    >>> n = naturals()
    >>> next(n)
    0
    >>> next(n)
    1
    >>> next(n)
    2
    """
    num = 0
    while True:
        yield num
        num += 1

def integers():
    """A generator for all integers, using Cantor's enumeration.
    >>> i = integers()
    >>> next(i)
    0
    >>> next(i)
    1
    >>> next(i)
    -1
    >>> next(i)
    2
    """
    num = 0
    yield 0
    while True:
        num += 1
        yield num
        yield num * -1

def fermat(a, p):
    """A quick sketch of fermat's little theorem"""
    print(a, "^", p, "=", a, "mod", p)
    for i in range(1, a):
        r = pow(i, p)
        print("{0:3} {1:20} {2:5}".format(i, r, r % i))

if __name__ == "__main__":
    import doctest
    doctest.testmod()
