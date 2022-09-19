import sys

n=int(input())
if n > 0 or n <= 100000: pass
else: sys.exit()

for i in range(n):
    print(n-i)