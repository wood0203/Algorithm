import sys

n=int(input())
if n <= 100 and n >= 1: pass
else: sys.exit()

array=list(map(int,sys.stdin.readline().split()))
if max(array) <= 1000 and min(array) >= 1: pass
else: sys.exit()

sosu=0
for i in range(n):
    num = array[i]
    j=1
    cnt=0

    while j <= num:
        if num % j == 0:
            cnt += 1
        else: pass
        j += 1

    if cnt == 2:
        sosu += 1

print(sosu)