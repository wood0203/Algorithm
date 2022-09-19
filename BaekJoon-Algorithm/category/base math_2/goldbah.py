import sys

a=[False,False]+[True]*9999
prime=[]
for i in range(2,10001):
    if a[i]:
        prime.append(i)
        for j in range(2*i,10001,i):
            a[j]=False

t = int(input())
for i in range(t):
    n = int(input())
    if n % 2 == 0 and 4 <= n <= 10000: pass
    else: sys.exit()

    i = int(n / 2)
    while True:
        if (i in prime) and (n-i in prime):
            print(i, n-i)
            break
        else: i -= 1