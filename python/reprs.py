#!/usr/bin/env python3

class test():
    def __init__(self, name="Test"):
        self.name = name
    def __repr__(self):
        print(self.name)
        return self.name

if __name__ == "__main__":
    d = {}
    t = test()
    d[t] = 5


