import sys

def factorial(x):
    if x > 0:
        return x * factorial(x-1)
    else:
        return 1

n = int(input())
if 0 <= n <= 12: pass
else: sys.exit()

print(factorial(n))