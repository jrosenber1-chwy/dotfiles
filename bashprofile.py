# Per https://www.rosipov.com/blog/profiling-slow-bashrc/
# Run as follows: 
# python3 bashprofile.py /tmp/bashstart.####.log -n 50
# -n argument is the number of results to show

import argparse
import heapq

parser = argparse.ArgumentParser(description='Analyze bashstart log for speed.')
parser.add_argument('filename', help='often /tmp/bashstart.<PID>.log')
parser.add_argument('-n', default=20, help='number of results to show')
args = parser.parse_args()
filename, n = args.filename, int(args.n)

with open(filename, 'r') as f:
    q = []
    prev_time = None
    for line in f.readlines():
        line = line.split()
        # Jeff added this terrible try/except block because the if statement below was throwing errors
        try:
            if '+' not in line[0] or len(line) < 3:
                continue
        except:
            continue
        text = ' '.join(line[2:])
        seconds, nanoseconds = line[1].split('.')
        time = int(nanoseconds)
        diff = time - prev_time if prev_time is not None else 0
        prev_time = time
        heapq.heappush(q, (diff, text))

for diff, text in heapq.nlargest(n, q):
    print float(diff) / 1000000000, 's:', text