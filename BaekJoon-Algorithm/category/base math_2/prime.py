import sys

m=int(input())
n=int(input())
if m <= 10000 and n <= 10000 and m <= n: pass
else: sys.exit()

array=[]
sosu=0

for i in range(m, n+1):
    cnt=0
    for j in range(1,i+1):
        if i % j == 0: cnt += 1
        else: pass

    if cnt == 2: array.append(i)

if not array: print(-1)
else:
    print(sum(array))
    print(min(array))