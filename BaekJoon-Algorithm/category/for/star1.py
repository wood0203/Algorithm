import sys

n=int(input())
if 1 <= n <= 100: pass
else: sys.exit()

for i in range(n):
    print('*' * (i+1))