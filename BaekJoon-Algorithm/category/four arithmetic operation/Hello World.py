import sys

n,x=input().split()
if int(n)<1 or int(x)>10000 : sys.exit()
a=list(input().split())
for i in range(int(n)):
    if int(a[i]) < int(x): print(int(a[i]),end=' ')
if not a[0]:
    sys.exit()
