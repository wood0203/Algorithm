#백준 7562번 나이트의 이동 문제
#분류별 문제 - DFS/BFS

import sys
from collections import deque

n = int(input())
if n > 0:
    pass
else:
    sys.exit()
move_x = [-1,1,2,2,1,-1,-2,-2]
move_y = [2,2,1,-1,-2,-2,-1,1]
for _ in range(n):
    l = int(input())
    a, b = map(int,input().split())
    da, db = map(int,input().split())
    board = [[0] * l for _ in range(l)]
    visited = [[False] * l for _ in range(l)]
    queue = deque()
    queue.append([a, b])
    visited[a][b] = True
    while queue:
        x, y = queue.popleft()
        if x == da and y == db:
            print(board[x][y])
            break
        for i in range(8):
            dx = x + move_x[i]
            dy = y + move_y[i]
            if 0 <= dx < l and 0 <= dy < l:
                if not visited[dx][dy]:
                    board[dx][dy] = board[x][y] + 1
                    queue.append([dx,dy])
                    visited[dx][dy] = True