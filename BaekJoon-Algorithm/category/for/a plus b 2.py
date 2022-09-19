import sys

t=int(input())
for i in range(t):
    a,b=map(int,sys.stdin.readline().split())
    if 0 < a and b < 10: pass
    else: sys.exit()

    print('Case #{}: {} + {} = {}'.format(i+1,a,b,a+b))