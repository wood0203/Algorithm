# 백준 2178번 유기농 배추 문제
# 분류별 문제 - DFS와 BFS

import sys
from collections import deque

n,m = map(int,input().split())
if 2 <= n and m <= 100: pass
else: sys.exit()

maze = []
for _ in range(n):
    maze.append(list(input()))

dx = [1,-1,0,0]
dy = [0,0,1,-1]
queue = deque()
queue.append([0,0])
maze[0][0] = 1

while queue:                                                    # 굳이 매번 def 함수로 선언해줄 필요가 없다.
    x, y = queue.popleft()
    for i in range(4):
        a = x + dx[i]
        b = y + dy[i]
        if 0 <= a < n and 0 <= b < m and maze[a][b] == '1':     # !!<0 or >n 보다 효율적임.
            queue.append([a,b])                                 # !!visited 리스트 없이 '1' 인지 판단으로 최단거리 유도.
            maze[a][b] = maze[x][y] + 1

print(maze[n-1][m-1])