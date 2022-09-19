#백준 1707번 이분 그래프
#분류별 알고리즘 - DFS/BFS

import sys
from collections import deque


def function():
    q = deque()


k = int(input())
if 2 <= k <= 5: pass
else: sys.exit()
for _ in range(k):
    v, e = map(int,input().split())
    if 1 <= v <= 20000 and 1 <= e <= 200000: pass
    else: sys.exit()
    graph = [[0] * v for _ in range(v)]
    for _ in range(e):
        x, y = map(int,input().split())
        graph[x-1][y-1] = graph[y-1][x-1] = 1
    function()
