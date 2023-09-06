
import time
import datetime
import functools

def getTag(tag=""):
    '''
    Generic method to get a tag for certain outputs. To be extended.
    '''
    tag = tag + "_" + datetime.datetime.now().strftime('%Y-%m-%d_%H-%m-%S')
    return tag

def timeExec(func):
    '''
    Decorator to time trial an inner function every time it is run.
    Intended for use on complex functions that must be profiled in a working environment.
    '''
    timeExec._run = 0
    timeExec._totalRuntime = 0
    timeExec._records = []

    @functools.wraps(func)
    def inner(*args, **kwargs):
        timeExec._run += 1
        starttime = time.time()
        try:
            output = func(*args, **kwargs)
            error = None
            finished = True
        except Exception as e:
            error = e
            finished = False
            output = None
        finally:
            runtime = time.time() - starttime
            timeExec._records.append({
                'runtime': runtime,
                'finished': finished,
                'error': error,
                'return': str(output)
            })

        print("Runtime: {}".format(runtime))
        return output
    return inner

if __name__ == "__main__":

    import time
    time.sleep = timeExec(time.sleep)
    time.sleep(1)
    time.sleep(1)
    time.sleep('lkjlkj')

    print(timeExec._records)

    goodtimes = sum([r['runtime'] for r in timeExec._records if r['finished']])
    badtimes = sum([r['runtime'] for r in timeExec._records if not r['finished']])
    print("Good times: {}".format(goodtimes))
    print("Bad times: {}".format(badtimes))
