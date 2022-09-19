# SAFFY 기출
# 백준 13458번 문제

import sys
from collections import deque

m, n = map(int,input().split())
box = []
for _ in range(n):
    box.append(list(map(int,sys.stdin.readline().split())))

dx = [-1,1,0,0]
dy = [0,0,-1,1]
queue = deque()

def bfs():
    while queue:                                    # 기존의 문제와 달리 while로 바로 시작.
        x, y = queue.popleft()
        for i in range(4):
            a = x + dx[i]
            b = y + dy[i]
            if 0 <= a < n and 0 <= b < m:
                if box[a][b] == 0:
                    box[a][b] = box[x][y] + 1       # !!미로문제와 비슷. +1을 하면서 최대 일수를 계산.
                    queue.append([a,b])


for i in range(n):
    for j in range(m):
        if box[i][j] == 1:
            queue.append([i,j])                     # !! 익은 토마토가 여러개 일 수 있으므로
                                                    # !! 바로 탐색을 시작하는게 아닌, 큐에 삽입시킨다.
bfs()
result = -2
isTrue = False
for i in box:
    for j in i:
        if j == 0:
            isTrue = True
        result = max(result, j)

if isTrue:                  # 안 익은 토마토가 있는 경우
    print(-1)
elif result == -1:          # 모두 -1인 경우
    print(0)
else:
    print(result - 1)       # 이미 모두 익어있는 경우(1-1 = 0 출력)와 일수 출력