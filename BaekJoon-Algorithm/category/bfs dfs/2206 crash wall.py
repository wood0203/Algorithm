#백준 2206번 벽 부수고 이동하기
#분류별 알고리즘 - DFS/BFS
#참고 : https://pacific-ocean.tistory.com/348

import sys
from collections import deque


def bfs():
    q = deque()
    q.append([0,0,1])
    visited = [[[0] * 2 for _ in range(m)] for _ in range(n)]    # point 2. 벽을 뚫었으면 0, 안 뚫었으면 1
    visited[0][0][1] = 1                                         # 3중구조로 유연하게 풀 수 있음.
    while q:
        x, y, h = q.popleft()
        if x == n-1 and y == m-1:                                # point 3. 최단거리가 나오자마자 바로 return 으로 종료
            return visited[x][y][h]                              #          (복수 정답 방지)
        for i in range(4):
            dx = x + move_x[i]
            dy = y + move_y[i]
            if 0 <= dx < n and 0 <= dy < m:
                if maze[dx][dy] == 1 and h == 1:
                    visited[dx][dy][0] = visited[x][y][h] + 1
                    q.append([dx,dy,0])
                elif maze[dx][dy] == 0 and visited[dx][dy][h] == 0:
                    visited[dx][dy][h] = visited[x][y][h] + 1
                    q.append([dx,dy,h])
    return -1


n,m = map(int,input().split())
if 1 <= n <= 1000 and 1 <= m <= 1000: pass
else: sys.exit()
maze = []
for _ in range(n):
    maze.append(list(map(int, list(input().strip()))))      # point 1. 붙어있는 리스트를 정수형태로 받기
move_x = [-1,1,0,0]
move_y = [0,0,-1,1]
print(bfs())
