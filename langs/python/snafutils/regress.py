
import sys
import time
import datetime
import functools

def getTag(tag=""):
    '''
    Generic method to get a tag for certain outputs. To be extended.
    '''
    # breakpoint()
    tag = '_'.join([
            tag,
            '-'.join([s.replace('-', '') for s in sys.argv[1:]]),
            datetime.datetime.now().strftime('%Y-%m-%d_%H-%m-%S')
    ])

    return tag

def timeExec(func, suppressErrors=False):
    '''
    Decorator to time trial an inner function every time it is run.
    Intended for use on complex functions that must be profiled in a working environment.
    >>> time.sleep = timeExec(time.sleep)
    >>> time.sleep(1)
    >>> timeExec._records # doctest: +ELLIPSIS
    [{'finished': True, 'return': None, 'runtime': ...}]
    >>> len(timeExec._records)
    1
    >>> time.sleep('lkjlkj') # doctest: +ELLIPSIS
    Traceback (most recent call last):
        ...
    TypeError: an integer is required (got type str)
    >>> timeExec._records[1] # doctest: +ELLIPSIS
    {'finished': False, 'error': TypeError('an integer is required (got type str)'), 'runtime': ...}
    '''

    timeExec._records = []

    @functools.wraps(func)
    def inner(*args, **kwargs):
        starttime = time.time()
        try:
            output = func(*args, **kwargs)
            rec = {
                'finished': True,
                'return': output
            }
        except Exception as e:
            rec = {
                'finished': False,
                'error': e
            }
            if not suppressErrors:
                raise(e)
        finally:
            rec['runtime'] = time.time() - starttime
            timeExec._records.append(rec)

        # print("Runtime: {}".format(runtime))
        return output
    return inner

if __name__ == "__main__":

    import doctest
    doctest.testmod()

