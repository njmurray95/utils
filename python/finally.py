#!/usr/bin/env python3

def test():
    try:
        print("Try statement")
        raise StopIteration("Raised exception")
    finally:
        # This still executes
        print("Finally statement")

if __name__ == "__main__":
    try:
        test()
    except StopIteration:
        print("Except statement")
