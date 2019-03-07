#!/usr/bin/env python3

class test:
    def __init__(self):
        self.d = {}
    def __getitem__(self, key):
        return self.d[key]
    def __setitem__(self, key, value):
        self.d[key] = value

def dummy():
    return 3

if __name__ == "__main__":
    t = test()
    t['hello'] = 'world'
    print(t['hello'])
    t['hello'] = dummy()
    print(t['hello'])
