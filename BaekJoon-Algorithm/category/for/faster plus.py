import sys
t=int(input())
if t < 1 or t > 1000000: sys.exit()
for i in range(t):
    a,b=map(int,sys.stdin.readline().split())
    if (a < 1 or a > 1000) or (b < 1 or b > 1000): sys.exit()
    print(a+b)