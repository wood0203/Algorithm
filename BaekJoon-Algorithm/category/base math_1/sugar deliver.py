import sys
from functools import reduce

t = int(input())
resident = 0
for i in range(t):
    k = int(input())
    n = int(input())
    if k < 1 or n > 14: sys.exit()
    apart = [list(map(lambda x: x + 1, range(n)))]
    for x in range(k):
        apart.append([1])
        for j in range(n-1):
            apart[x+1].append(reduce(lambda x,y : x+y , apart[x][:j+2]))
    print(apart[k][n-1])