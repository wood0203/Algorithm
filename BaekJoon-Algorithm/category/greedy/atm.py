import sys

n = int(input())
if 1 <= n <= 1000: pass
else: sys.exit()

p = list(map(int,sys.stdin.readline().split()))
if len(p) != n: sys.exit()

p = sorted(p)

time = 0
for i in range(len(p)):
    for j in range(i+1):
        time += p[j]
print(time)