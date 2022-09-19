#백준 1697번 숨바꼭질
#분류별 알고리즘 - DFS/BFS

import sys
from collections import deque

n, k = map(int,input().split())
if 0 <= n <= 100000 and 0 <= k <= 100000: pass
else: sys.exit()

lst = [0] * 200001
queue = deque()
queue.append(n)
if n == k:
    print(0)
    sys.exit()
while queue:
    x = queue.popleft()
    move_x = [1, -1, x]
    for i in range(3):
        dx = x + move_x[i]
        if 0 <= dx <= 200000:
            if lst[dx] == 0:
                lst[dx] = lst[x] + 1
                queue.append(dx)
    if lst[k] != 0:
        print(lst[k])
        break