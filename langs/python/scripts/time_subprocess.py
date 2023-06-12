'''Script to time the differences between using many subprocess calls or one chained call.'''

import timeit
import subprocess

def subSeparate(cmd, N):
    '''Run the subprocess call N times)'''
    for i in range(N):
        p = subprocess.Popen(cmd.split(),
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                encoding='utf8')
        out = p.communicate()

def subGroup(cmd, N):
    '''Run one subprocess with N cmds'''
    joined = ";".join([ cmd ] * N)
    p = subprocess.Popen(joined,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            shell=True)

    out = p.communicate()[0]

def main():
    cmd = "echo 'hello world'"
    runs = 4
    print("Running `{}`, {} times".format(cmd, runs))
    for func in [ subSeparate, subGroup ]:
        speed = timeit.timeit(lambda: func(cmd, runs), number=10)
        print("{:>12}: {}".format(func.__name__, speed))

if __name__ == "__main__":
    main()
