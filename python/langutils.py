#!/usr/bin/env python3
# Utils for python language tasks -- whitespace, decorators, magic methods, etc.

def noop(func):
    """A decorator which renders null any function it modifies.
    >>> @noop
    >>> def test():
    >>>     return 5
    >>> test()
    None
    """
    return (lambda: None)

if __name__ == "__main__":
    import doctest
    doctest.testmod()
