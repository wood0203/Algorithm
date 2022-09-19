import sys

m, n = map(int,sys.stdin.readline().split())
if 1 <= m <= n and m <= n <= 1000000: pass
else: sys.exit()

a = [False, False] + [True] * (n-1)
t = int(n ** 0.5)
for i in range(2, t+1):
    if a[i]:
        for j in range(i+i, n+1, i):
            a[j] = False

for i in range(m,n+1):
    if a[i]:
        print(i)