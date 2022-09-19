import sys
import time

n=int(input())
s=time.time()
if 1 <= n <= 1000000000: pass
else: sys.exit()

if n == 1: print(1)
else:
    start=2
    end=1
    i=0
    while True:
        start += 6 * i
        end += 6 * (i+1)
        if n in range(start, end+1): break
        i += 1

    i += 2
    print(i)