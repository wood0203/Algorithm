import sys

def fibo(x):
    if x == 0:
        return 0
    elif x == 1:
        return 1
    else:
        return fibo(x-1) + fibo(x-2)

n = int(input())
if 0 <= n <= 20: pass
else: sys.exit()

print(fibo(n))