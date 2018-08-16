#!/usr/bin/env python3

def shield(func):
    return (lambda: print("Overwritten"))

def shield2(func):
    def foo():
        print("Overwritten!")
    return foo

@shield
def test():
    print("test1")

@shield2
def test2():
    print("test2")

if __name__ == "__main__":
    test()
    test2()
