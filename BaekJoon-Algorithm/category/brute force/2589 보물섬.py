import sys
from collections import deque

def num_restrict(x,a,b):
    # 수의 범위를 제한시켜주는 함수
    if x<a or x>b:
        sys.exit()

# 백준
# 브루트포스 알고리즘, BFS
# 2589번 보물섬
# 시간제한 1초

n, m = map(int,input().split())
num_restrict(n,1,50) # 1 <= n <= 50
num_restrict(m,1,50) # 1 <= m <= 50
maps = []
for _ in range(n):
    maps.append(list(sys.stdin.readline().rstrip()))


def bfs(a,b):
    board = [[0]*m for _ in range(n)]
    visited = [[False] * m for _ in range(n)]
    # visited = [[False]*m]*n 으로 선언하면
    visited[a][b] = True
    # 모든 행을 같은 객체로 인식해서 b열의 모든 행들을 True로 만듬.
    queue = deque([])
    queue.append([a,b])
    temp = 0
    while queue:
        x, y = queue.popleft()
        for i in range(4):
            dx = x+move_x[i]
            dy = y+move_y[i]
            if 0<=dx<n and 0<=dy<m:
                if maps[dx][dy] == 'L' and visited[dx][dy] == False:
                    board[dx][dy] = board[x][y] + 1
                    visited[dx][dy] = True
                    queue.append([dx, dy])
                    temp = board[dx][dy]
    return temp


move_x = [1,-1,0,0]
move_y = [0,0,-1,1]
result = -1
for i in range(n):
    for j in range(m):
        if maps[i][j] == 'L':
            result = max(bfs(i,j), result)
print(result)