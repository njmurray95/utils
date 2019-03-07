#!/usr/bin/env python3
#
# Useful tricks to apply in python

# Memoize functions
def memoize():
    import functools

    def fib(n):
        if n == 0:
            return 0
        elif n == 1:
            return 1
        return fib(n - 1) + fib(n - 2)

    import timeit
    timeit.timeit('fib(35)', globals=globals(), number=1)

    @functools.lru_cache
    def fib2(n):
        if n == 0:
            return 0
        elif n == 1:
            return 1
        return fib(n - 1) + fib(n - 2)
    timeit.timeit('fib2(35)', globals=memoize(), number=1)

if __name__ == "__main__":
    memoize()
