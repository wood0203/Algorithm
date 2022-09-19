# 백준 7569 토마토 문제
# 3차원 BFS

import sys
from collections import deque

m, n, h = map(int,input().split())
box = []
for _ in range(h):
    temp = []
    for _ in range(n):
        temp.append(list(map(int,sys.stdin.readline().split())))
    box.append(temp)
queue = deque()
dx = [0,0,0,0,1,-1]
dy = [-1,1,0,0,0,0]         # 상 하 좌 우 위 아래
dz = [0,0,-1,1,0,0]

for i in range(h):
    for j in range(n):
        for k in range(m):
            if box[i][j][k] == 1:
                queue.append([i,j,k])


def bfs():
    while queue:
        x, y, z = queue.popleft()
        for i in range(6):
            a = x + dx[i]
            b = y + dy[i]
            c = z + dz[i]
            if 0 <= a < h and 0 <= b < n and 0 <= c < m:
                if box[a][b][c] == 0:
                    box[a][b][c] = box[x][y][z] + 1
                    queue.append([a,b,c])

bfs()
isTrue = False
result = -2
for i in box:
    for j in i:
        for k in j:
            if k == 0:
                isTrue = True
            result = max(result,k)
if isTrue:
    print(-1)
else:
    print(result - 1)