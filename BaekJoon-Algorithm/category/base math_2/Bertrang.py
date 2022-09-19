import sys
import time

while True:
    n=int(input())
    if n == 0: break
    elif 1 <= n and n <= 123456: pass
    else: sys.exit()

    a = [False,False] + [True]*2*n
    prime=[]
    for i in range(2, 2*n + 1):
        if a[i]:
            prime.append(i)
            for j in range(2*i, 2*n+1, i):
                a[j]=False

    cnt=0
    for k in range(n+1, 2*n + 1):
        if a[k]:
            cnt +=1
    print(cnt)