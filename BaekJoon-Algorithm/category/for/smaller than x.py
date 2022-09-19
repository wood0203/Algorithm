import sys

x=int(input())
for i in range(x):
    a,b=input().split()
    if int(a)<=0 or int(b)>=10:
        sys.exit()
    print('Case #'+str(i+1)+': '+str(int(a)+int(b)))