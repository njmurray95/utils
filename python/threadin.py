#!/usr/bin/env python3
from threading import *
from sys import argv

def thread_hello():
    other = Thread(target=thread_say_hello,
            args=('test',))

    other.start()
    thread_say_hello()

def thread_say_hello(text='hello from'):
    print(text, current_thread().name)

if __name__ == "__main__":
    thread_hello()
