from snafutils import *

import os

def testtwo(a=4, b=5):
    showStacks()

def testone():
    c = 5
    testtwo()

def main():
    testone()

if __name__ == "__main__":
    # tracer(delay=1)
    main()
