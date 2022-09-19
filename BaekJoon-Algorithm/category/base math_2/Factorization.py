import sys

n=int(input())
if 2 <= n and n <= 10000000: pass
elif n == 1: print()
else: sys.exit()

i=2
while i <= n:
    if n == 1: break
    elif n % i == 0:
        n = n // i
        print(i)
        i=2
    else: i += 1
