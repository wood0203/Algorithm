import sys

a,b = map(int,sys.stdin.readline().split())
if a > 0 and b < 10: pass
else: sys.exit()

print(a+b)