#!/usr/bin/env python

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
    """An iterator for integers diagonally, 0, 1, -1, 2, -2, 3, -3...
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

if __name__ == "__main__":
    import doctest
    doctest.testmod()
