import sys

n = int(input())
if 1 <= n <= 100000: pass
else: sys.exit()

schedule = []
for i in range(n):
    start, end = map(int,sys.stdin.readline().split())
    if 0 <= start <= 2**31 - 1 and 0 <= end <= 2**31 - 1: pass
    else: sys.exit()
    schedule.append([start, end])

schedule = sorted(schedule, key = lambda x: x[0])
schedule = sorted(schedule, key = lambda x: x[1])

last = 0
cnt = 0
for i,j in schedule:
    if i >= last:
        cnt += 1
        last = j
print(cnt)