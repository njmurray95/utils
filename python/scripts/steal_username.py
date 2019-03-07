#!/usr/bin/env python2
# A script I wrote to extract a student's twitter username when they didn't provide it to us
# Not sure if this ever worked, but it shows some neat tricks for running and inspecting arbitrary code
import os
import sys
import signal
import inspect
import importlib

if len(sys.argv) != 2:
    print("usage: ./steal_username <python file>")
    sys.exit(1)

twitterbot_file = sys.argv[1].split('.')[0]

print("Checking " + str(twitterbot_file) + " module for twitter username...")

def fetch_username_tracer(frame, event, arg):
    try:
        # If the tweepy api is defined, grab its username
        handle = frame.f_locals['api'].auth.get_username()
        print('Handle found: ' + handle)
        sys.exit(0)
    # When api object isn't found
    except KeyError:
        pass

# Set fetch function to run after every line of code
sys.settrace(fetch_username_tracer)

# Load the twitterbot file module
module = importlib.import_module(twitterbot_file)

# Get its list of functions
funclist = inspect.getmembers(module, inspect.isfunction)

def timeout_handler(signum, frame):
    raise TimeoutError

# Time out student functions after 0.1 seconds
signal.signal(signal.SIGALRM, timeout_handler)
signal.alarm(1)

for funcName, func in funclist:
    # Run the target file and try to get the twitter handle
    print('Checking ' + funcName + '...')
    # Use argslist as makeshift parameters, will always have right number
    args = inspect.getargspec(func).args

    with open(os.devnull, 'w') as null:
        # Aggressively ignore errors from hack function call
        try:
            # Eliminate called function output
            tmp = sys.stdout
            sys.stdout = null
            func(*args)
        except Exception:
            pass
        finally:
            sys.stdout = tmp

print('Failed to find twitter username.')
