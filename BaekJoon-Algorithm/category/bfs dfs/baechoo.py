# 백준 1012번 유기농 배추 문제
# 분류별 문제 - DFS와 BFS

import sys
from collections import deque


go_x = [-1,1,0,0]
go_y = [0,0,1,-1]

t = int(input())
for _ in range(t):
    m,n,k = map(int,input().split())
    if 1 <= m <= 50 and 1 <= n <= 50 and 1 <= k <= 2500: pass
    else: sys.exit()

    field = [[0] * n for _ in range(m)]

    for _ in range(k):
        x, y = map(int,input().split())
        if 0 <= x <= m-1 and 0 <= y <= n-1:
            field[x][y] = 1
        else: sys.exit()

    visited = [[False] * n for _ in range(m)]


    def farm(x, y):
        queue = deque()
        queue.append([x, y])
        visited[x][y] = True
        while queue:
            x, y = queue.popleft()
            stopper = 0
            while stopper < 4:
                dx = x + go_x[stopper]
                dy = y + go_y[stopper]
                stopper += 1
                if dx < 0 or dx >= m or dy < 0 or dy >= n:
                    continue
                if not visited[dx][dy] and field[x][y] == 1:
                    visited[dx][dy] = True
                    queue.append([dx,dy])

    cnt = 0
    for i in range(m):
        for j in range(n):
            if not visited[i][j] and field[i][j] == 1:
                farm(i,j)
                cnt += 1

    print(cnt)
