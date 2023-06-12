import timeit
import argparse
import subprocess

def runSeparate(cmd, N):
    '''Run the subprocess call N times)'''
    for i in range(N):
        p = subprocess.Popen(cmd.split(),
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                stderr=subprocess.DEVNULL,
                encoding='utf8')
        out = p.communicate()

def runAsGroup(cmd, N):
    '''Run one subprocess with N cmds'''
    joined = ";".join([ cmd ] * N)
    p = subprocess.Popen(joined,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            shell=True)

    out = p.communicate()[0]

def main(cmd, runs, trials):
    print("Comparing `{}`, run {} times ({} trials)".format(cmd, runs, trials))
    for func in [ runSeparate, runAsGroup ]:
        speed = timeit.timeit(lambda: func(cmd, runs), number=trials)
        print("{:>12}: {}".format(func.__name__, speed))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('command', type=str, nargs='+', default="echo 'hello world'",
            help='Command to time')
    parser.add_argument('-r', '--runs', type=int, default=4,
            help='Number of times to run each cmd.')
    parser.add_argument('-t', '--trials', type=int, default=10,
            help='Number of trials.')

    args = parser.parse_args()
    main(' '.join(args.command), args.runs, args.trials)
