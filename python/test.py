from utils import *

def a():
    print(5)

def b():
    print(6)
    a()

def c():
    print(7)
    b()

if __name__ == "__main__":
    tracer()
    c()
